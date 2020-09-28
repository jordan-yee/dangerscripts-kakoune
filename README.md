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
```

To load an explicitly defined subset of the included plugins:
```
git clone https://github.com/jordan-yee/dangerscripts-kakoune.git
git submodule init <list> <of> <submodule> <names>
git submodule update
```

# Base kakrc

The kakrc file is a minimal configuration meant to work on any system that has Kakoune
installed, and which makes no assumptions about other available software.

# Adding Plugins

To add a plugin, run the `add-plugin.sh` script.
```
chmod +x ./add-plugin.sh
./add-plugin.sh
```

This script adds 3 things to this repository:
1. A submodule for the plugin repository in the plugins directory.
2. A <plugin-name>-config.kak file for the plugin in the plugin-configs directory.
   - Add necessary configuration for the plugin to this file. This includes source
     statements for .kak scripts, plus other things such as setting user mappings
     and plugin options.
3. A <plugin-name>-install.sh script for the plugin in the plugin-installs directory.
   - By default a script is generated that copies the plugin repository directory to the ~/.config/kak/plugins/<plugin-name> directory.

# Installation Scripts (TODO)

- [ ] Create scripts that automatically add selected plugins and configuration options
      to a Kakoune installation on the current system.
