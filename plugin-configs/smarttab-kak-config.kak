# Configuration for the `smarttab.kak` plugin
# https://github.com/andreyorst/smarttab.kak

hook global ModuleLoaded smarttab %{
    # how many spaces to delete when pressing <backspace>
    set-option global softtabstop %opt{tabstop}
    expandtab
}
