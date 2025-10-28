#
# ~/.bash_profile
#

# my editor
export EDITOR=nvim

# for xdg directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="$HOME/.local/bin:$PATH"

for f in ~/.bash_profile.d/*; do
  [ -f "$f" ] || continue
  . "$f"
done

unset f

[[ -f ~/.bashrc ]] && . ~/.bashrc
