# Useful Snippets

Useful snippets is a markdown file where I have stored all of the commands
I want to remember. Taken from an obsidian note.

## Simple/Shell

>[!warning] \> means overwrite, \>\> means append

better cd, install zoxide

```sh
z {dir}
```

echo return value

```sh
echo $?
```

## git

here are some macros defined in zsh
g-> git
lg ->lazygit
gwip -> wip commit

Git fetch creates a new branch while git pull auto merges.

Clone large repos with the --depth= flag to avoid downloading everything.
Also use the --depth= flag when using git fetch
Additionally --branch=<tag/branch> is useful when you only want a specific release or commit

Use this to create a partial clone. Partial clones will only retrieve current file stat but will require internet connection to traverse history. (faster clone time)
```
git clone --filter='blob:none'
```

Clone a repo with --recurse-submodules to add files from submodules correctly
Shallow submodules works with recurse-submodules, it will only pull the commit specified by a submodule for the child submodule.

```sh
git clone --recurse-submodules
# try for better bandwidth
git clone --depth 1 --shallow-submodules --recurse-submodules --branch <branch/tag> <url>
```

To update submodules after cloning

```sh
git submodule update --init --recursive
```

To update a specific submodule

```sh
git submodule update --recursive <submodule_path>
```

Patch command

```sh
patch -p1 < patch.diff
```

Remove any ignored files in git

```sh
git clean -dfX
```

## programming

Clone my makefile template repo

```sh
git clone git@github.com:beastr45/BuildConfig.git
```

### C++

Command to format all cpp files in a certain directory

	find src/main/ -iname '*.h' -o -iname '*.cpp' | xargs clang-format -i

Command to autogenerate clangd config files

```sh
make clean; bear -- make
```

Generate .clang-format files for specified code styles

```sh
clang-format -style=mozilla -dump-config > .clang-format
```

I like to comment out:

```config
AlwaysBreakAfterDefinitionReturnType: TopLevel
AlwaysBreakAfterReturnType: TopLevel
```

Disable clang format temporarily

```cpp
// clang-format off
// clang-format on
```

Disable warnings in gcc and clang with the -Wno- prefix and warning type

### Rust
Install a project that is being worked on 

	cargo install --path .

Format all of the source code with rust-fmt

	cargo fmt --all

## Linux

Remove password timeout while logged into root

```sh
faillock --user <username> --reset
```

## Fixes

When a wine app messes up run wineserver -k to end all wine processes

### Keyboard

I like to swap caps w/ esc otherwise I get driven insane. This fixes the xorg
keymap. Make sure --no-convert is used to preserve vconsole.conf

 ```sh
sudo localectl --no-convert set-x11-keymap us pc105 '' "caps:escape,compose:ralt"
```

To set custom console keymap edit vconsole.conf
see https://wiki.archlinux.org/title/Linux_console/Keyboard_configuration for custom console keyboard

## Fun

Fun one liner that plays a song while trashing c syntax

```sh
echo "g(i,x,t,o){return((3&x&(i*((3&i>>16?\"BY}bYBb%\":\"Qj}bjQb%\")[t%8]+51)>>o))<<4);};main(i,n,s){for(i=0;;i++)putchar(g(i,1,n=i>>14,12)+g(i,s=i>>17,n^i>>13,10)+g(i,s/3,n+((i>>11)%3),10)+g(i,s/5,8+n-((i>>10)%3),9));}"|gcc -Wno-implicit-int -Wno-implicit-function-declaration -xc -&&./a.out|aplay
```

## MISC

I hate manually setting youtube to theater mode when in splitscreen.
To set theater mode cookie indefinetly on youtube, enter this into console

```js
document.cookie = 'wide=1; expires='+new Date('3000').toUTCString()+'; path=/';
```

I get annoyed trying to find the settings I want in keepassxc so I've stored
them here.

```ini
syntax for a fixed keepassxc config 
[GUI]
MinimizeOnClose=true
MinimizeOnStartup=true
MinimizeToTray=true
ShowTrayIcon=true
TrayIconAppearance=monochrome-light
```

Connect to hdmi

xrandr --output HDMI1 --auto --same-as eDP1

With independent outputs

xrandr --output HDMI1 --auto --left-of eDP1
xrandr --output HDMI1 --auto --right-of eDP1
