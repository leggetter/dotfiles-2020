#!/bin/sh

echo "Setting up your Mac..."

./refresh.sh

./oh-my-zsh-setup.sh

./ssh-config-setup.sh

# Global Git
./git-setup.sh

# Clone Github repositories
./clone.sh

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
