#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dotfiles='git --git-dir=dotfiles.git/ --work-tree=$HOME'

# my PS1
ps1_exitcode() {
  if [ $? == 0 ]; then
    echo ""
  else
    echo " [$?]"
  fi
}
ps1_njob() {
  local njob=$(jobs | wc -l)
  if [ $njob == 0 ]; then
    echo ""
  else
    echo " ($njob)"
  fi
}
PS1='\[\e[1m\e[36m\]\u\[\e[37m\]@\[\e[35m\]\h \[\e[37m\]\w\[\e[31m\]$(ps1_exitcode)\[\e[0m\]\[\e[34m\]$(ps1_njob)\[\e[0m\]\n\$ '

# my editor
export EDITOR=nvim

# for xdg directories
export XDG_CONFIG_HOME=~/.config
source $XDG_CONFIG_HOME/user-dirs.dirs
