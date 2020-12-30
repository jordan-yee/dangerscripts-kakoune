# dangerscripts-kakoune
A portable Kakoune configuration management project.

# Overview

The goal of this project is to package all desired Kakoune configuration in one
place and provide a way to generate a subset configuration that's compatible
with any given system, which may not have the dependencies needed for all the
plugins included in a full configuration.

This is useful for anyone working on air-gapped networks or restricted environments.

# Installation

## Managing This Repository

Since this project uses submodules to manage plugins, there's a bit more to do when
working with this repository than there would be for the typical repository that
doesn't have submodules.

Clone the repository and all submodules:
```
# (A) One-shot command:
git clone --recurse-submodules https://github.com/jordan-yee/dangerscripts-kakoune.git
# NOTE: You may run into trouble if you're on a network that messes with SSL certs.
#       The quick-n-dirty solution is to disable SSL verifification for Git:
#        git config --global http:sslVerify false

# (B) If you forgot the --recurse-submodules flag, clone the submodules as well:
git submodule update --init

# (C) If the above command isn't working right...
# 1. `init` submodules independently:
git submodule init
# 2. Update the clone URLs or disable certain submodules in .git/config:
kak .git/config
# 3. And finally, update the submodules:
git submodule update
```

To update this project if you've previously cloned it:
```
# Get the changes to the main repository.
git pull

# Get the changes to the submodules.
git submodule update --init --recursive
```

To update all plugin submodules, run:
```
git submodule update --remote
```

To update a specific plugin submodule:
1. `cd` into the plugin submodule directory.
2. Run the following commands:
   ```
   git fetch
   git merge
   ```

After updating any plugin submodules, you will have to commit the changes in the
parent (this) project's repository.

To remove a plugin:
```
# Remove the plugin's submodule:
# TODO

# Remove the plugin's installation and configuration scripts:
git rm ./plugin-installs/<plugin-installation-script>
git rm ./plugin-configs/<plugin-configuration-script>
```

## Installing A Custom Kakoune Configuration

While you can install or reinstall over an existing set of Kakoune config files,
the suggested usage is to clear (`rm -rf ~/.config/kak/*`) any existing configs
before running the install scripts to ensure that you have exactly and only what
you need. Later, if you want to make changes to your config, make the changes in
this repo so that they're backed up, clear the existing configs, and re-run the
installation. Clearing existing configs is not required, but will save time
dealing with a lot of warning prompts.

To interactively select and install plugins and a kakrc containing your custom
configuration (from ./plugin-configs directory) for the selected plugins:
```
./install-kakrc.sh
```

To install custom rc scripts and enable the local autoload directory:
```
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

# Known Issues

- The default output will source the `prelude.kak` plugin after the `auto-pairs.kak` plugin,
  which will cause an error on-load. To fix this, move the `prelude.kak` config section in
  the output kakrc before the `auto-pairs.kak` section.
- In order to ensure the mysticaltutor theme for the powerline plugin is used, remove the
  default theme setting from the powerline config section in the output kakrc.

# TODO

- [ ] Handle load order for dependent plugins.
      - Current strategy: manually reorder kakrc sections after installation as needed.
- [ ] Make verbose logging conditional.
- [ ] Enable per-script selection of the rc/custom/ scripts to be copied over.
