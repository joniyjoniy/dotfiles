#!/bin/zsh

cp ~/dotfiles/zsh/.zshrc ~/
cp ~/dotfiles/.tmux.conf ~/

#ln -s ~/dotfiles/emacs.d ~/.emacs.d
dir=~/.emacs.d/

if [ ! -e $dir ]; then
    mkdir $dir
    echo "mkdir $dir"
fi

cp -r ~/dotfiles/emacs.d/ $dir/.emacs.d
