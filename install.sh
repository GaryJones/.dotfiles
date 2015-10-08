#!/bin/bash

set -e

# Clone the submodules
git submodule init
git submodule update

# Get the dotfiles list
cd ~/.dotfiles/dot
files=$(find . | cut -c 3-)
cd

# Make a backup folder
echo "Creating a backup folder"
mkdir -p .dotfiles_backup

# Link each file to home
for f in $files; do
  # If the original file is a regular file, then make a backup of it
  if [ -e .$f ] && [ ! -L .$f ] && [ ! -d .$f ]; then
    echo "Creating a backup of .$f"
    mkdir -p .dotfiles_backup/$(dirname $f)
    cp .$f .dotfiles_backup/$f
  fi
  # If the file is not a directory, then it should be linked
  if [ ! -d .dotfiles/dot/$f ]; then
    rm -rf .$f
    echo "Linking .$f"
    slashes=$(echo .$f | grep -o / | wc -l | tr -d ' ')
    prefix=""
    # A small hack to make relative symlinks work properly
    if [ $slashes -gt 0 ]; then
      prefix=$(yes ../ | head -n $slashes | tr -d '\n')
    fi
    ln -s $prefix.dotfiles/dot/$f .$f
  else
    # If the file is a directory, then create a directory too
    # This is useful, for example, antigen downloads some stuff in $HOME/.antigen
    # Creating a directory instead of linking it allow us to cherry-pick what to link
    mkdir -p .$f
  fi
done

echo "Done !"

