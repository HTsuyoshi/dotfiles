# Colors
autoload -U colors && colors
export TERM=xterm-256color

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

CASE_SENSITIVE="true"

# AutoComplete
autoload -Uz compinit
compinit
_comp_options+=(globdots);

# Cursor speed
xset r rate 250 60

# Set default
export EDITOR='/bin/nvim'

# Aliases
alias ls="exa"
alias spotify-tui="spt"
alias WEEB="source $HOME/.scripts/WEEB.zsh"
alias FURQUIM="source $HOME/.scripts/FURQUIM.zsh"
alias AZZESP="PS1='$MAINCOLOR%n%F{reset}%F{8}@%F{reset}%m > '"

## TMUX
alias tmuxn='tmux new-session -s $$'
_trap_exit() { tmux kill-session -t $$; }
trap _trap_exit EXIT

## Flameshot
alias flameshot="flameshot gui"

# Bindkeys

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "\e[3~" delete-char 
bindkey -s '^l' '^Uclear; taskbook;^M'

# PS1
MAINCOLOR="%F{196}" # vermelho
#MAINCOLOR="%F{magenta}" # pink
#MAINCOLOR="%F{148}" # purple
#MAINCOLOR="%F{white}" # branco
#MAINCOLOR="%F{202}" # laranja
SECCOLOR="%F{8}" # cinza
TERCOLOR="%F{white}" # branco
#TERCOLOR="%F{magenta}" # pink

# Vi mode
bindkey -v
export KEYTIMEOUT=1

## Init
setopt PROMPT_SUBST

## Option
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

PROMPT='$MAINCOLOR%n%F{reset}$SECCOLOR@%F{reset}$TERCOLOR%m%F{reset} %~ %(?.$TERCOLOR$THEME_VI_MODE_SYMBOL.$MAINCOLOR$THEME_VI_MODE_SYMBOL)%F{reset} '
