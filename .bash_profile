#
# ~/.bash_profile
#

# my editor
export EDITOR=nvim

# for xdg directories
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state
export XDG_CACHE_HOME=~/.cache

source $XDG_CONFIG_HOME/user-dirs.dirs

export PATH="$HOME/.local/bin:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc
