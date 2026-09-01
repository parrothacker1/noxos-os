#!/usr/bin/env bash
set -euo pipefail

S3_BUCKET="${NOXOS_S3_BUCKET:-noxos-releases}"
DEST="${1:-$HOME/cuttlefish/cf}"

LATEST_PREFIX=$(aws s3 ls "s3://${S3_BUCKET}/cuttlefish-local/" | awk '{print $2}' | sort | tail -1)
if [ -z "$LATEST_PREFIX" ]; then
  echo "no builds found under s3://${S3_BUCKET}/cuttlefish-local/" >&2
  exit 1
fi

mkdir -p "$DEST/download"
aws s3 sync "s3://${S3_BUCKET}/cuttlefish-local/${LATEST_PREFIX}" "$DEST/download"

cd "$DEST"
tar -xzf download/cvd-host_package.tar.gz
unzip -o download/*-img-*.zip

echo "fetch-latest-build.sh: staged at $DEST"
