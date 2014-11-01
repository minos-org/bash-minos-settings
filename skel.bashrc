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

#TODO 27-10-2014 18:55 >> add to skel ~/.profile.d/shundle.sh in a ¿shundle package?
#http://github.com/chilicuil/shundle
if [ -f ~/.shundle/bundle/shundle/shundle ]; then
    #let shundle manage shundle, required!
    .  ~/.shundle/bundle/shundle/shundle
    Bundle='chilicuil/shundle'
        #SHUNDLE_ENV_VERBOSE="0"
        #SHUNDLE_ENV_DEBUG="0"
        SHUNDLE_ENV_COLOR="1"

    #from GitHub
    Bundle="gh:chilicuil/shundle-plugins/eternalize"
        ETERNALIZE_PATH="${HOME}/.eternalize-data"
    Bundle="github:chilicuil/shundle-plugins/colorize"
        COLORIZE_THEME="blacky"
        COLORIZE_PS="yujie"
    Bundle="chilicuil/shundle-plugins/aliazator.git"
        #ALIAZATOR_PLUGINS="none"
        #ALIAZATOR_PLUGINS="minimal"
        ALIAZATOR_PLUGINS="installed"
        #ALIAZATOR_PLUGINS="all"
        #ALIAZATOR_PLUGINS="custom:minimal,git,apt-get,vagrant,vim"
        #ALIAZATOR_CLOUD="url"

   #from non GitHub
   #Bundle='git://git.domain.com/rep.git'

   #from the web
   #Bundle='http://domain.com/awesome-script'

   #from the file system
   #Bundle='file://path/to/script'
fi
