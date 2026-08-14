#!/usr/bin/env bash
# Builds bootanimation.zip from logo-mark.svg: a plain fade-in loop of the
# NoxOS mark on its background navy, per Android's bootanimation format
# (desc.txt + numbered PNG frames per part, stored uncompressed).
#
# Not wired into any build target yet - there's no device tree to reference
# it from until P3/P4 (lightweight base) work starts. Generated here so the
# asset exists and is verified now rather than guessed at later.
#
# Requires: rsvg-convert, magick (ImageMagick), zip.
# Usage: generate-bootanimation.sh [width] [height] [fps] [out.zip]
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SVG="$SCRIPT_DIR/logo-mark.svg"
WIDTH="${1:-720}"
HEIGHT="${2:-1280}"
FPS="${3:-30}"
OUT="${4:-$SCRIPT_DIR/bootanimation.zip}"
FRAMES=24
ICON_SIZE=$((HEIGHT / 3))
BG="#0B1220"

work_dir=$(mktemp -d)
trap 'rm -rf "$work_dir"' EXIT
part_dir="$work_dir/part0"
mkdir -p "$part_dir"

rsvg-convert -w "$ICON_SIZE" -h "$ICON_SIZE" "$SVG" -o "$work_dir/icon.png"

for i in $(seq 0 $((FRAMES - 1))); do
  opacity=$(awk -v i="$i" -v n="$FRAMES" 'BEGIN { printf "%.1f", (i + 1) / n * 100 }')
  frame=$(printf "%05d" "$i")
  magick -size "${WIDTH}x${HEIGHT}" "xc:$BG" \
    \( "$work_dir/icon.png" -alpha set -channel A -evaluate multiply "$(awk -v o="$opacity" 'BEGIN{print o/100}')" +channel \) \
    -gravity center -compose over -composite \
    "$part_dir/$frame.png"
done

{
  echo "$WIDTH $HEIGHT $FPS"
  echo "p 0 0 part0"
} >"$work_dir/desc.txt"

rm -f "$OUT"
( cd "$work_dir" && zip -0 -r -X -q "$OUT" desc.txt part0 )

echo "wrote $OUT ($(du -h "$OUT" | cut -f1), ${FRAMES} frames @ ${WIDTH}x${HEIGHT}, ${FPS}fps)"
