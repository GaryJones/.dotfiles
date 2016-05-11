# .dotfiles

A set of (hopefully good) dotfiles.

## Install

Clone the dotfiles repository in you home folder.

```sh
cd
git clone https://github.com/GaryJones/.dotfiles.git
```

Run the install script.

```sh
.dotfiles/install.sh
```

A backup of your old dotfiles will be created at `~/.dotfiles_backup`.

### OSX
The OSX system settings are triggered manually, as these aren't likely to change much once the machine is set up. Besides, it currently resets the wallpaper...

```sh
sh ~/.osx
```

## Update

Just pull and run the install script again.

```sh
cd ~/.dotfiles
git pull
./install.sh
```

## Licence

These dotfiles are provided under the GNU General Public License version 2 (GPLv2).  Originally forked from [https://github.com/Nax/.dotfiles](https://github.com/Nax/.dotfiles)
Check the LICENSE file for more information.
