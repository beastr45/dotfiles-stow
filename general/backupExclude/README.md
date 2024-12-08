this folder is to store all data to be ignored by the backup software.

put large reproducable and uninportant files here.

Currently the list of folders that are stored here are <src> <destination>
Downloads {~/Downloads
gitClones {~/Documents/gitClones}

Note, Also put gitCLones in here.

In order to avoid tracking large files with git, the backupExclude folder must be created before using stow.

Here is a list of additional folders that should be ignored by backup software.
 - Downloads
 - backupExclude
 - 
## Patterns
 - .wine
 - .npm
 - node_modules
 - .git
 - .local
 - .rustup
 - .cargo
 - .dotnet
 - Caches, Trash, Flatpak Installs, Virtual machines
