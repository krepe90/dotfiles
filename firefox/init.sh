#!/bin/bash

SOURCE_FILE="$HOME/dotfiles/firefox/userChrome.css"
FIREFOX_PROFILES_DIR="$HOME/Library/Application Support/Firefox/Profiles"
shopt -s nullglob
PROFILE_DIRS=("$FIREFOX_PROFILES_DIR"/*.default-release)
shopt -u nullglob

if [ ${#PROFILE_DIRS[@]} -eq 0 ]; then
    echo "No Firefox profile found in $FIREFOX_PROFILES_DIR"
    exit 1
fi

if [ ${#PROFILE_DIRS[@]} -gt 1 ]; then
    echo "Multiple Firefox profiles found in $FIREFOX_PROFILES_DIR:"
    printf " - %s\n" "${PROFILE_DIRS[@]}"
    exit 1
fi

PROFILE_DIR="${PROFILE_DIRS[0]}"
CHROME_DIR="$PROFILE_DIR/chrome"
if [ ! -d "$CHROME_DIR" ]; then
    mkdir -p "$CHROME_DIR"
fi

TARGET_LINK="$CHROME_DIR/userChrome.css"
ln -sf "$SOURCE_FILE" "$TARGET_LINK"
echo "Linked $SOURCE_FILE to $TARGET_LINK"
