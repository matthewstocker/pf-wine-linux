#!/usr/bin/env bash
set -euo pipefail

GAME_DIR="$HOME/.wine/drive_c/users/USERNAME/AppData/Local/PokeFields"
TMP_UPDATER="/tmp/pf-updater.exe"

# Copy a fresh updater out of the game folder so the original isn't running and can be replaced
cp -f "$GAME_DIR/pokefields-updater.exe" "$TMP_UPDATER"

export WINEPREFIX="$HOME/.wine"
export PROTONPATH="GE-Proton"

exec umu-run "$TMP_UPDATER" \
  --install-dir "$GAME_DIR/" \
  --main-exe "pokefields_windows.exe"

rm $TMP_UPDATER
