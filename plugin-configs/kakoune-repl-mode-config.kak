# Configuration for the `kakoune-repl-mode` plugin
# https://github.com/jordan-yee/kakoune-repl-mode

source ~/.config/kak/plugins/kakoune-repl-mode/modules/repl-mode-tmux.kak
source ~/.config/kak/plugins/kakoune-repl-mode/repl-mode.kak

# Suggested user mode mapping
map global user r ': enter-user-mode repl<ret>' -docstring "repl mode"

require-module repl-mode
