#!/bin/bash

echo "Installing vim…"
brew install vim
echo "Done."

echo "Setting up Vundle…"
if ! [[ -d ~/.vim/bundle/Vundle.vim ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
# Install/update Vundle dependencies
vim -c VundleUpdate -c quitall
echo "Done."
