apps=(
    cloudup
    firefox
    google-drive
    mou
    skype
    slack
    spectacle
    spotify
    utorrent
    virtualbox
    vlc
    sublime-text3
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webpquicklook && qlmanage -r
