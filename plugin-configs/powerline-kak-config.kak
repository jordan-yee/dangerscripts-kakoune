# Configuration for the `powerline.kak` plugin
# https://github.com/jdugan6240/powerline.kak

# Source the main script
source ~/.config/kak/plugins/powerline.kak/rc/powerline.kak

# Source the modules you want to use:
source ~/.config/kak/plugins/powerline.kak/rc/modules/bufname.kak
source ~/.config/kak/plugins/powerline.kak/rc/modules/client.kak
source ~/.config/kak/plugins/powerline.kak/rc/modules/filetype.kak
source ~/.config/kak/plugins/powerline.kak/rc/modules/git.kak
source ~/.config/kak/plugins/powerline.kak/rc/modules/line_column.kak
source ~/.config/kak/plugins/powerline.kak/rc/modules/mode_info.kak
source ~/.config/kak/plugins/powerline.kak/rc/modules/position.kak
source ~/.config/kak/plugins/powerline.kak/rc/modules/session.kak

# Source the theme you want to use:
source ~/.config/kak/plugins/powerline.kak/rc/themes/solarized-dark.kak

# Enable powerline:
powerline-start

# Configuration:
hook global ModuleLoaded powerline %{
    set-option global powerline_shorten_bufname short
    powerline-theme solarized-dark
}

hook global WinCreate .* %{
    powerline-separator none
}
