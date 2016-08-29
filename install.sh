#!/bin/bash

#echo "Fetch git submodules..."
#git submodule update --init --recursive

#################################
#             Shell             #
#################################
echo "download on-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "set zsh as default shell"
chsh -s /usr/bin/zsh

echo "link .zshrc"
ln -s "$(pwd)/zshrc" ~/.zshrc

#echo "install solarized"
#sudo apt-get install dconf-cli && \
#gnome-terminal-colors-solarized/install.sh

#################################
#              tmux             #
#################################
echo "link tmux config"
ln -s "$(pwd)/tmux.conf" ~/.tmux.conf

#################################
#              Vim              #
#################################
echo "install pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#echo "install solarized vim theme"
#git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

echo "install neocomplete"
git clone https://github.com/Shougo/neocomplete.vim.git ~/.vim/bundle/neocomplete.vim

echo "install vimtex"
git clone https://github.com/lervag/vimtex.git ~/.vim/bundle/vimtex.vim

echo "link vim config"
ln -s "$(pwd)/vimrc" ~/.vimrc

echo "link latexmk config"
ln -s "$(pwd)/latexmkrc" ~/.latexmkrc

###########################
# Extra steps for OS X :P #
###########################
# 1. Manually download and install MacTex
# 1.1. export PATH="${PATH}:/usr/local/texlive/2016/bin/x86_64-darwin"
# 2. brew install macvim --with-lua --override-system-vim
# 3. [optional] brew install neovim/neovim/neovim
# 3.1. link vim config and plugins to neovim
# 3.2. alias vim='nvim'
# neovim doesn't work with latex plugins very well, so use GUI mvim (MacVim)
