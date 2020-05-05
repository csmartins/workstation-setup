#!/bin/bash

echo "+++++++++++++++++++++++++++ Updating system for no surprises +++++++++++++++++++++++++++"
sudo apt update

echo "+++++++++++++++++++++++++++ Installing some awesome tools for you, awesome developer +++"
sudo apt install -y git curl google-chrome-stable

echo "+++++++++++++++++++++++++++ Now I'm gonna make this terminal awesome +++++++++++++++++++"
sudo apt install -y git-core zsh tmux
sudo sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
