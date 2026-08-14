#!/usr/bin/env bash
# infra/sync.sh
#
# Initializes and syncs the AOSP source tree. Intended to run on the build
# instance, from the directory that should become the AOSP source root
# (this repo's local_manifests/roomservice.xml is copied in as an overlay,
# not checked out into that tree).

set -euo pipefail

# android-latest-release is AOSP's officially recommended branch for staying
# current without tracking a specific numbered release — see
# https://source.android.com/docs/setup/reference/build-numbers
repo init -u https://android.googlesource.com/platform/manifest -b android-latest-release

mkdir -p .repo/local_manifests
cp "$(dirname "$0")/../local_manifests/roomservice.xml" .repo/local_manifests/roomservice.xml

repo sync -c -j"$(nproc)"

echo "sync.sh: done."
