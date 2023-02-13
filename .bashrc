# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Startup sway and swaybg 
if [[ -z $DISPLAY  ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec sway
    exec swaybg -i $HOME/.cache/wal/wal
fi

alias vim=nvim
alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias ls='ls --color=auto'
alias py='python3'
alias spotify=__spotify
alias ala=__ala
alias gu=__gu  # git user switch

function __gu {
    if [[ ! -z $1 ]]
    then
        case $1 in
            aaf)
                git config user.name "$name1"
                git config user.email "$email1"
                eval $(ssh-agent)
                ssh-add ~/.ssh/id_rsa
                echo 1
                ;;
            dev)
                git config user.name "$name2"
                git config user.email "$email2"
                eval $(ssh-agent)
                ssh-add ~/.ssh/id_ed25519
                echo 1
                ;;
            school)
                git config user.name "$name3"
                git config user.email "$email3"
                eval $(ssh-agent)
                ssh-add ~/.ssh/school
                echo 1
                ;;
        esac
    fi
} 

function __spotify {
    systemctl --user start spotifyd &
    nohup alacritty --class=spotify -e spt > /dev/null & exit
}

# Launches alacritty terminals speficied in layout.sh at $1 dir or ~/.
function __ala {
    if [ ! -z $1 ]
    then
        :
        nohup ~/.config/i3/layout.sh $1 > /dev/null & exit
    else
        :
        nohup ~/.config/i3/layout.sh > /dev/null & exit
    fi
}

export PATH="${PATH}:${HOME}/.local/bin"
export XDG_CACHE_HOME=$HOME/.cache
export TERMINAL=alacritty
export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

source ~/.ssh/ssh.config
source ~/.git-prompt.sh

# Syntactic sugar for ANSI escape sequences
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

# Prompt variables
PROMPT_BEFORE="\u@\h \w "
PROMPT_AFTER="$ "
# Prompt command
PROMPT_COMMAND='__git_ps1 "$PROMPT_BEFORE" "$PROMPT_AFTER"'

# Git prompt features (read ~/.git-prompt.sh for reference)
export GIT_PS1_SHOWDIRTYSTATE="true"
export GIT_PS1_SHOWSTASHSTATE="true"
export GIT_PS1_SHOWUNTRACKEDFILES="true"
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS="true"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)
# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences
# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
source ~/.git-completion.bash
source ~/.git-prompt.sh
