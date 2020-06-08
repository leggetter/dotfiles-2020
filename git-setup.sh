#!/bin/sh

echo "Please provide the following for your global git config"
IFS= read -r -p "What is your name? " gitName
IFS= read -r -p "What is your email address? " gitEmail

git config --global user.name "$gitName"
git config --global user.email "$gitEmail"