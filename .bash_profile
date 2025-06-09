#
# ~/.bash_profile
#

# my editor
export EDITOR=nvim

# for xdg directories
export XDG_CONFIG_HOME=~/.config
source $XDG_CONFIG_HOME/user-dirs.dirs

[[ -f ~/.bashrc ]] && . ~/.bashrc
