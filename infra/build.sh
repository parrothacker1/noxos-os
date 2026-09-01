#!/usr/bin/env bash
# infra/build.sh
#
# Builds Cuttlefish. Must run from the AOSP source root after infra/sync.sh
# has completed. Phase 1 goal is just proving an unmodified Cuttlefish image
# compiles and boots - no custom lunch target yet.

set -euo pipefail

# x86_64 Cuttlefish is the default target since it's the fastest to build
# and boot for a first-boot smoke test. Swap to aosp_cf_arm64_phone-userdebug
# to build the arm64 variant instead.
LUNCH_TARGET="${LUNCH_TARGET:-aosp_cf_x86_64_phone-trunk_staging-userdebug}"

source build/envsetup.sh
lunch "$LUNCH_TARGET"
m dist

S3_BUCKET="${NOXOS_S3_BUCKET:-noxos-releases}"
S3_PREFIX="cuttlefish-local/$(date +%Y%m%d)-${LUNCH_TARGET}"

aws s3 cp out/dist/cvd-host_package.tar.gz "s3://${S3_BUCKET}/${S3_PREFIX}/cvd-host_package.tar.gz"
for img in out/dist/*-img-*.zip; do
  aws s3 cp "$img" "s3://${S3_BUCKET}/${S3_PREFIX}/$(basename "$img")"
done

echo "build.sh: done. dist output under out/dist, uploaded to s3://${S3_BUCKET}/${S3_PREFIX}/"
