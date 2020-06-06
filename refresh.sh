#!/bin/sh

# Install or update via Homebrew
echo "Installing/Updating Homebrew"
./homebrew.sh

# Install oh-my-zsh theme
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  ./oh-my-zsh-setup.sh
fi

# asdf
if [[ $(asdf list nodejs) != *$(No such plugin) ]]; then
    asdf plugin-add nodejs
    bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
else
    echo "asdf nodejs plugin already installed"
fi

if [[ $(node -v) != *$(asdf latest nodejs) ]]; then
    asdf install nodejs latest
    asdf global nodejs $(asdf latest nodejs)
else
    echo "Latest version of nodejs already installed"
fi

# Yeoman
if test ! $(which yo); then  
    npm install -g yo

    # yo repo (for license, code of conduct)
    npm install -g generator-repo
fi
