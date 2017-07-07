#!/bin/bash

[[ "$EBE_OVERLAYS" ]] || {
  echo "EBE overlays not defined - skipping"
  exit 0
}

[[ $(ls -A "$EBE_OVERLAYS") ]] || {
  echo "EBE overlays directory is empty or doesn't exist - skipping"
  exit 0
}

# remove all symlinks that would become broken
echo "Fixing symlinks in EBE overlays"

fixlink() {
  DST=$(readlink "$1")
  if [[ -e "$EBE_OVERLAYS/$DST" ]] || [[ -e "$TARGET_DIR/$DST" ]]; then
    echo "$1: link ok..."
  else
    echo "$1: link would be broken, unlinking..."
    unlink "$1"
  fi
}

export -f fixlink
find "$EBE_OVERLAYS" -type l -exec bash -c 'fixlink "$0"' {} \;

echo "Installing EBE overlays from $EBE_OVERLAYS"
cp -rf "$EBE_OVERLAYS"/* "$TARGET_DIR"/
