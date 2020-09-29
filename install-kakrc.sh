#!/bin/sh

# This script generates a kakrc that starts with `./kakrc-base.kak`, and appends
# specified plugin configs.

# Get directory info for this script
SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

# Copy kakrc-base.kak as starting point for generated kakrc
cp -v $SCRIPT_DIR/kakrc-base.kak $SCRIPT_DIR/kakrc

# Get list of configured plugins
PLUGINS=$(find $SCRIPT_DIR/plugins/ -mindepth 1 -maxdepth 1 -type d)

# Iterate through each plugin
for PLUGIN in ${PLUGINS[*]}
do
    PLUGIN_NAME=$(basename $PLUGIN)
    echo -en "\nInstall plugin: $PLUGIN_NAME? [Y/n]"
    read INSTALL
    if [ "$INSTALL" != "n" ]; then
        PLUGIN_FILESAFE_NAME=$(echo $PLUGIN_NAME | tr [:punct:] -)
        PLUGIN_CONFIG_FILE=$SCRIPT_DIR/plugin-configs/$PLUGIN_FILESAFE_NAME-config.kak
        echo -e "\n# ------------------------------------------------------------------------------" >> $SCRIPT_DIR/kakrc
        cat $PLUGIN_CONFIG_FILE >> $SCRIPT_DIR/kakrc
        PLUGIN_INSTALL_FILE=$SCRIPT_DIR/plugin-installs/$PLUGIN_FILESAFE_NAME-install.sh
        /bin/sh $PLUGIN_INSTALL_FILE
    else
        echo -e "Skipping $PLUGIN_NAME..."
    fi
done

# Copy kakrc into config directory
cp -iv $SCRIPT_DIR/kakrc ~/.config/kak/kakrc

# !HOLD OPEN FOR DEVELOPMENT!
#echo -e "\nPress enter to exit"
#read
