# for fcitx5
export QT_IM_MODULE=fcitx
# export GTK_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx
# export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=fcitx

# for grim
export GRIM_DEFAULT_DIR=$XDG_PICTURES_DIR/screenshots

sway "$@"

# vim: ft=bash
