# My Dotfiles

## Usage

First install all packages that i store in install_pkg.sh.
After installed all packages, u must be in "dotfiles" dir..
follow this command:
```bash
$ cp -r .config/ ~/.config/ 
```
This command will copies all configurations inside .config dir.

Follow this steps for the configurations outside .config, and it will store at$HOME dir.

```bash
$ cp -r <file-name> $HOME
```
edit <file-name> as filename that exists in dotfiles dir.

##### Example
```bash
$ cp -r .xinitrc $HOME
```
Do all these steps until finished all file in dotfiles dir.

#### All done!!!


