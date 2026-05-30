#!/usr/bin/env bash
# Render landing/index.html to A4 PDF in both languages via headless Chrome.
# Output goes to landing/dist/Gregory_Agapov_Resume.{en,ru}.pdf
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

render() {
  local lang="$1"
  local out="$OUT_DIR/Gregory_Agapov_Resume.$lang.pdf"
  local profile
  profile="$(mktemp -d)"
  local url="file://$SRC?lang=$lang&theme=light&print=1"

  echo "Rendering $lang -> $out"
  # New headless Chrome sometimes refuses to exit after --print-to-pdf;
  # wrap it with gtimeout so the build doesn't hang. PDF is written before exit.
  local timeout_bin=""
  if command -v gtimeout >/dev/null 2>&1; then
    timeout_bin="gtimeout"
  elif command -v timeout >/dev/null 2>&1; then
    timeout_bin="timeout"
  fi

  ${timeout_bin:+$timeout_bin --kill-after=5 25} "$CHROME" \
    --headless=new \
    --disable-gpu \
    --no-sandbox \
    --hide-scrollbars \
    --no-pdf-header-footer \
    --user-data-dir="$profile" \
    --print-to-pdf="$out" \
    "$url" >/dev/null 2>&1 || true

  rm -rf "$profile"
  if [[ ! -s "$out" ]]; then
    echo "Failed to render $out" >&2
    return 1
  fi
  ls -lh "$out"
}

render en
render ru

echo "Done."
