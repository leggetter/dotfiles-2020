#!/bin/sh

# A file for running tests :)

# VAR=$(asdf list python 2>&1)
# ERROR=$(</tmp/Error)
# echo "VAR value is '$VAR'"
# echo "ERROR value is '$ERROR'"
if [[ $(asdf list python 2>&1) == "No such plugin"* ]]; then
    echo "asdf python plugin NOT installed"
else
    echo "asdf nodejs plugin already installed"
fi

NODE_VERSION=$(node -v)
echo "NODE_VERSION value is '$NODE_VERSION'"

ASDF_LATEST_NODE=$(asdf latest nodejs)
echo "ASDF_LATEST_NODE value is '$ASDF_LATEST_NODE'"
if [[ $(node -v) != *$(asdf latest nodejs) ]]; then
    echo "Need to install latest"
else
    echo "Latest version of nodejs already installed"
fi