#!/bin/sh

mkdir -pv ~/.config/kak/plugins/auto-pairs.kak

SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)
REPO_ROOT_PATH=$(dirname $SCRIPT_DIR)

cp -iv $REPO_ROOT_PATH/plugins/auto-pairs.kak/rc/auto-pairs.kak ~/.config/kak/plugins/auto-pairs.kak/
