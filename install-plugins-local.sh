# Get directory info for this script
SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

cp -irv $SCRIPT_DIR/plugins-local ~/.config/kak/
