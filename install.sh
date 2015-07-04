#!/bin/sh

set -e

cd ~/.dotfiles/dot
files=$(find . | cut -c 3-)
cd

# Make a backup folder
echo "Creating a backup folder"
mkdir -p .dotfiles_backup

for f in $files; do
  if [ -e .$f ] && [ ! -L .$f ] && [ ! -d .$f ]; then
    echo "Creating a backup of .$f"
    mkdir -p .dotfiles_backup/$(dirname $f)
    cp .$f .dotfiles_backup/$f
  fi
  if [ ! -d .dotfiles/dot/$f ]; then
    rm -rf .$f
    echo "Linking .$f"
    slashes=$(echo .$f | grep -o / | wc -l | tr -d ' ')
    prefix=""
    if [ $slashes -gt 0 ]; then
      prefix=$(jot -b ../ $slashes | tr -d '\n')
    fi
    ln -s $prefix.dotfiles/dot/$f .$f
  else
    mkdir -p .$f
  fi
done

echo "Done !"
