#!/usr/bin/env bash

# Install Homebrew & brew-cask
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install brew-cask
brew tap homebrew/versions
brew tap caskroom/versions

# Install brew & brew-cask packages

. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"

# Install bash (with Homebrew)

. "$DOTFILES_DIR/install/bash.sh"

# Install vundle

. "$DOTFILES_DIR/install/vundle.sh"

# Install Ruby gems (SASS, Compass)
# Not OSX-only, but lazy.

sudo gem install compass
sudo gem install sass

# Globally install with npm
# Not OSX-only, but npm was installed from this script as well.

npm install -g bower
npm install -g grunt
npm install -g grunt-cli
npm install -g gulp
npm install -g replace
npm install -g babel
npm install -g peerflix

# Install extra stuff

if [ -d "$EXTRA_DIR" -a -f "$EXTRA_DIR/install/osx.sh" ]; then
    . "$EXTRA_DIR/install/osx.sh"
fi
