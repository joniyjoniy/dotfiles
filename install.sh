#!/local/bash

# zsh
sudo apt-get install zsh

# emacs

sudo apt-get install libncurses5-dev
curl -O http://core.ring.gr.jp/pub/GNU/emacs/emacs-24.5.tar.gz
tar -zxf emacs-24.5.tar.gz
cd emacs-24.5
./configure --without-x
make
sudo make install
curl -fsSkL https://raw.github.com/cask/cask/master/go | python

# tmux
sudo apt-get install tmux
