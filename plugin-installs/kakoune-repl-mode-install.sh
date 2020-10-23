#!/bin/sh

mkdir -pv ~/.config/kak/plugins/kakoune-repl-mode

SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)
REPO_ROOT_PATH=$(dirname $SCRIPT_DIR)

cp -iv $REPO_ROOT_PATH/plugins/kakoune-repl-mode/repl-mode.kak ~/.config/kak/plugins/kakoune-repl-mode/
