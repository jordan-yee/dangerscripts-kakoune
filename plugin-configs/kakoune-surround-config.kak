# Configuration for the `kakoune-surround` plugin
# https://github.com/h-youhei/kakoune-surround

source ~/.config/kak/plugins/kakoune-surround/surround.kak

declare-user-mode surround

map global surround s ':surround<ret>' -docstring 'surround'
map global surround c ':change-surround<ret>' -docstring 'change'
map global surround d ':delete-surround<ret>' -docstring 'delete'
map global surround t ':select-surrounding-tag<ret>' -docstring 'select tag'

map global user s ':enter-user-mode surround<ret>' -docstring 'surround mode'
