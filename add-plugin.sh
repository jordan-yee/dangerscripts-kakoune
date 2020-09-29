#!/bin/sh

# This script is used to add a new plugin to this repository,
# including the submodule and related files.

# ------------------------------------------------------------------------------
# Get plugin and directory info

# If arg is given, assume it's the plugin URL
# If no args are given, prompt for the URL
if [ -z "$1" ]; then
    echo "Enter the URL for the plugin's Git repo:"
    read PLUGIN_URL
else
    PLUGIN_URL=$1
fi

# Get plugin naming strings
BASENAME=$(basename $PLUGIN_URL)
PLUGIN_NAME=${BASENAME%.git}
PLUGIN_FILESAFE_NAME=$(echo $PLUGIN_NAME | tr [:punct:] -)

# Get directory info for this script
SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

# ------------------------------------------------------------------------------
# Add plugin submodule

cd $SCRIPT_DIR
git submodule add $PLUGIN_URL plugins/$PLUGIN_NAME

# ------------------------------------------------------------------------------
# Create plugin config file

PLUGIN_CONFIG_FILE=$SCRIPT_DIR/plugin-configs/$PLUGIN_FILESAFE_NAME-config.kak

create_plugin_config_file () {
    mkdir $SCRIPT_DIR/plugin-configs
    echo "Creating $PLUGIN_CONFIG_FILE..."
    # NOTE: This here document must be indented with tabs!
	cat <<- EOF > $PLUGIN_CONFIG_FILE
	# Configuration for the \`$PLUGIN_NAME\` plugin
	# ${PLUGIN_URL%.git}

	# TODO: Add configuration here
	EOF
}

if [ -f "$PLUGIN_CONFIG_FILE" ]; then
    echo -n "An existing config file for this plugin has been found, replace it? [N/y]: "
    read REPLACE
    if [ "$REPLACE" = "y" ]; then
        create_plugin_config_file
    else
        echo "Leaving existing config file as-is..."
    fi
fi

# ------------------------------------------------------------------------------
# Create plugin install file

PLUGIN_INSTALL_FILE=$SCRIPT_DIR/plugin-installs/$PLUGIN_FILESAFE_NAME-install.sh

create_plugin_install_file () {
    mkdir $SCRIPT_DIR/plugin-installs
    echo "Creating $PLUGIN_INSTALL_FILE..."
    # NOTE: This here document must be indented with tabs!
	cat << EOF > $PLUGIN_INSTALL_FILE
	#!/bin/sh

	mkdir -pv ~/.config/kak/plugins/$PLUGIN_NAME

	SCRIPT_PATH=\$(realpath \$0)
	SCRIPT_DIR=\$(dirname \$SCRIPT_PATH)
	REPO_ROOT_PATH=\$(dirname \$SCRIPT_DIR)

	# TODO: cp relevant files into plugin directory created above
	cp -irv \$REPO_ROOT_PATH/plugins/$PLUGIN_NAME ~/.config/kak/plugins/
	EOF
}

if [ -f "$PLUGIN_INSTALL_FILE" ]; then
    echo -n "An existing install file for this plugin has been found, replace it? [N/y]: "
    read REPLACE
    if [ "$REPLACE" = "y" ]; then
        create_plugin_install_file
    else
        echo "Leaving existing install file as-is..."
    fi
fi
