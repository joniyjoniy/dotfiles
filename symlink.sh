#!/bin/zsh

ln -snf ~/dotfiles/zsh/.zshrc ~/
ln -snf ~/dotfiles/.tmux.conf ~/

#ln -s ~/dotfiles/emacs.d ~/.emacs.d
dir=~/.emacs.d/

if [ ! -e $dir ]; then
    mkdir $dir
    echo "mkdir $dir"
fi

ln -snf ~/dotfiles/emacs.d/init.el $dir
