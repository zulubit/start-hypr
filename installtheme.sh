#!/bin/bash

# Define URLs for the assets
NORDIC_URL="https://github.com/EliverLara/Nordic/releases/download/v2.2.0/Nordic.tar.xz"
HACK_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip"
BANANA_CURSOR_URL="https://github.com/ful1e5/banana-cursor/releases/download/v2.0.0/Banana.tar.xz"

# Define the destination directories
THEME_DIR="$HOME/.themes/Nordic"
FONT_DIR="$HOME/.fonts"
CURSOR_DIR="$HOME/.local/share/icons/Banana"
TMP_DIR="/tmp/theme_install"

# Create a temporary directory for downloads
mkdir -p "$TMP_DIR"

# Function to download a file and check if the download was successful
download() {
    local url=$1
    local dest=$2
    echo "Downloading $url..."
    wget -O "$dest" "$url"
    if [[ $? -ne 0 ]]; then
        echo "Error downloading $url"
        exit 1
    fi
}

# Download and extract the Nordic theme
NORDIC_ARCHIVE="$TMP_DIR/Nordic.tar.xz"
download "$NORDIC_URL" "$NORDIC_ARCHIVE"
mkdir -p "$THEME_DIR"
echo "Extracting Nordic theme to $THEME_DIR..."
tar -xvf "$NORDIC_ARCHIVE" -C "$THEME_DIR" --strip-components=1
if [[ $? -ne 0 ]]; then
    echo "Error extracting Nordic theme to $THEME_DIR"
    exit 1
fi
echo "Nordic theme installed successfully to $THEME_DIR."

# Download and extract Hack font
HACK_ARCHIVE="$TMP_DIR/Hack.zip"
download "$HACK_URL" "$HACK_ARCHIVE"
mkdir -p "$FONT_DIR"
echo "Extracting Hack fonts to $FONT_DIR..."
unzip -o "$HACK_ARCHIVE" -d "$FONT_DIR"
if [[ $? -ne 0 ]]; then
    echo "Error extracting Hack fonts to $FONT_DIR"
    exit 1
fi
fc-cache -fv
echo "Hack fonts installed successfully to $FONT_DIR!"

# Download and extract Banana Cursor
BANANA_CURSOR_ARCHIVE="$TMP_DIR/Banana.tar.xz"
download "$BANANA_CURSOR_URL" "$BANANA_CURSOR_ARCHIVE"
mkdir -p "$CURSOR_DIR"
echo "Extracting Banana cursor theme to $CURSOR_DIR..."
tar -xvf "$BANANA_CURSOR_ARCHIVE" -C "$CURSOR_DIR" --strip-components=1
if [[ $? -ne 0 ]]; then
    echo "Error extracting Banana cursor theme to $CURSOR_DIR"
    exit 1
fi
echo "Banana cursor theme installed successfully to $CURSOR_DIR!"

# Cleanup
echo "Cleaning up temporary files..."
rm -rf "$TMP_DIR"
rm -rf "$HOME/.cache"

# Optionally create a symlink for the cursor
# sudo ln -s ~/.local/share/icons/Banana ~/.local/share/icons/default

echo "Installation completed successfully!"

