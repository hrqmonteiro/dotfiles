### EXPORT ###
set TERM "xterm-kitty"                         # Sets the terminal type
set EDITOR "nvim"
set -Ux EDITOR nvim

set --export NNN_PLUG "p:preview-tui"
set --export NNN_OPTS "H"
set --export NNN_FIFO "/tmp/nnn.fifo"

set BLK "0B"
set CHR "0B"
set DIR "04"
set EXEC "06"
set FILE "00"
set MULTIHARDLINK "06"
set LINK "06"
set MISSING 00 # Not sure what this is
set ORPHAN "09"
set FIFO "06"
set SOCK "0B"
set OTHER 06

set --export NNN_FCOLORS "$BLK$CHR$DIR$EXEC$FILE$MULTIHARDLINK$LINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

set --export FFF_KEY_IMAGE "i"

# PATHS
# set PATH /bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/opt/bin:$PATH
# set PATH /home/hrq/.local/bin:$PATH
# set PATH home/hrq/.local/share/applications:$PATH
# # export PATH="$HOME/.rbenv/bin:$PATH"
# # export PATH="$HOME/.rbenv/bin/rbenv:$PATH"
# # export PATH="$HOME/.rbenv/bin/shims:$PATH"
# # eval "$(rbenv init -)"
# # export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
# set PATH home/hrq/.cargo/bin:$PATH
# set PATH /bin/openssl:$PATH
# # export PATH="/home/hrq/.gem/ruby/3.0.0/bin:$PATH"
# set DENO_INSTALL /home/hrq/.deno
# set PATH home/hrq/.go/bin:$PATH
# set GOPATH home/hrq/.go

# EXA
set EXA_COLORS "uu=38;5;11;1:un=34;1:gu=34;1:gn=31;1:da=36;1:gm=33:sn=32;1:sb=38;5;10;1:ur=33;1:uw=31;1:ux=34;1:ue=32;1:gr=33;1:gw=31;1:gx=32;1:tr=33;1:tw=31;1:tx=32;1:fi=37:di=34:ex=38;5;11;1;4:xa=33;1:*.png=35;1:*.jpg=36;1:*.gif=36;1:*.yml=33;1:*.lua=35;1:*.vim=32;1:*.json=33;1:*.rb=31;1:*.css=36;1:*.md=33;1:*.mkd=33;1:*.mkdown=33;1:*.zip=32;1:*.git=34;1:*.py=36;1:*.mp4=38;5;13;1:*.pdf=31;1:*.svg=34;1:*.deb=38;5;11;1:ln=37;41;1:lp=37;41;1:or=41;1:hd=36:bO=37;41;1"

# ALIASES
alias doas="doas --"
alias sudo='sudo '

# nnn
alias nnn 'nnn -e -Pp'

# APPIMAGES
alias joplin '~/.config/@joplin/Joplin*.AppImage'

# GIT BARE REPOSITORY (DOTFILES MANAGEMENT)
alias config '/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# LS TO EXA
alias ls 'exa -al --color=always --group-directories-first --icons' # my preferred listing
alias la 'exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll 'exa -l --color=always --group-directories-first --icons'  # long format
alias lt 'exa -aT --color=always --group-directories-first --icons' # tree listing

alias install 'doas xbps-install -S'
alias update 'doas xbps-install -Suv'
alias remove 'doas xbps-remove -R' 

# VIM
alias vim 'nvim'
alias init 'nvim ~/.config/nvim/init.lua'
alias rc 'nvim ~/.config/awesome/rc.lua'
alias bashrc 'nvim ~/.bashrc'

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
# alias open='xdg-open'
# alias sf='xdg-open $(fzf --height 50% --reverse) 1>/dev/null'
# alias lip='ip -f inet -o addr show enp2s0 | grep --color=never -oP "(?<=inet )[0-9.]+"'
# alias load='xrdb -load ~/.Xresources'
# alias differ='git diff --color-words'
# alias xkill='xdotool selectwindow windowkill'
# alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/.rbenv/bin $HOME/.rbenv/bin/rbenv $HOME/.rbenv/bin/shims $HOME/.rbenv/plugins/ruby-build/bin $HOME/.cargo/bin $fish_user_paths

rbenv init - fish | source

function fish_greeting 
end

set theme_color_scheme "nord"
# set -g theme_display_git yes
# set -g theme_display_git_dirty yes
# set -g theme_display_git_untracked yes
# set -g theme_display_git_ahead_verbose yes
# set -g theme_display_git_dirty_verbose yes
# set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_default_branch yes
# set -g theme_git_default_branches master main
# set -g theme_git_worktree_support yes
# set -g theme_use_abbreviated_branch_name yes
# set -g theme_display_vagrant no
# set -g theme_display_docker_machine no
# set -g theme_display_k8s_context yes
# set -g theme_display_hg yes
# set -g theme_display_virtualenv no
# set -g theme_display_nix no
# set -g theme_display_ruby yes
# set -g theme_display_node yes
# set -g theme_display_user ssh
# set -g theme_display_hostname ssh
# set -g theme_display_vi no
set -g theme_display_date no
# set -g theme_display_cmd_duration yes
# set -g theme_title_display_process yes
# set -g theme_title_display_path no
# set -g theme_title_display_user no
# set -g theme_title_use_abbreviated_path no
# set -g theme_date_format "+%a %H:%M"
# set -g theme_date_timezone America/Los_Angeles
# set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
# set -g theme_show_exit_status yes
# set -g theme_display_jobs_verbose yes
# set -g default_user your_normal_user
# set -g theme_color_scheme nord
# set -g fish_prompt_pwd_dir_length 0
# set -g theme_project_dir_length 1
# set -g theme_newline_cursor no
# set -g theme_newline_prompt '> '

set nord0 2e3440
set nord1 3b4252
set nord2 434c5e
set nord3 4c566a
set nord4 d8dee9
set nord5 e5e9f0
set nord6 eceff4
set nord7 8fbcbb
set nord8 88c0d0
set nord9 81a1c1
set nord10 5e81ac
set nord11 bf616a
set nord12 d08770
set nord13 ebcb8b
set nord14 a3be8c
set nord15 b48ead

set fish_color_normal $nord4
set fish_color_command $nord9
set fish_color_quote $nord14
set fish_color_redirection $nord9
set fish_color_end $nord6
set fish_color_error $nord11
set fish_color_param $nord4
set fish_color_comment $nord3
set fish_color_match $nord8
set fish_color_search_match $nord8
set fish_color_operator $nord9
set fish_color_escape $nord13
set fish_color_cwd $nord8
set fish_color_autosuggestion $nord6
set fish_color_user $nord4
set fish_color_host $nord9
set fish_color_cancel $nord15
set fish_pager_color_prefix $nord13
set fish_pager_color_completion $nord6
set fish_pager_color_description $nord10
set fish_pager_color_progress $nord12
set fish_pager_color_secondary $nord1

# TokyoNight Color Palette
# set -l foreground c0caf5
# set -l selection 364A82
# set -l comment 565f89
# set -l red f7768e
# set -l orange ff9e64
# set -l yellow e0af68
# set -l green 9ece6a
# set -l purple 9d7cd8
# set -l cyan 7dcfff
# set -l pink bb9af7
# 
# # Syntax Highlighting Colors
# set -g fish_color_normal $foreground
# set -g fish_color_command $cyan
# set -g fish_color_keyword $pink
# set -g fish_color_quote $yellow
# set -g fish_color_redirection $foreground
# set -g fish_color_end $orange
# set -g fish_color_error $red
# set -g fish_color_param $purple
# set -g fish_color_comment $comment
# set -g fish_color_selection --background=$selection
# set -g fish_color_search_match --background=$selection
# set -g fish_color_operator $green
# set -g fish_color_escape $pink
# set -g fish_color_autosuggestion $comment
# 
# # Completion Pager Colors
# set -g fish_pager_color_progress $comment
# set -g fish_pager_color_prefix $cyan
# set -g fish_pager_color_completion $foreground
# set -g fish_pager_color_description $comment

if test -n "$XDG_CONFIG_HOME"
    set sessions_dir $XDG_CONFIG_HOME/.config/nnn/sessions
else
    set sessions_dir $HOME/.config/nnn/sessions
end

complete -c nnn -s a    -d 'auto-create NNN_FIFO'
complete -c nnn -s A    -d 'disable dir auto-select'
complete -c nnn -s b -r -d 'bookmark key to open' -x -a '(echo $NNN_BMS | awk -F: -v RS=\; \'{print $1"\t"$2}\')'
complete -c nnn -s c    -d 'cli-only opener'
complete -c nnn -s C    -d 'color by context'
complete -c nnn -s d    -d 'start in detail mode'
complete -c nnn -s D    -d 'dirs in context color'
complete -c nnn -s e    -d 'open text files in $VISUAL/$EDITOR/vi'
complete -c nnn -s E    -d 'use EDITOR for undetached edits'
complete -c nnn -s f    -d 'use readline history file'
complete -c nnn -s F    -d 'show fortune'
complete -c nnn -s g    -d 'regex filters'
complete -c nnn -s H    -d 'show hidden files'
complete -c nnn -s J    -d 'no auto-proceed on select'
complete -c nnn -s K    -d 'detect key collision'
complete -c nnn -s l -r -d 'lines to move per scroll'
complete -c nnn -s n    -d 'start in type-to-nav mode'
complete -c nnn -s o    -d 'open files only on Enter'
complete -c nnn -s p -r -d 'copy selection to file' -a '-\tstdout'
complete -c nnn -s P -r -d 'plugin key to run' -x -a '(echo $NNN_PLUG | awk -F: -v RS=\; \'{print $1"\t"$2}\')'
complete -c nnn -s Q    -d 'disable quit confirmation'
complete -c nnn -s r    -d 'show cp, mv progress (Linux-only)'
complete -c nnn -s R    -d 'disable rollover at edges'
complete -c nnn -s s -r -d 'load session by name' -x -a '@\t"last session" (ls $sessions_dir)'
complete -c nnn -s S    -d 'persistent session'
complete -c nnn -s t -r -d 'timeout in seconds to lock'
complete -c nnn -s T -r -d 'a d e r s t v'
complete -c nnn -s u    -d 'use selection (no prompt)'
complete -c nnn -s U    -d 'show user and group'
complete -c nnn -s V    -d 'show program version and exit'
complete -c nnn -s w    -d 'hardware cursor mode'
complete -c nnn -s x    -d 'notis, sel to system clipboard, xterm title'
complete -c nnn -s h    -d 'show program help'

# starship init fish | source
