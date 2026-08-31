#!/usr/bin/env bash
# infra/setup-instance.sh
#
# One-time provisioning for a fresh Ubuntu build instance (the future AWS EC2
# spot box). Installs the `repo` tool, a JDK, and the package list Google
# documents for AOSP builds on Ubuntu:
# https://source.android.com/docs/setup/build/initializing
#
# Run as a user with sudo access. Idempotent enough to re-run safely.

set -euo pipefail

sudo apt-get update

# AOSP's documented Ubuntu build-dependency list.
sudo apt-get install -y \
  git-core gnupg flex bison build-essential zip curl zlib1g-dev \
  libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev \
  libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc \
  unzip fontconfig

# AOSP builds ship their own prebuilt JDK under prebuilts/jdk, but a system
# JDK is still needed to run `repo` and assorted host tooling.
sudo apt-get install -y openjdk-17-jdk

sudo apt-get install -y awscli

# repo tool: Google's documented install (no apt package for this).
sudo curl -o /usr/local/bin/repo https://storage.googleapis.com/git-repo-downloads/repo
sudo chmod a+x /usr/local/bin/repo

echo "setup-instance.sh: done. repo, JDK, and AOSP build deps installed."
