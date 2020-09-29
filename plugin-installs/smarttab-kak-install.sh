#!/bin/sh

mkdir -pv ~/.config/kak/plugins/smarttab.kak

SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)
REPO_ROOT_PATH=$(dirname $SCRIPT_DIR)

cp -irv $REPO_ROOT_PATH/plugins/smarttab.kak ~/.config/kak/plugins/
