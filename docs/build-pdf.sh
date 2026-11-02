#!/usr/bin/env bash
# Render docs/index.html to A4 PDF in both languages via headless Chrome.
# Output goes to docs/dist/Gregory_Agapov_Resume.{en,ru}.pdf
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT_DIR="$HERE/dist"
SRC="$HERE/index.html"
CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"

if [[ ! -x "$CHROME" ]]; then
  echo "Chrome not found at: $CHROME" >&2
  echo "Set CHROME=/path/to/chrome and retry." >&2
  exit 1
fi

if [[ ! -f "$SRC" ]]; then
  echo "Source not found: $SRC" >&2
  exit 1
fi

mkdir -p "$OUT_DIR"

# Chrome can keep running after writing an export; validate the fresh temporary
# output before replacing any tracked asset.
timeout_bin=""
if command -v gtimeout >/dev/null 2>&1; then
  timeout_bin="gtimeout"
elif command -v timeout >/dev/null 2>&1; then
  timeout_bin="timeout"
fi

render_header() {
  local profile
  profile="$(mktemp -d)"
  local out="$profile/print-header.png"

  echo "Rendering opaque PDF header artwork"
  ${timeout_bin:+$timeout_bin --kill-after=5 25} "$CHROME" \
    --headless=new --disable-gpu --no-sandbox --hide-scrollbars \
    --user-data-dir="$profile" \
    --force-device-scale-factor=3 --window-size=794,330 \
    --screenshot="$out" \
    "file://$HERE/assets/print-header.html" >/dev/null 2>&1 || true

  if [[ ! -s "$out" ]]; then
    rm -rf "$profile"
    echo "Failed to render PDF header artwork" >&2
    return 1
  fi
  mv "$out" "$HERE/assets/print-header.png"
  rm -rf "$profile"
}

render() {
  local lang="$1"
  local profile
  profile="$(mktemp -d)"
  local out="$profile/resume.pdf"
  local target="$OUT_DIR/Gregory_Agapov_Resume.$lang.pdf"
  local url="file://$SRC?lang=$lang&print=1"

  echo "Rendering $lang -> $target"

  ${timeout_bin:+$timeout_bin --kill-after=5 25} "$CHROME" \
    --headless=new \
    --disable-gpu \
    --no-sandbox \
    --hide-scrollbars \
    --no-pdf-header-footer \
    --user-data-dir="$profile" \
    --print-to-pdf="$out" \
    "$url" >/dev/null 2>&1 || true

  if [[ ! -s "$out" ]]; then
    rm -rf "$profile"
    echo "Failed to render $target" >&2
    return 1
  fi
  mv "$out" "$target"
  rm -rf "$profile"
  ls -lh "$target"
}

render_header
render en
render ru

echo "Done."
