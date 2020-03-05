" intall 'vim-plug' if it's missing
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" autocompletion, requires nodejs and npm
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" include other plugins
source ~/.myconfig/plugin.vimrc
call plug#end()

" import common configs shared between neovim and vim
source $HOME/.myconfig/common.vimrc
