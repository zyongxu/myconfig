#!/bin/bash

# Fetch git submodules
git submodule update --init --recursive

#################################
#             Shell             #
#################################
# download on-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# set zsh as default shell
chsh -s /usr/bin/zsh

# link .zshrc
ln -s "$(pwd)/zshrc" ~/.zshrc

# install solarized
sudo apt-get install dconf-cli && \
gnome-terminal-colors-solarized/install.sh

#################################
#              tmux             #
#################################
# link tmux config
ln -s "$(pwd)/tmux.conf" ~/.tmux.conf

#################################
#              Vim              #
#################################
# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install solarized
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

# set vim config
ln -s "$(pwd)/vimrc" ~/.vimrc
