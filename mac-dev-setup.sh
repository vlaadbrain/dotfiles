#!/bin/bash

# install brew
if ! hash brew
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew update
else
  printf "\e[93m%s\e[m\n" "You already have brew installed."
fi

# CURL / WGET
brew install bundle
brew bundle install --file=~/.config/dotfiles/Brewfile

# Install oh-my-zsh on top of zsh to getting additional functionality
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Language
## Node / Javascript
mkdir ~/.nvm
nvm install node                                                                                     # "node" is an alias for the latest version
