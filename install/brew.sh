# Update Homebrew, formulae, and packages

brew update
brew upgrade

# Install packages

apps=(
    git
    node
    peco
    python
    tree
    vim
    wget
)

brew install "${apps[@]}"
