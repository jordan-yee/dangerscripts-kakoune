#!/bin/sh

mkdir -pv ~/.config/kak/plugins/case.kak

SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)
REPO_ROOT_PATH=$(dirname $SCRIPT_DIR)

cp -irv $REPO_ROOT_PATH/plugins/case.kak ~/.config/kak/plugins/
