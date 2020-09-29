#!/bin/sh

# Get directory info for this script
SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

# Ensure target directory exists
mkdir -p ~/.config/kak/autoload/rc

# Copy custom rc scripts into autoload
cp -irv $SCRIPT_DIR/rc ~/.config/kak/autoload/

# Prompt whether to copy official rc scripts now that you're using autoload
echo "Link official rc scripts to autoload as well? [Y/n]"
read COPY

if [ "$COPY" != "n" ]; then
    ln -sv /usr/local/share/kak/autoload ~/.config/kak/autoload/rc/official
fi
