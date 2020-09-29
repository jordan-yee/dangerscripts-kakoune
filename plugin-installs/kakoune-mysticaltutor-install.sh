#!/bin/sh

# Get directory info for this script
SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)
REPO_ROOT_PATH=$(dirname $SCRIPT_DIR)

# Ensure required directories exist
mkdir -pv ~/.config/kak/colors

# Copy theme to Kakoune config directory
cp -iv $REPO_ROOT_PATH/plugins/kakoune-mysticaltutor/mysticaltutor.kak ~/.config/kak/colors/
