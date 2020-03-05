" must be the first command, as it changes other options as side effect
set nocompatible

" intall 'vim-plug' if it's missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Sets how many lines of history VIM has to remember
set history=1000

source $HOME/.myconfig/common.vimrc

"------------------ YouCompleteMe ------------------
let g:ycm_confirm_extra_conf = 1
let g:ycm_extra_conf_globlist = ['~/mysite/*']
" map <ctrl>-b to jump to definition/declaration/header file/etc
nnoremap <C-B> :YcmCompleter GoTo<CR>
" map <ctrl>-l to reformat the code
nnoremap <C-L> :YcmCompleter Format

