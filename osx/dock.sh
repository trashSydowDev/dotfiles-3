#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Launchpad.app"
dockutil --no-restart --add "/Applications/Google Chrome.app/"
dockutil --no-restart --add "/Applications/Reeder.app/"
dockutil --no-restart --add "/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "$HOME/Applications/Spotify.app"
dockutil --no-restart --add "~/Downloads/"

killall Dock
