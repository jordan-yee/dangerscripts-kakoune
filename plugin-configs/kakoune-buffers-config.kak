# Configuration for the `kakoune-buffers` plugin
# https://github.com/delapouite/kakoune-buffers

source ~/.config/kak/plugins/kakoune-buffers/buffers.kak

# NOTE: These mappings assume <b> has been rebound or isn't needed.
map global normal b ': enter-buffers-mode<ret>' -docstring 'buffers'
map global normal B ': enter-user-mode -lock buffers<ret>' -docstring 'buffers (lock)'
