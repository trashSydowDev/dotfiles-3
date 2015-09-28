# Update Homebrew, formulae, and packages

brew update
brew upgrade

# Install packages

apps=(
    dockutil
    git
    node
    peco
    python
    tree
    vim
    wget
)

brew install "${apps[@]}"
