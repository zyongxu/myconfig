Basic configurations to:
  1. use zsh (with on-my-zsh config)
  2. set vim config
  3. set tmux config

## Installation:
  1. git clone https://github.com/zyongxu/myconfig.git ~/.myconfig
  2. cd ~/.myconfig
  3. ./install.sh

## To add new git submodules:

```
git submodule add <addr of git repo>/XXX.git
git add .
git commit -m "<comment>"
```

## Remove a plug-in submodule:

```
git submodule deinit xxx
git rm xxx
```
