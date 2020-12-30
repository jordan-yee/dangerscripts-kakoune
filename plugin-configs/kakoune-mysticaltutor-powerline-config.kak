# Configuration for the `kakoune-mysticaltutor-powerline` plugin
# https://github.com/jordan-yee/kakoune-mysticaltutor-powerline

# Source the powerline theme file:
source ~/.config/kak/plugins/kakoune-mysticaltutor-powerline/mysticaltutor-powerline.kak

# Configuration:
hook global ModuleLoaded powerline %{
    powerline-theme mysticaltutor
}
