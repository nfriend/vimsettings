#!/bin/bash

rm -rf ~/.vim
ln -s "$(pwd)/.vim" ~/.vim

rm -f ~/_vimrc
ln -s "$(pwd)/_vimrc" ~/_vimrc
