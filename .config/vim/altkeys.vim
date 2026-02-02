vim9script

set winaltkeys=no
set termwinkey=<Nul>

# in vim's terminal emulator I never use the following latin characters.
# So map them to <Esc> prefixed character to make <M-some key> work.
tmap æ <Esc>f
tmap â <Esc>b
tmap ÿ <Esc><BS>
tmap ä <Esc>d
tmap õ <Esc>u
tmap ì <Esc>l
tmap ã <Esc>c
