#!/bin/sh

mkdir -pv ~/.config/kak/plugins/kakoune-git-mode

SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)
REPO_ROOT_PATH=$(dirname $SCRIPT_DIR)

# TODO: cp relevant files into plugin directory created above
cp -irv $REPO_ROOT_PATH/plugins/kakoune-git-mode ~/.config/kak/plugins/
