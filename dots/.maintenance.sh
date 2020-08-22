#!/usr/bin/env bash

set -e

# Update the dots
cd ~/dot
git stash
git pull
git stash pop
make

# Update Brew
brew update
brew upgrade
brew cask upgrade

# Update Atom
apm update --confirm false
