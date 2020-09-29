#!/bin/sh

mkdir -pv ~/.config/kak/plugins/kakoune-buffers

SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)
REPO_ROOT_PATH=$(dirname $SCRIPT_DIR)

cp -iv $REPO_ROOT_PATH/plugins/kakoune-buffers/buffers.kak ~/.config/kak/plugins/kakoune-buffers/
