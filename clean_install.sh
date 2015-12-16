#!/bin/bash

for file in dotfiles/*; do
  home_file="$HOME/.$(basename $file)"
  echo "Deleting $home_file"
  rm -rf -- $home_file
done

./install.sh
