#!/bin/bash

rm -rf ~/.vim
ln -s "$(pwd)/.vim" ~/.vim

rm -f ~/_vimrc
ln -s "$(pwd)/_vimrc" ~/_vimrc

echo
echo "Symlinks to _vimrc and .vim directory successfully created."
echo
echo "For OS X, be sure to install the Solarized Dark terminal theme by double clicking \"Solarized Dark.terminal\" (from https://github.com/tomislav/osx-terminal.app-colors-solarized) and setting the theme as default via Preferences -> Profiles -> Solarized Dark and clicking on \"Default\"."
echo
