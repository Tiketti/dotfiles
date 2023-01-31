#!/bin/sh

set -ex

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# nvm requires some special attention
mkdir -p ~/.nvm

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Install zsh-autosuggestion if not already installed
if test ! -d $ZSH/plugins/zsh-autosuggestions; then
   /bin/bash -c "git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/plugins/zsh-autosuggestions"
fi

# Clone ZSH syntax highlighting - loaded in .zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Use mas to install apps from the App Store
# Too bad this doesn't work because you have to manually sign in into App Store...
source .mas

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
