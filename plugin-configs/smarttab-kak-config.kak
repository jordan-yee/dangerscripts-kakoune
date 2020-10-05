# Configuration for the `smarttab.kak` plugin
# https://github.com/andreyorst/smarttab.kak

source ~/.config/kak/plugins/smarttab.kak/rc/smarttab.kak

hook global WinSetOption filetype=.* expandtab

hook global ModuleLoaded smarttab %{
    # how many spaces to delete when pressing <backspace>
    set-option global softtabstop %opt{tabstop}
}
