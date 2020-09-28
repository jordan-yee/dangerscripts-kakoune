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

- Add plugins as a sub-module in the plugins directory.
  ```
  # From root of repository:
  git submodule add <plugin clone url> plugins/<plugin-name>
  git add .
  git commit -m "Add <plugin-name> submodule"
  ```
- Add a <plugin-name>-config.kak file for each plugin to the plugin-configs directory
  that defines the custom configuration specific to the plugin.
- Add a <plugin-name>-install.sh file for each plugin to the plugin-installs directory
  that performs the actions needed to install the plugin on the current machine.

# Installation Scripts [TODO]

- [ ] Create scripts that automatically add selected plugins and configuration options
  to a Kakoune installation on the current system.
