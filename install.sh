#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"

# Update dotfiles itself first

[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Bunch of symlinks

ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/git/.git_commit_msg.txt" ~
ln -sfv "$DOTFILES_DIR/etc/mackup/.mackup.cfg" ~
ln -sfv "$DOTFILES_DIR/terminal/.colors.csv" ~

# Git extras

. "$DOTFILES_DIR/git/extras.sh"

if [ -f "$DOTFILES_DIR/install/osx.sh" ]; then
	. "$DOTFILES_DIR/install/osx.sh"
fi

echo "Installation complete! Restart your computer in order to make changes work!"

# Run tests
# bats test/*.bats
