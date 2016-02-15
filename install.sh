#!/bin/bash

echo "Fetch git submodules..."
git submodule update --init --recursive

#################################
#             Shell             #
#################################
echo "download on-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "set zsh as default shell"
chsh -s /usr/bin/zsh

echo "link .zshrc"
ln -s "$(pwd)/zshrc" ~/.zshrc

echo "install solarized"
sudo apt-get install dconf-cli && \
gnome-terminal-colors-solarized/install.sh

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

echo "install solarized vim theme"
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

echo "install neocomplete"
git clone https://github.com/Shougo/neocomplete.vim.git ~/.vim/bundle/neocomplete.vim

echo "link vim config"
ln -s "$(pwd)/vimrc" ~/.vimrc
