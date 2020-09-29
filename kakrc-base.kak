# -----------------------------------------------------------------------------
# basic configuration

# default colorscheme choice
colorscheme solarized-dark-termcolors

# show line numbers
add-highlighter global/ number-lines -relative -hlcursor -min-digits 3

# soft-wrap lines to always be visible within the terminal
add-highlighter global/ wrap

# show matching brackets
add-highlighter global/ show-matching

# show trailing whitespace - not working
add-highlighter global/trailing regex '[ \t\f\v]+$' 0:Whitespace

# highlight special comment words
add-highlighter global/ regex \b(TODO|FIXME|XXX|NOTE)\b 0:default+rb

# set default indentation width
set-option global indentwidth 4
set-option global tabstop 4

# -----------------------------------------------------------------------------
# mappings

# use space for user mode leader key
# ----------------------------------

# rebind <space>
map global normal <space> , -docstring 'leader'
# rebind <backspace> to replace the old function of <space>
map global normal <backspace> <space> -docstring 'remove all sels except main'
map global normal <a-backspace> <a-space> -docstring 'remove main sel'

# extend view mappings
# --------------------

map global view K t -docstring 'cursor on top'
map global view J b -docstring 'cursor on bottom'

# perform a literal (non-regex) search in user mode
# -------------------------------------------------

map global user / ':exec /<ret>\Q\E<left><left>' -docstring 'literal search'

# remap macro & back-a-word operations
# ------------------------------------

# Remap macro record/playback bindings
# NOTE: @/<a-@> converts spaces <=> tabs by default
#       I'm not setting up a replacement binding for it because I don't use it.
#       It might not work anyway with the smarttab plugin.
map global normal <a-@> q
map global normal @ Q

# Remap select-word-on-left bindings
map global normal q b
map global normal Q B
map global normal <a-q> <a-b>
map global normal <a-Q> <a-B>

# -----------------------------------------------------------------------------
# hooks

# jk to escape
# ------------

hook global InsertChar k %{ try %{
    exec -draft hH <a-k>jk<ret> d
    exec <esc>
}}

# tab complete
# ------------

# TODO: This causes tab to break in insert mode.
#       I think it has to do with the 'jk' for <esc> hook.
hook global InsertCompletionShow .* %{
    try %{
        execute-keys -draft 'h<a-K>\h<ret>'
        map window insert <tab> <c-n>
        map window insert <s-tab> <c-p>
    }
}

hook global InsertCompletionHide .* %{
    unmap window insert <tab> <c-n>
    unmap window insert <s-tab> <c-p>
}

# add matches for sh filetype
# ---------------------------

hook global BufCreate .*\.(conf) %{
    set-option buffer filetype sh
}

# -----------------------------------------------------------------------------
# Environment-specific Configuration

# use rg for the grep command
# set-option global grepcmd 'rg --column'
