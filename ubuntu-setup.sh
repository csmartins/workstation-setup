#!/bin/bash

echo "+++++++++++++++++++++++++++ Updating system for no surprises +++++++++++++++++++++++++++"
sudo apt update

echo "+++++++++++++++++++++++++++ Installing some awesome tools for you, awesome developer +++"
sudo apt install -y git curl google-chrome-stable pwgen
sudo snap install --classic code
sudo apt install software-properties-common python-software-properties
sudo add-apt-repository ppa:pypa/ppa
sudo apt update
sudo apt install python3-pip
pip3 install --user pipenv
export PATH="$PATH:$HOME/.local/bin"

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-commo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

git clone https://github.com/tfutils/tfenv.git ~/.tfenv
export PATH="$PATH:$HOME/.tfenv/bin"

echo "+++++++++++++++++++++++++++ Installing some additional cool things +++++++++++++++++++++"
sudo snap install vlc
wget -O stremio.deb https://dl.strem.io/linux/v4.4.106/stremio_4.4.106-1_amd64.deb
sudo apt install ./stremio.deb

echo "+++++++++++++++++++++++++++ Making some base development setup +++++++++++++++++++++++++"
mkdir -p ~/projects/challenges
mkdir -p ~/projects/study
git config --global user.email "csmartins.personal@gmail.com"
git config --global user.name "Cadu Martins"

echo "+++++++++++++++++++++++++++ Now I'm gonna make this terminal awesome +++++++++++++++++++"
sudo apt install -y git-core zsh tmux
sudo sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "Add tmux and zsh commands to your ~/.bashrc, one at each line, so you don't need to open tmux manualy"
