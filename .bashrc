# If not running interactively, don't do anything
 [[ $- != *i* ]] && return
# Startup sway and swaybg 
if [[ -z $DISPLAY  ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec sway 
fi

alias vim=nvim
#alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias ls='ls --color=auto'
alias py='python3'
alias weather='curl wttr.in'

function gu {
  case $1 in
    dev)
      git config user.name "$name2"
      git config user.email "$email2"
      eval $(ssh-agent)
      ssh-add ~/.ssh/id_ed25519
      ;;
    *)
      git config user.name "$name1"
      git config user.email "$email1"
      eval $(ssh-agent)
      ssh-add ~/.ssh/id_rsa
      ;;
  esac
} 

function swayprop() {
  $(~/.config/sway/swayprop.sh)
} 

function __virtualenv_info() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
      venv="${VIRTUAL_ENV##*/}"
  else
    venv=""
  fi 
  [[ -n "$venv" ]] && echo "(venv:$venv) "
}

VENV="\$(__virtualenv_info)"
PROMPT_COMMAND='__git_ps1 "[\u@\h \w]${VENV}" "\$ "'

export PATH="${PATH}:${HOME}/.local/bin"
export XDG_CACHE_HOME=$HOME/.cache
export TERMINAL=alacritty
export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH
export GIT_PS1_SHOWDIRTYSTATE="true"
export GIT_PS1_SHOWSTASHSTATE="true"
export GIT_PS1_SHOWUNTRACKEDFILES="true"
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS="true"

(cat ~/.cache/wal/sequences &)
source ~/.ssh/ssh.config
source ~/.cache/wal/colors-tty.sh
source ~/.git-completion.bash
source ~/.git-prompt.sh
