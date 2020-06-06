#!/bin/sh

if [ ! -d "$HOME/.ssh" ]; then
    echo "Creating .ssh directory"
    mkdir $HOME/.ssh
fi

while ! [[ -f $HOME/.ssh/id_rsa && -f $HOME/.ssh/id_rsa.pub ]]
do
    if [ -f $HOME/.ssh/id_rsa ]; then
        echo "id_rsa exists"
    fi

    if [ -f $HOME/.ssh/id_rsa.pub ]; then
        echo "id_rsa.pub exists"
    fi

    echo "Please add your private and public keys to ${HOME}/.ssh/"

    read -p "Press any key to continue... " -n1 -s
done

# Add to keychain 
# Will be prompted for passphrase, if one exists
ssh-add -K $HOME/.ssh/id_rsa
ssh-add -A

# Config that means passphrase won't be asked for again
if [ -f $HOME/.ssh/config ]; then
    echo ".ssh/config already exists - backing up"
    mv "${HOME}/.ssh/config" "${HOME}/.ssh/config-$(date +%F-%H%M%S)"
fi

ln -s $HOME/.dotfiles/ssh-config $HOME/.ssh/config 

chmod 700 ~/.ssh
chmod 644 ~/.ssh/config
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub