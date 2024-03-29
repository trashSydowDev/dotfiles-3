# If not running interactively, don't do anything
# 

[ -z "$PS1" ] && return

# Shell
SHELL_BASH=true
SHELL_ZSH=false

# OS

if [ "$(uname -s)" = "Darwin" ]; then
    OS="OSX"
else
    OS=$(uname -s)
fi

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)

READLINK=$(which greadlink || which readlink)

if $SHELL_BASH; then
    CURRENT_SCRIPT=$BASH_SOURCE
else
    CURRENT_SCRIPT=$0
fi

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
    SCRIPT_PATH=$($READLINK -n "$CURRENT_SCRIPT")
    DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.dotfiles" ]; then
    DOTFILES_DIR="$HOME/.dotfiles"
else
    echo "Unable to find dotfiles, exiting."
    return # `exit 1` would quit the shell itself
fi

# Finally we can source the dotfiles (order matters)
for DOTFILE in "$DOTFILES_DIR"/system/.{env,grep,prompt}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if [ "$OS" = "OSX" ]; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,}.osx; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

if $SHELL_BASH; then
    for DOTFILE in "$DOTFILES_DIR"/system/.*.bash; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

# Hook for extra/custom stuff

EXTRA_DIR="$HOME/.extra"

if [ -d "$EXTRA_DIR" ]; then
    for EXTRAFILE in "$EXTRA_DIR"/runcom/*.sh; do
        [ -f "$EXTRAFILE" ] && . "$EXTRAFILE"
    done
fi

# Source git autocomplete
source ~/git-completion.bash

# Source aditional functions
source $DOTFILES_DIR/terminal/colors.sh

# Terminal settings
terminal_set_foreground_color white
terminal_set_background_color SuperGray
terminal_set_font "Andale Mono" 16

# Vim

cp $DOTFILES_DIR/vim/vimrc ~/.vimrc
cp $DOTFILES_DIR/vim/vundle.vim ~/.vim

# Clean up

unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

# Export

export SHELL_BASH SHELL_ZSH OS DOTFILES_DIR EXTRA_DIR

#################################################################
# Netshoes
#################################################################

export CATALINA_HOME=/Users/$(whoami)/bin/apache-tomcat-6.0.43
export JRE_HOME="/Library/Java/Home"
export JAVA_HOME=$JRE_HOME

# Services
alias ns-up="cd $CATALINA_HOME/bin && . catalina.sh start && cd -"
alias ns-down="cd $CATALINA_HOME/bin && . catalina.sh stop && cd -"
