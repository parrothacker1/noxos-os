# noxos-os

AOSP customization for NoxOS: local manifest, build config patches (GMS/bloat strip, font/locale trim, kernel defconfig), `/infra` build pipeline scripts, and the CI workflow that triggers AOSP compiles on the self-hosted runner.

Does not contain AOSP source itself — referenced via a `repo` tool local manifest.

Status: Phase 1 (build environment + unmodified Cuttlefish boot) not yet started.
