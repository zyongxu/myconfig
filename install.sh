#!/bin/bash

#################################
#             Shell             #
#################################
# download on-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# set zsh as default shell
chsh -s /usr/bin/zsh
# link .zshrc
ln -s "$(pwd)/zshrc" ~/.zshrc

# set tmux config
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
