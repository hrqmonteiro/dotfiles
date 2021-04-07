# EXPORTS

# PATHS
export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/opt/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/applications:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin/rbenv:$PATH"
export PATH="$HOME/.rbenv/bin/shims:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/bin/openssl:$PATH"
export PATH="/home/hrq/.gem/ruby/3.0.0/bin:$PATH"
export DENO_INSTALL="/home/hrq/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$HOME/.go/bin:$PATH"
export GOPATH="$HOME/.go"

SVDIR=~/.services

# MANPAGES PATHS
export MANPATH="/usr/share/doc:/usr/share/man:/usr/local/share/man/"
export MANPATH="$MANPATH:$HOME/.local/share/man"

# NPM
export PATH="$HOME/.npm-global/bin:$PATH"

# JAVA
export JAVA_HOME=/usr/lib/openjdk-11

# SYSTEM
export CHARSET="UTF-8"
export SHELL="/usr/bin/bash"
export PAGER="less"
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export PLAYER="mpv"

# XDG DIRS
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Musics"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

# MANPAGES COLORS
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;32m'     # begin blink
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\e[01;35m'    # begin reverse video
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\e[4;33m'     # begin underline
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline

codi() {
   local syntax="${1:-ruby}"
   shift
   nvim -c \
     "let g:startify_disable_at_vimenter = 1 |\
     set bt=nofile ls=0 noru nonu nornu |\
     hi CodiVirtualText guifg=red
     hi ColorColumn ctermbg=NONE |\
     hi VertSplit ctermbg=NONE |\
     hi NonText ctermfg=0 |\
     Codi $syntax" "$@"
}

# EXA COLORS
# di directories
# ex executable files
# fi regular files
# ln symlinks
# ur,uw,ux user permissions
# gr,gw,gx group permissions
# tr,tw,tx others permissions
# sn the numbers of a file's size
# sb the units of a file's size
# uu user that is you
# un user that is someone else
# gu a group that you belong to
# gn a group you aren't a member of
# ga new file in Git
# gmio a modified file in Git
# gd a deleted file in Git
# gv a renamed file in Git
# da a file's date
# xa is the special attribute
export EXA_COLORS="uu=38;5;11;1:un=34;1:gu=34;1:gn=31;1:da=36;1:gm=33:sn=32;1:sb=38;5;10;1:ur=33;1:uw=31;1:ux=34;1:ue=32;1:gr=33;1:gw=31;1:gx=32;1:tr=33;1:tw=31;1:tx=32;1:fi=37:di=34:ex=38;5;11;1;4:xa=33;1:*.png=35;1:*.jpg=36;1:*.gif=36;1:*.yml=33;1:*.lua=35;1:*.vim=32;1:*.json=33;1:*.rb=31;1:*.css=36;1:*.md=33;1:*.mkd=33;1:*.mkdown=33;1:*.zip=32;1:*.git=34;1:*.py=36;1:*.mp4=38;5;13;1:*.pdf=31;1:*.svg=34;1:*.deb=38;5;11;1:ln=37;41;1:lp=37;41;1:or=41;1:hd=36:bO=37;41;1"

# ALIASES

# ROOT
alias doas="doas --"
alias sudo='sudo '

# APPIMAGES
alias joplin='~/.config/@joplin/Joplin*.AppImage'

# GIT BARE REPOSITORY (DOTFILES MANAGEMENT)
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# LS TO EXA
# alias ls='exa -al --color=always --group-directories-first --icons' # my preferred listing
# alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
# alias ll='exa -l --color=always --group-directories-first --icons'  # long format
# alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing

# XBPS
alias install='doas xbps-install -S'
alias update='doas xbps-install -Suv'
alias remove='doas xbps-remove -R' 

# VIM
alias vim='nvim'
alias statusline='nvim ~/.config/nvim/statusline.vim'
alias init='nvim ~/.config/nvim/init.lua'
alias neptune='nvim ~/.config/nvim/colors/neptune.vim'
alias rc='nvim ~/.config/awesome/rc.lua'
alias bashrc='nvim ~/.bashrc'

# EMACS
alias emacs='emacs-gtk3'

# POWER MANAGEMENT
alias poweroff='loginctl poweroff'
alias reboot='loginctl reboot'
alias suspend='loginctl suspend'

# GIT
alias clone='git clone'

# NAVIGATION
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# CP AND MV CONFIRMATION
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# SYSTEM
alias su='su -p'
alias e='$EDITOR'
alias c='clear'
alias dw='du -chs *'
alias rm='rm -vfr'
alias cp='cp -R'
alias grep='grep --color=auto'
alias x='chmod +x'
alias open='xdg-open'
alias sf='xdg-open $(fzf --height 50% --reverse) 1>/dev/null'
alias lip='ip -f inet -o addr show enp2s0 | grep --color=never -oP "(?<=inet )[0-9.]+"'
alias load='xrdb -load ~/.Xresources'
alias differ='git diff --color-words'
alias xkill='xdotool selectwindow windowkill'
alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# MISCELLANOUS
export LANG=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# START STARSHIP
eval "$(starship init bash)"
