
export DISPLAY
export MYFILES="/mnt/chromeos/MyFiles/Downloads"
export BARTIB_FILE="$TT_CONFIG/activities.bartib"

# Aliases Area

alias myfile="cd $MYFILES"
alias zp='cd $(fd . -t d -d 1 ../|fzy) || return && ls'
alias zc='cd $(fd . -t d -d 2|fzy) || return && ls'

alias ls="ls --color=always --group-directories-first"
alias lsa="ls -A --color=always --group-directories-first"
alias h="cd ~ && ls"
alias b="cd .. && ls"
alias bb="__cd_last_PWD"
alias fdls='fd . -H -t f -d 2'
alias r="exec bash"
alias ee="exit"
alias cl="clear"
alias cdbin='cd /usr/local/bin'

# App lightning Fast

alias initpy='export PYTHONPATH="$PWD"'
alias cmod='fdls | fzy | xargs chmod 700'
alias view='cat $(fdls | fzy)'
alias viewl='cat $1 |rg "^" -n | fzy'
alias fc="find_code"
alias pp='echo $PWD'
alias sc='shellcheck $1'
alias stb='cd $(st change_project bash)'
alias ste='cd $(st change_project tteditor)'
alias ttrc='_ttrc_init'
alias ttenv='env | grep -E "TT.*"'

# functions alias Area

alias find_all_files="fd . -H -t f | fzy -p 'Files ❯ '"
alias ls_all_files="fd . -H -t f -d 5 | fzy -p 'Files ${ARROW}'"
alias find_all_folders="fd -d 5 -t d -H --base-directory ~ | fzy -p 'Folders ${ARROW}'"
alias tobackup='find ~/.config/ -maxdepth 5 -type d -name "Tt*" | fzy'
alias go='cd "$(fd . -d 4 -t d -H ~ | fzf --height=40% --layout=reverse)" && ls'
alias list_env="export | cut -d '=' -f 1 | awk '{print $3}'"
alias list_key_binding="bind -p | fzy"
alias aptls="apt list --installed | grep '$1'"

# bind keymap Area

bind -m emacs -x '"`": "__cmd_complete"'
bind -m vi-insert -x '"h": "__history_complete"'
bind -x '"\e1" : "__last"'
bind -x '"\e=" : "find_all_folders"'
bind -x '"\e-" : "find_all_files"'

# source /workspace

. ~/workspace/bash/alias_cmd
. ~/workspace/bash/tt_prompt
. ~/workspace/bash/init
. ~/workspace/bash/jumpers
. ~/workspace/bash/show
. ~/workspace/bash/finders
. ~/workspace/bash/binding
. ~/workspace/bash/on_exit
# . "$TT_BASH/dynamic_aliases"

# . config_editor
# . backupsh
