# Configuration for the `kakoune-repl-mode` plugin
# https://github.com/jordan-yee/kakoune-repl-mode

source ~/.config/kak/plugin/kakoune-repl-mode/repl-mode.kak

# Optionally set the window manager
# This option will be set to 'tmux' by default
set-option global repl_window_manager 'tmux'

# Suggested user mode mapping
map global user r ': enter-user-mode repl<ret>' -docstring "repl mode"

require-module repl-mode
