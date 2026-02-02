vim9script

const config_dir = expand('<sfile>:p:h') 
const install_path = config_dir .. '/autoload/plug.vim'
const plug_uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if filereadable(install_path)
  finish
endif

system('curl -fLo ' .. shellescape(install_path) .. ' --create-dirs ' .. shellescape(plug_uri))

if v:shell_error != 0
  echoe "failed to install vim-plug"
  :1cquit
endif 
