# dangerscripts-kakoune
My portable Kakoune configuration.

# Overview

The goal of this project is to package all of my Kakoune configuration in one place
and provide a way to generate a kakrc compatible with any given system I want to
run Kakoune on, which may not have the dependencies needed for all of the plugins
included in a full configuration.

# Base kakrc

The kakrc file is a minimal configuration meant to work on any system that has Kakoune
installed, with no assumptions about other available software.

# Plugins

- Add plugins as a sub-module to this repository.
- Add a <plugin-name>-config.kak file for each plugin that defines the custom
  configuration specific to the plugin.

# Installation Scripts [TODO]

- [ ] Create scripts that automatically add selected plugins and configuration options
      to a Kakoune installation on the current system.
