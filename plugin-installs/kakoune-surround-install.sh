#!/bin/sh

mkdir -pv ~/.config/kak/plugins/kakoune-surround

SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)
REPO_ROOT_PATH=$(dirname $SCRIPT_DIR)

cp -iv $REPO_ROOT_PATH/plugins/kakoune-surround/surround.kak ~/.config/kak/plugins/kakoune-surround/
