# Useful Snippets

Useful snippets is a markdown file where I have stored all of the commands
I want to remember. Taken from an obsidian note.

## Simple/Shell

>[!warning] > means overwrite, >> means append

```sh
#better cd, install zoxide
z {dir}

#echo return value
echo $?

#Run a makefile with all threads activated
make -j$(nproc)

#make stderr pipe to stdout instead of the terminal. Useful for ccc alias
<command> 2>&1 | <other command>

#list absolute directory name with ls
ls -d $PWD/*

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

Forward usb devices over the internet
```sh

# --- (USB host) ---

#First check if usbip module is loaded
lsmod | grep usbip
# Load kernel modules
sudo modprobe usbip-core
sudo modprobe usbip-host
#Make sure module get loaded at boot. (if not already)
echo usbip-host | sudo tee /etc/modules-load.d/usbip.conf

# Start usbip daemon
sudo systemctl enable --now usbipd

# List USB devices
usbip list -l

# Bind device (make it available over network)
sudo usbip bind -b <BUSID>

# Unbind device (return to local host)
sudo usbip unbind -b <BUSID>


# --- (USB client) ---

#First check if the module is loaded
lsmod | grep vhci_hcd
# Load kernel module
sudo modprobe vhci-hcd
#Make sure module get loaded at boot. (if not already)
echo vhci-hcd | sudo tee /etc/modules-load.d/usbip.conf

# List remote devices
usbip list -r <ARCH_IP>

# Attach device (make remote USB appear local)
sudo usbip attach -r <ARCH_IP> -b <BUSID>

# Detach device
usbip port           # list attached devices and port numbers
sudo usbip detach -p <PORT>

# Make sure that tcp port 3240 is accessible to vpn.
#Below is how to add a port or whitelist an interface on fedora linux.
sudo firewall-cmd --add-port=3240/tcp --permanent
#OR
sudo firewall-cmd --zone=trusted --add-interface=tailscale0 --permanent
#Then
sudo firewall-cmd --reload

```

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
xrandr --output HDMI1 --auto --above eDP1

## Notes on VCPKG

The repository containing vcpkg recipes cannot legally be included, so you
will have to manually clone it to the $HOME/.local/share/vcpkg directory.

  git clone https://github.com/microsoft/vcpkg $VCPKG_ROOT

You are also responsible for manually updating this repository.

  git -C $VCPKG_ROOT pull

For CMake to recognize libraries provided by vcpkg, the above repository
includes a CMake module, which can be found at:

  $VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake

This file can be copied to your CMake project directory and included in
CMakeLists.txt via include(vcpkg).

Alternatively, you can pass the following to CMake when configuring:

  -D CMAKE_TOOLCHAIN_FILE=$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake
