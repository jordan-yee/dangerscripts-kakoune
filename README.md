# dangerscripts-kakoune
My portable Kakoune configuration.

# Overview

The goal of this project is to package all of my Kakoune configuration in one place
and provide a way to generate a kakrc compatible with any given system I want to
run Kakoune on, which may not have the dependencies needed for all of the plugins
included in a full configuration.

# Installation

Clone the repository and all submodules:
```
git clone --recurse-submodules https://github.com/jordan-yee/dangerscripts-kakoune.git

# If you forget the --recurse-submodules flag, clone the submodules:
git submodule update --init
```

To load an explicitly defined subset of the included plugins:
```
git clone https://github.com/jordan-yee/dangerscripts-kakoune.git
git submodule init <list> <of> <submodule> <names>
git submodule update
```

To interactively select and install plugins and a kakrc containing your custom
configuration for the selected plugins:
```
chmod +x ./install-kakrc.sh
./install-kakrc.sh
```

To install custom rc scripts and enable the local autoload directory:
```
chmod +x ./install-autoload-rc.sh
./install-autoload-rc.sh
```

# Project Components

## Base kakrc

The kakrc file is a minimal configuration meant to work on any system that has Kakoune
installed, and which makes no assumptions about other available software.

## Plugins

Plugins are Kakoune extension scripts that exist in a dedicated Git repository.

To add a plugin, run the `add-plugin.sh` script.
```
chmod +x ./add-plugin.sh
./add-plugin.sh
```

This script adds 3 things to this repository:
1. A submodule for the plugin repository in the `/plugins` directory.
2. A `<plugin-name>-config.kak` file for the plugin in the `/plugin-configs` directory.
   - Add necessary configuration for the plugin to this file. This includes source
     statements for .kak scripts, plus other things such as setting user mappings
     and plugin options.
3. A `<plugin-name>-install.sh` script for the plugin in the `/plugin-installs` directory.
   - By default a script is generated that copies the plugin repository directory to the `~/.config/kak/plugins/<plugin-name>-directory`.

## Custom Autoload Scripts

The `rc/custom/` directory is for stand-alone kak scripts that aren't published
to their own plugin repository. This directory is structured so that it can be merged
with the rc folder that ships with Kakoune. Add your custom .kak scripts here.

Running the install script will copy the `rc/custom/` directory the user autoload,
and prompt whether to link the official rc scripts in order to retain the functionality
they provide.

# TODO

- [ ] Review configuration scripts to make sure files are sourced as needed.
- [ ] Handle load order for dependent plugins.
