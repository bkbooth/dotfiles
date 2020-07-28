#!/bin/bash

echo "Installing Hack and Fira Code fonts…"
brew tap homebrew/cask-fonts
brew cask install font-hack
brew cask install font-hack-nerd-font
brew cask install font-fira-code
echo "Done."
