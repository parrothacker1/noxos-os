#!/usr/bin/env bash
set -euo pipefail

CUTTLEFISH_DIR="${CUTTLEFISH_DIR:-$HOME/tools/android-cuttlefish}"
IMAGE_TAG="cuttlefish-host:latest"
CONTAINER_NAME="cuttlefish_orchestrator"

check_prereqs() {
  [ -e /dev/kvm ] || { echo "missing /dev/kvm" >&2; exit 1; }
  [ -r /dev/kvm ] || { echo "/dev/kvm not readable by $USER" >&2; exit 1; }
  [ -e /dev/net/tun ] || { echo "missing /dev/net/tun" >&2; exit 1; }
  docker info >/dev/null 2>&1 || { echo "docker daemon not running" >&2; exit 1; }
}

build_image() {
  if [ ! -d "$CUTTLEFISH_DIR/.git" ]; then
    git clone https://github.com/google/android-cuttlefish.git "$CUTTLEFISH_DIR"
  fi
  docker build \
    -t "$IMAGE_TAG" \
    -f "$CUTTLEFISH_DIR/container/image/Containerfile" \
    --build-arg REPO=android-cuttlefish \
    "$CUTTLEFISH_DIR"
}

start_container() {
  docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
  docker run -d \
    --name "$CONTAINER_NAME" \
    --privileged \
    --device /dev/kvm \
    --device /dev/net/tun \
    -p 1080:1080 -p 1443:1443 \
    -p 2080:2080 -p 2443:2443 \
    -p 6520-6530:6520-6530 \
    "$IMAGE_TAG"
  echo "web UI: http://localhost:1080  adb: adb connect localhost:6520"
}

stop_container() {
  docker stop "$CONTAINER_NAME" && docker rm "$CONTAINER_NAME"
}

case "${1:-}" in
  --prereq-check) check_prereqs ;;
  --build) check_prereqs; build_image ;;
  --start) check_prereqs; start_container ;;
  --stop) stop_container ;;
  "") check_prereqs; build_image; start_container ;;
  *) echo "usage: $0 [--prereq-check|--build|--start|--stop]" >&2; exit 1 ;;
esac
