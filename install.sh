#!/bin/sh

set -e

files=$(ls $HOME/.dotfiles/dot)

# Make a backup folder
echo "Creating a backup folder"
mkdir -p $HOME/.dotfiles_backup

for f in $files; do
  if [ -e "$HOME/.$f" ] && [ ! -L "$HOME/.$f" ]; then
    echo "Creating a backup of .$f"
    mv "$HOME/.$f" "$HOME/.dotfiles_backup/$f"
  fi
  rm -rf "$HOME/.$f"
  echo "Linking .$f"
  ln -s "$HOME/.dotfiles/dot/$f" "$HOME/.$f"
done

echo "Done !"
