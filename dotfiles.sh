#!/bin/bash

echo "Linking dotfiles…"
for file in `ls -la .`; do
  # Only real files that start with a .
  if [[ $file =~ ^\..+ ]] && [[ -f $file ]]; then
    echo "Linking $file"
    ln -snf "$PWD/$file" "$HOME/$file"
  fi
done
echo "Done."
