#!/bin/bash

echo "Installing and configuring node v16…"
[ -s "${NVM_DIR:-$HOME/.nvm}/nvm.sh" ] && . "${NVM_DIR:-$HOME/.nvm}/nvm.sh"  # Make sure nvm is loaded
nvm install 16
npm config set init-version="1.0.0" --global
npm config set init-license="MIT" --global
npm config set init-author-name="Ben Booth" --global
npm config set init-author-email="hey@benbooth.dev" --global
npm config set init-author-url="https://benbooth.dev" --global
echo "Done."
echo "Installing and configuring yarn…"
brew install yarn
yarn config set init-version "1.0.0" -global --silent
yarn config set init-license "MIT" -global --silent
yarn config set init-author-name "Ben Booth" -global --silent
yarn config set init-author-email "hey@benbooth.dev" -global --silent
yarn config set init-author-url "https://benbooth.dev" -global --silent
echo "Done."
