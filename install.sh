#!/bin/bash

########## Shell ##########
echo "set zsh as default shell"
chsh -s $(which zsh)

echo "link .zshrc"
ln -s "$(pwd)/zshrc" ~/.zshrc

########## tmux ##########
echo "link tmux config"
ln -s "$(pwd)/tmux.conf" ~/.tmux.conf

# NOTE: the first time nvim or vim is opened, it will automatically download vim-plug,
#       this is specified in the corresponding vim config file
########## NeoVim ##########
echo "link nvim config"
mkdir -p ~/.config/nvim
ln -s "$(pwd)/nvimrc" ~/.config/nvim/init.vim
echo "run \`:checkhealth\` in neovim to confirm everything works"

########## Vim ##########
echo "link vim config"
ln -s "$(pwd)/vimrc" ~/.vimrc

#echo "install YouCompleteMe"
#git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
#cd ~/.vim/bundle/YouCompleteMe && \
#git submodule update --init --recursive && \
#python3 ./install.py --clangd-completer

########## Latex ##########
#echo "link latexmk config"
#ln -s "$(pwd)/latexmkrc" ~/.latexmkrc

########################
# Extra steps for OS X #
########################
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#brew install macvim --with-lua --override-system-vim
# 1. Manually download and install MacTex
# 1.1. export PATH="${PATH}:/usr/local/texlive/2016/bin/x86_64-darwin"
# 2. Config the TexShop previewer so it could be used as the previewer for latex (forget about Preview, Skim and Adobe)
# 3.1. Preference -> "Preview" tab -> check "Automatic Preview Update" under "External Editor" group box
