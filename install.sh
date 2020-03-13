#!/bin/bash

printf "setting default shell to zsh... "
if (( $(basename $SHELL) != 'zsh' ))
then
    echo "set zsh as the default shell"
    chsh -s $(which zsh)
else
    echo "zsh is already the default shell"
fi

echo -e "\ncreating symbolic links for config files..."
function link_rc {
    if [ ! -f $2 ]
    then
        source_path="$(pwd)/$1"
        echo -e "[linking]       $source_path\t->\t$2"
        mkdir -p $(dirname $2)
        ln -s $source_path $2
    else
        echo -e "[already exist] $2"
    fi
}

link_rc "zshrc" "$HOME/.zshrc"
link_rc "tmux.conf" "$HOME/.tmux.conf"
link_rc "latexmkrc" "$HOME/.latexmkrc"
# the first time nvim or vim is opened, it will automatically download "vim-plug"
# this behavior is specified in vimrc/nvimrc
link_rc "vimrc" "$HOME/.vimrc"
link_rc "nvimrc" "$HOME/.config/nvim/init.vim"
printf "\n\e[1;32mrun \`:checkhealth\` in neovim to confirm everything works\e[0m\n"

if [[ $(uname -s) == Darwin* ]]; then
    echo -e "\nthis seems to be OS X, consider manually install the following:"
    printf  '1. \e[1;32mhomebrew (https://docs.brew.sh/Installation)\e[0m\n'
    echo -e '2. MacTex (for LaTex):'
    echo -e '     1. Manually download and install MacTex'
    echo -e '     2. export PATH="${PATH}:/usr/local/texlive/2016/bin/x86_64-darwin"'
    echo -e '     3. Set TexShop previewer as the previewer for vimtex'
    echo -e '     4. Preference -> "Preview" tab -> check "Automatic Preview Update" under "External Editor" group box'
fi
