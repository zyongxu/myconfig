#!/bin/bash

#echo "Fetch git submodules..."
#git submodule update --init --recursive

#################################
#             Shell             #
#################################
echo "set zsh as default shell"
chsh -s $(which zsh)

echo "link .zshrc"
ln -s "$(pwd)/zshrc" ~/.zshrc

#################################
#              tmux             #
#################################
#echo "link tmux config"
#ln -s "$(pwd)/tmux.conf" ~/.tmux.conf

#################################
#              Vim              #
#################################
echo "install pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "install gruvbox color scheme"
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox

echo "install neocomplete"
git clone https://github.com/Shougo/neocomplete.vim.git ~/.vim/bundle/neocomplete.vim

echo "install vimtex"
git clone https://github.com/lervag/vimtex.git ~/.vim/bundle/vimtex.vim

echo "install CtrlP"
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

echo "install vim-gitgutter"
git clone git://github.com/airblade/vim-gitgutter.git

echo "link vim config"
ln -s "$(pwd)/vimrc" ~/.vimrc

#echo "link latexmk config"
#ln -s "$(pwd)/latexmkrc" ~/.latexmkrc

###########################
# Extra steps for OS X :P #
###########################
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#brew install macvim --with-lua --override-system-vim
# 1. Manually download and install MacTex
# 1.1. export PATH="${PATH}:/usr/local/texlive/2016/bin/x86_64-darwin"
# 2. Config the TexShop previewer so it could be used as the previewer for latex (forget about Preview, Skim and Adobe)
# 3.1. Preference -> "Preview" tab -> check "Automatic Preview Update" under "External Editor" group box
