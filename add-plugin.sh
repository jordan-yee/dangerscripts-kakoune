#!/bin/sh

# IN PROGRESS

# This script is used to add a new plugin to this repository,
# including the submodule and related files.

echo "Enter the plugin's git clone URL:"
read PLUGIN_URL

BASENAME=$(basename $PLUGIN_URL)
PLUGIN_NAME=${BASENAME%.*}

echo $PLUGIN_NAME
git submodule add $PLUGIN_URL ./plugins/$PLUGIN_NAME

# Create plugin config file
PLUGIN_CONFIG_FILE=./plugin-configs/$PLUGIN_NAME-config.kak
cat << EOF > $PLUGIN_CONFIG_FILE
# Configuration for the \`$PLUGIN_NAME\` plugin
EOF

# Create plugin install file
PLUGIN_INSTALL_FILE=./plugin-installs/$PLUGIN_NAME-install.sh
cat << EOF > $PLUGIN_INSTALL_FILE
#!/bin/sh

mkdir -pv ~/.config/kak/plugins/$PLUGIN_NAME

# TODO: cp relevant files into plugin directory created above
cp -iv ./plugins/$PLUGIN_NAME ~/.config/kak/plugins/$PLUGIN_NAME
EOF

# HOLD OPEN FOR DEVELOPMENT
# echo "Press enter to exit..."
# read FOO
