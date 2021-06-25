CASE_SENSITIVE="true"

autoload -U colors && colors
export TERM=xterm-256color
alias ls="ls --color=auto"
alias mv='mv -i'

# plugins=(git)

# [[ -s /home/$USER/.autojump/etc/profile.d/autojump.sh ]] && source /home/$USER/.autojump/etc/profile.d/autojump.sh

# Bindkey

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "\e[3~" delete-char 

# Vermelhao
# alias AZZ="PS1='%F{196}%n%F{reset}%F{8}@%F{reset}%m %~> '"
# alias AZZESP="PS1='%F{196}%n%F{reset}%F{8}@%F{reset}%m > '"

# Laranja
alias AZZ="PS1='%F{202}%n%F{reset}%F{8}@%F{reset}%m %~> '"
alias AZZESP="PS1='%F{202}%n%F{reset}%F{8}@%F{reset}%m > '"

AZZ

alias WEEB="source /home/doom/.scripts/WEEB.zsh"

# TMUX

alias tmuxn='tmux new-session -s $$'
_trap_exit() { tmux kill-session -t $$; }
trap _trap_exit EXIT

# Flameshot

alias flameshot="flameshot gui"

# Background
# alias EITS="feh --no-fehbg --bg-scale /home/doom/Imagens/EITS/catacat.png"
# alias EITSS="feh --no-fehbg --bg-scale /home/doom/Imagens/EITS/catacatmenro.png"
# alias STIE="/home/doom/.fehbg"

# Vi mode

bindkey -v
export KEYTIMEOUT=1

## Init
setopt PROMPT_SUBST

## Options
THEME_PROMPT_PREFIX=${THEME_PROMPT_PREFIX:-''}
THEME_VI_INS_MODE_SYMBOL=${THEME_VI_INS_MODE_SYMBOL:-'λ'}
THEME_VI_CMD_MODE_SYMBOL=${THEME_VI_CMD_MODE_SYMBOL:-'ᐅ'}

## Set symbol for the initial mode
THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"

# on keymap change, define the mode and redraw prompt
zle-keymap-select() {
  if [ "${KEYMAP}" = 'vicmd' ]; then
    THEME_VI_MODE_SYMBOL="${THEME_VI_CMD_MODE_SYMBOL}"
  else
    THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

# reset to default mode at the end of line input reading
zle-line-finish() {
  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode, you'd be prompted with CMD mode indicator
# while in fact you would be in INS mode.
# Fixed by catching SIGINT (C-c), set mode to INS and repropagate the SIGINT,
# so if anything else depends on it, we will not break it.
TRAPINT() {
  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
  return $(( 128 + $1 ))
}

PROMPT='%F{202}%n%F{reset}%F{8}@%F{reset}%m %~ %(?.%F{white}$THEME_VI_MODE_SYMBOL.%F{202}$THEME_VI_MODE_SYMBOL)%F{reset} '
# PROMPT='$THEME_PROMPT_PREFIX%f%B%F{240}%1~%f%b %(?.%F{green}$THEME_VI_MODE_SYMBOL.%F{red}$THEME_VI_MODE_SYMBOL) '
