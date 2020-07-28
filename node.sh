#!/bin/bash

echo "Installing and configuring node v12…"
[ -s "${NVM_DIR:-$HOME/.nvm}/nvm.sh" ] && . "${NVM_DIR:-$HOME/.nvm}/nvm.sh"  # Make sure nvm is loaded
nvm install 12
npm config set init.version "1.0.0"
npm config set init.license "MIT"
npm config set init.author.name "Ben Booth"
npm config set init.author.email "ben@benbooth.dev"
npm config set init.author.url "https://benbooth.dev"
echo "Done."
echo "Installing and configuring yarn…"
brew install yarn
yarn config set init-version "1.0.0" -global --silent
yarn config set init-license "MIT" -global --silent
yarn config set init-author-name "Ben Booth" -global --silent
yarn config set init-author-email "ben@benbooth.dev" -global --silent
yarn config set init-author-url "https://benbooth.dev" -global --silent
echo "Done."
