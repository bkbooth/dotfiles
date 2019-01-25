#!/bin/bash

# Change to the directory we're executing from
cd `dirname $0`

# Install and setup Mac-specific things
if [ "$(uname)" == "Darwin" ]; then
  echo "Installing Homebrew…"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Installing git, vim, ripgrep and zsh…"
  brew install git vim ripgrep zsh
  echo "Done."

  echo "Installing nvm…"
  if ! [[ -d ~/.nvm ]]; then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
  fi
  echo "Installing node v10…"
  nvm install 10
  echo "Installing yarn…"
  brew install yarn --without-node
  echo "Done."

  echo "Installing oh-my-zsh…"
  if ! [[ -d ${ZSH:-~/.oh-my-zsh} ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi
  if ! [[ -d ${ZSH:-~/.oh-my-zsh}/custom/plugins/zsh-autosuggestions ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH:-~/.oh-my-zsh}/custom/plugins/zsh-autosuggestions
  fi
  if ! [[ -d ${ZSH:-~/.oh-my-zsh}/custom/plugins/zsh-nvm ]]; then
    git clone https://github.com/lukechilds/zsh-nvm ${ZSH:-~/.oh-my-zsh}/custom/plugins/zsh-nvm
  fi
  ln -snf "$PWD/benbooth.zsh-theme" "${ZSH:-$HOME/.oh-my-zsh}/custom/themes/benbooth.zsh-theme"
  echo "Done."

  echo "Copying fonts…"
  cp ./fonts/* ~/Library/Fonts/
  echo "Done."

  echo "Manually install the 'sources/My Settings.terminal' terminal settings."
else
  echo "Please check git, vim and zsh versions"
  echo "Manually install ripgrep: https://github.com/BurntSushi/ripgrep"
fi

# Link all dotfiles
echo "Linking dotfiles…"
for file in `ls -la .`; do
  # Only real files that start with a .
  if [[ $file =~ ^\..+ ]] && [[ -f $file ]]; then
    echo "Linking $file"
    ln -snf "$PWD/$file" "$HOME/$file"
  fi
done
echo "Done."

# Check for and install Vundle
echo "Setting up Vundle…"
if ! [[ -d ~/.vim/bundle/Vundle.vim ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
# Install/update Vundle dependencies
vim -c VundleUpdate -c quitall
echo "Done."
