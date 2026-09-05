#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:?usage: generate-ota.sh <version> <channel> [prev_version]}"
CHANNEL="${2:?usage: generate-ota.sh <version> <channel> [prev_version]}"
PREV_VERSION="${3:-}"

DEVICE="vsoc_x86_64"
DATE="$(date +%Y%m%d)"
S3_BUCKET="${NOXOS_S3_BUCKET:-noxos-releases}"
OTA_TOOL="out/host/linux-x86/bin/ota_from_target_files"
WORK_DIR="$(mktemp -d)"
trap 'rm -rf "$WORK_DIR"' EXIT

TF_ZIP=$(ls out/dist/*-target_files-*.zip)

TF_KEY="target-files/${DEVICE}/${CHANNEL}/${VERSION}.zip"
aws s3 cp "$TF_ZIP" "s3://${S3_BUCKET}/${TF_KEY}"

FULL_NAME="noxos-${VERSION}-${DATE}-${CHANNEL}-${DEVICE}.zip"
FULL_OTA="${WORK_DIR}/${FULL_NAME}"
"$OTA_TOOL" "$TF_ZIP" "$FULL_OTA"

aws s3 cp "$FULL_OTA" "s3://${S3_BUCKET}/full/${FULL_NAME}"
sha256sum "$FULL_OTA" | awk '{print $1}' > "${FULL_OTA}.sha256"
aws s3 cp "${FULL_OTA}.sha256" "s3://${S3_BUCKET}/full/${FULL_NAME}.sha256"

if [ -n "$PREV_VERSION" ]; then
  PREV_TF="${WORK_DIR}/${PREV_VERSION}-target_files.zip"
  PREV_TF_KEY="target-files/${DEVICE}/${CHANNEL}/${PREV_VERSION}.zip"

  if aws s3 cp "s3://${S3_BUCKET}/${PREV_TF_KEY}" "$PREV_TF"; then
    PATCH_NAME="noxos-${PREV_VERSION}-to-${VERSION}-${DATE}-${CHANNEL}-${DEVICE}.patch.zip"
    PATCH_OTA="${WORK_DIR}/${PATCH_NAME}"
    "$OTA_TOOL" --incremental "$PREV_TF" "$TF_ZIP" "$PATCH_OTA"

    aws s3 cp "$PATCH_OTA" "s3://${S3_BUCKET}/patches/${PATCH_NAME}"
    sha256sum "$PATCH_OTA" | awk '{print $1}' > "${PATCH_OTA}.sha256"
    aws s3 cp "${PATCH_OTA}.sha256" "s3://${S3_BUCKET}/patches/${PATCH_NAME}.sha256"
  else
    echo "generate-ota.sh: no target_files found for ${PREV_VERSION}, skipping patch" >&2
  fi
fi

echo "generate-ota.sh: done. full=s3://${S3_BUCKET}/full/${FULL_NAME}"
