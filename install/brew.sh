# Update Homebrew, formulae, and packages

brew update
brew upgrade

# Install packages

apps=(
    ffmpeg
    gifsicle
    git
    node
    peco
    python
    ssh-copy-id
    tree
    vim
    wget
)

brew install "${apps[@]}"
