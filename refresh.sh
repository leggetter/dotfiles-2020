#!/bin/sh

# Install or update via Homebrew
./homebrew.sh

# asdf
asdf plugin-add nodejs
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring;
asdf install nodejs latest
asdf global nodejs $(asdf latest nodejs)
