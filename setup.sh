#!/bin/bash

# Change to the directory we're executing from
cd `dirname $0`

# Install and setup Mac-specific things
if [ "$(uname)" == "Darwin" ]; then
  echo "Installing Homebrew…"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo "Installing git, ripgrep and zsh…"
  brew install git ripgrep zsh
  echo "Done."

  if ! [[ -d ${NVM_DIR:-~/.nvm} ]]; then
    echo "Installing nvm…"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    echo "Done."
  else
    echo "Found existing nvm, skipping."
  fi

  if ! [[ -d ${ZSH:-~/.oh-my-zsh} ]]; then
    echo "Installing oh-my-zsh…"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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

  ./fonts.sh

  echo "Manually install the 'sources/My Settings.terminal' terminal settings."
else
  echo "Please check git, vim and zsh versions"
  echo "Manually install ripgrep: https://github.com/BurntSushi/ripgrep"
fi

./dotfiles.sh
./node.sh
./vim.sh
