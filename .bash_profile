#
# ~/.bash_profile
#

# my editor
export EDITOR=nvim

# for xdg directories
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
source $XDG_CONFIG_HOME/user-dirs.dirs

[[ -f ~/.bashrc ]] && . ~/.bashrc
