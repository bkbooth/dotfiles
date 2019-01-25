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

  if ! [[ -d ${NVM_DIR:-~/.nvm} ]]; then
    echo "Installing nvm…"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
    echo "Done."
  else
    echo "Found existing nvm, skipping."
  fi

  if ! [[ -d ${ZSH:-~/.oh-my-zsh} ]]; then
    echo "Installing oh-my-zsh…"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "Done."
  else
    echo "Found existing oh-my-zsh, skipping."
  fi
  echo "Setting up oh-my-zsh plugins and theme…"
  if ! [[ -d ${ZSH:-~/.oh-my-zsh}/custom/plugins/zsh-autosuggestions ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH:-~/.oh-my-zsh}/custom/plugins/zsh-autosuggestions
  fi
  if ! [[ -d ${ZSH:-~/.oh-my-zsh}/custom/plugins/zsh-nvm ]]; then
    git clone https://github.com/lukechilds/zsh-nvm ${ZSH:-~/.oh-my-zsh}/custom/plugins/zsh-nvm
  fi
  ln -snf "$PWD/benbooth.zsh-theme" "${ZSH:-$HOME/.oh-my-zsh}/custom/themes/benbooth.zsh-theme"
  echo "Done."

  echo "Installing and configuring node v10…"
  source ~/.zshrc
  nvm install 10
  npm config set init.version "1.0.0"
  npm config set init.license "MIT"
  npm config set init.author.name "Ben Booth"
  npm config set init.author.email "bkbooth@gmail.com"
  npm config set init.author.url "https://benbooth.co"
  echo "Done."
  echo "Installing and configuring yarn…"
  brew install yarn --without-node
  yarn config set init-version "1.0.0" -g
  yarn config set init-license "MIT" -g
  yarn config set init-author-name "Ben Booth" -g
  yarn config set init-author-email "bkbooth@gmail.com" -g
  yarn config set init-author-url "https://benbooth.co" -g
  echo "Done."

  echo "Copying fonts…"
  cp ./fonts/* ~/Library/Fonts/
  echo "Done."

  echo "Manually install the 'sources/My Settings.terminal' terminal settings."
else
  echo "Please check git, vim and zsh versions"
  echo "Manually install ripgrep: https://github.com/BurntSushi/ripgrep"
fi

echo "Linking dotfiles…"
for file in `ls -la .`; do
  # Only real files that start with a .
  if [[ $file =~ ^\..+ ]] && [[ -f $file ]]; then
    echo "Linking $file"
    ln -snf "$PWD/$file" "$HOME/$file"
  fi
done
echo "Done."

echo "Setting up Vundle…"
if ! [[ -d ~/.vim/bundle/Vundle.vim ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
# Install/update Vundle dependencies
vim -c VundleUpdate -c quitall
echo "Done."
