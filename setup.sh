#!/bin/bash

# Change to the directory we're executing from
cd `dirname $0`

# Link all dotfiles
echo "Linking dotfiles..."
for file in `ls .`; do
  # Skip .md and .sh files, and directories
  if [[ $file =~ \.(md|sh) ]] || [[ -d $file ]]; then
    echo "Skipping '$file'"
    continue
  fi

  echo "Linking '.$file'"
  ln -snf "$PWD/$file" "$HOME/.$file"
done
echo "Done."

# Check for and install Vundle
echo "Setting up Vundle..."
if ! [[ -d ~/.vim/bundle/Vundle.vim ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
# Install/update Vundle dependencies
vim -c VundleUpdate -c quitall
