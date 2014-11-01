# do nothing if not running interactively
[ -z "${PS1}" ] && return

[ -z "${BASH_COMPLETION_COMPAT_DIR}" ] && [ -f /etc/bash_completion ] && . /etc/bash_completion

# make less more friendly for non-text input files, see lesspipe(1)
if command -v "lesspipe" >/dev/null 2>&1; then
    eval "$(SHELL=/bin/sh lesspipe)"
fi

#/etc/terminfo/*
#export TERM="xterm-color"
#export TERM="xterm-256color"

# Change the X terminal window title
case "${TERM}" in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
        PROMPT_COMMAND='printf "%b" "\033]0;${PWD/$HOME/~}\007"' ;;
    screen)
        PROMPT_COMMAND='printf "%b" "\033_${PWD/$HOME/~}\033\\"' ;;
esac

# increase modularity
if [ -d ~/.profile.d ]; then
  for i in ~/.profile.d/*.sh; do
    [ -r $i ] && . $i
  done
  unset i
fi
