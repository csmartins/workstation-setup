#!/bin/bash

echo "+++++++++++++++++++++++++++ Updating system for no surprises +++++++++++++++++++++++++++"
sudo apt update

echo "+++++++++++++++++++++++++++ Installing some awesome tools for you, awesome developer +++"
sudo apt install -y git curl google-chrome-stable pwgen
sudo snap install --classic code

echo "+++++++++++++++++++++++++++ Installing some additional cool things +++++++++++++++++++++"
sudo snap install vlc
wget -O stremio.deb https://dl.strem.io/linux/v4.4.106/stremio_4.4.106-1_amd64.deb
sudo apt install ./stremio.deb

echo "+++++++++++++++++++++++++++ Creating some base development folders +++++++++++++++++++++"
mkdir -p ~/projects/challenges
mkdir -p ~/projects/study

echo "+++++++++++++++++++++++++++ Now I'm gonna make this terminal awesome +++++++++++++++++++"
sudo apt install -y git-core zsh tmux
sudo sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "Add tmux and zsh commands to your ~/.bashrc, one at each line, so you don't need to open tmux manualy"
