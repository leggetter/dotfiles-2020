#!/bin/sh

# Install or update via Homebrew
./homebrew.sh

# asdf
asdf plugin-add nodejs
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring;

if [[ $(node -v) != *$(asdf latest nodejs) ]]; then
    asdf install nodejs latest
    asdf global nodejs $(asdf latest nodejs)
else
    echo "Latest version of nodejs already installed"
fi

# Yeoman
npm install -g yo

# yo repo (for license, code of conduct)
npm install -g generator-repo