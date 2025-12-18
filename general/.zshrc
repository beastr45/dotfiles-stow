# ╭──────────────────────────────────────────────────────────╮
# │                 oh-my-zsh configuration                  │
# ╰──────────────────────────────────────────────────────────╯
#-----------------------------------------------------------------------
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins+=(git exercism zsh-vi-mode)

source $ZSH/oh-my-zsh.sh
#-----------------------------------------------------------------------
# ╭──────────────────────────────────────────────────────────╮
# │                   Zplug configuration                    │
# ╰──────────────────────────────────────────────────────────╯
#-----------------------------------------------------------------------
# source ~/.zplug/init.zsh
#
# zplug "jeffreytse/zsh-vi-mode"
#
# zplug 'zplug/zplug', hook-build:'zplug --self-manage'
#
# # Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# Then, source plugins and add commands to $PATH
# zplug load
# zplug load --verbose

#-----------------------------------------------------------------------
# ╭──────────────────────────────────────────────────────────╮
# │                    User configuration                    │
# ╰──────────────────────────────────────────────────────────╯
#-----------------------------------------------------------------------
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

#macro for gcc cross compile builds
#syntax: prepend i and space to ld and gcc
i(){
  i686-elf-"$@"
}

#neovim switcher script
function nvims() {
  items=("default" "LazyVim" "NvChad" "AstroNvim" "none" "NVsoulfire")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=nvim-configs/$config nvim $@
}
# neovim aliases
alias nvim-lazy="NVIM_APPNAME=nvim-configs/LazyVim nvim"
alias nvim-chad="NVIM_APPNAME=nvim-configs/NvChad nvim"
alias nvim-astro="NVIM_APPNAME=nvim-configs/AstroNvim nvim"
alias nvim-soul="NVIM_APPNAME=nvim-configs/NVsoulfire nvim"
alias nvim-none="NVIM_APPNAME=nvim-configs/none nvim"
alias nvim-kick="NVIM_APPNAME=nvim-configs/kickstart nvim"

export SUDO_EDITOR=nvim

# #rainbow custom prompt :)
# autoload -U colors && colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
# PS1=' %F{green}%n:%~ %F{reset}$ '

# ─[ aliases ]──────────────────────────────────────────────────────────
#useful aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias :q='exit'
alias q='exit'
alias c='clear'
# alias v='~/Applications/nvim-linux-x86_64.appimage'
alias v='nvim'
alias vi='vd'
alias t='tmux'
alias ta='tmux attach'
alias mr='make run'
alias mc='make clean'
alias m='make'
alias lv='/home/bear/.local/bin/lvim'
# alias nf='neofetch'
alias nf='fastfetch'
alias lg='lazygit'
alias cr='cargo run'
alias ct='cargo test'
alias sls='du -sh .*;du -sh *'
alias untrash='trash-restore $(trash-list | sort -r | head -n 1 | awk '\''{print $3}'\'')'
alias cplast='history -1 | awk '\''{$1=""; print $0}'\'' | ccc'
alias quickserver='python -m http.server'
alias cdsc="z scratch"

alias wmf="wmname LG3D"

alias wacomsetup="~/.config/wacom-settings.sh"

alias cocaine="sudo cpupower frequency-set -g performance"
alias heroin="sudo cpupower frequency-set -g powersave"
alias clkh=" lscpu | grep 'MHz'; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"
alias batstat="upower -i $(upower -e | grep BAT)"

# mnemonic names for quickly refrencing helpful cheatSheets
# use cs prefix
alias pt="feh ~/Pictures/cheatSheets/periodicTable.png"
alias cschn="feh ~/Pictures/cheatSheets/chemNameRefrence.png"
alias csr="feh ~/Pictures/cheatSheets/engineering/resistorCheatsheet.png"


# TODO write a script to auto detect build systems
# Some meson shortcuts
alias mesco="meson compile -C build"
alias meru="./build/output"

#epic music :)
alias lofi="nohup ~/scripts/LofiGirlStudyPlay.sh &"
alias lofi_stop="~/scripts/LofiGirlStudyKill.sh"

alias ccmp="commentCP"
alias cpwd='pwd | xclip -sel c'
alias ccc='xclip -sel c'
alias zp='z `xclip -sel clipboard -o`'
alias clip2qr="xclip -selection clipboard -o | qrencode -t ansiutf8"
alias qr2clip='xclip -selection clipboard -t image/png -o | zbarimg --quiet --raw - | xclip -selection clipboard'
# this is an awesome command when paired with a screenshot tool <3 <3 <3
alias clipview="xclip -selection clipboard -t image/png -o > /tmp/clip.png && feh /tmp/clip.png"

alias fm="yazi"
alias gpp="g++"
alias za="zathura"
alias zae="zathura /home/bear/Documents/books/2textbooks/Electric\ Circuits,\ 12e.pdf"
alias zad="zathura /home/bear/Documents/books/2textbooks/Differential\ equations\ and\ linear\ algebra\ Pearson.pdf"
alias zal="zathura /home/bear/Documents/books/2textbooks/EE2301\ Digital\ System\ Textbook.pdf"
alias zac="zathura /home/bear/Documents/books/2textbooks/Chemistry_\ The\ Molecular\ Nature\ Of\ Matter\ And\ Change\ ISE\ --\ Martin.pdf"
alias zap="zathura /home/bear/Documents/books/2textbooks/PhysTextbook.pdf"
function zao() {
  url="$1"
  tmpfile=$(mktemp --suffix=.pdf)
  curl -L -o "$tmpfile" "$url" && zathura "$tmpfile"
  rm -f "$tmpfile"
}
function stash(){
  file="$1"
  mv $file ~/
}

# Remote into phone automations via adb, must be paired over wifi first, can use tailscale for this.
alias rph="~/scripts/phoneshenanigans/remotephone.sh"
alias uph="~/scripts/phoneshenanigans/unlockphone.sh"
alias duo="~/scripts/phoneshenanigans/phoneduologin.sh"

# ─[ path exports ]─────────────────────────────────────────────────────
export PATH=/home/bear/Applications:$PATH
export PATH=/home/bear/scripts:$PATH
export PATH=/opt/nvim-linux64/bin:$PATH
export PATH="$HOME/opt/cross/bin:$PATH"

#export cinnabar path in order to work with mozilla patched which use mercurial
export PATH="/home/bear/.mozbuild/git-cinnabar:$PATH"

# sccache for rust builds
# export RUSTC_WRAPPER=sccache


# enable vi mode this isnt needed if zsh-vi-mode plugin is being used
# bindkey -v

#change prompt to green if special chars aren't available
if zmodload zsh/terminfo && (( terminfo[colors] >= 256 )); then
  # capable terminal
  eval "$(starship init zsh)"
else
  # might be TTY or some other not very capable terminal
  # PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
  PS1=' %F{green}%n:%~ %F{reset}$ '
fi
#-----------------------------------------------------------------------

# export JAVA_HOME=/usr/lib/jvm/java-21-openjdk

# Source the python virtual environment
# this allows you to install python CLIs without pesky arch packaging getting in the way.
# TO create a new one run python3 -m venv .venv
# Make sure to always use the {-m} pip flag
source ~/.venv/bin/activate 

#use eval to attach shell apps to zsh
eval "$(zoxide init zsh)"

# Created by `pipx` on 2025-02-16 20:08:41
export PATH="$PATH:/home/bear/.local/bin"
