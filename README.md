# My environment set up

This folders contains all my personal bash preferences including vim and kitty settings. It also holds a number of scripts and templates that I use in my latex workflow.

## Set up bash
### Place in .zshrc or .bashrc
source $HOME/.env/source-env.sh

## Set up vim
### Place in .vimrc
source $HOME/.env/vim/vimrc

### Copy to .vim directory
.env/vim/colors
.env/vim/vimscripts

### git clone vundlevim to .vim (follow instructions on the site below)
https://github.com/VundleVim/Vundle.vim

### Call in vim
:PluginInstall

## Set up kitty
Create soft link to kitty config file
ln -s ~/.env/kitty/kitty.config ~/.config/kitty/kitty.config

