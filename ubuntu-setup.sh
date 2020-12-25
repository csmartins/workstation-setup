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

sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "+++++++++++++++++++++++++++ Installing tfevn +++++++++++++++++++++++++++++++++++++++++++"

git clone https://github.com/tfutils/tfenv.git ~/.tfenv
export PATH="$PATH:$HOME/.tfenv/bin"

echo "+++++++++++++++++++++++++++ Installing Android Studio and Android development stuf +++++"

sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
wget -O android-studio.tar.gz https://redirector.gvt1.com/edgedl/android/studio/ide-zips/4.1.1.0/android-studio-ide-201.6953283-linux.tar.gz
sudo tar -xf android-studio.tar.gz -C /opt/
alias androidstudio=/opt/android-studio/bin/studio.sh

wget https://services.gradle.org/distributions/gradle-6.4.1-bin.zip -P /tmp
sudo unzip -d /opt/gradle /tmp/gradle-*.zip
sudo echo "export GRADLE_HOME=/opt/gradle/gradle-6.4.1" >> /etc/profile.d/gradle.sh
sudo echo "export PATH=${GRADLE_HOME}/bin:${PATH}" >> /etc/profile.d/gradle.sh
source /etc/profile.d/gradle.sh

echo "+++++++++++++++++++++++++++ Installing some additional cool things +++++++++++++++++++++"
sudo snap install vlc
wget -O stremio.deb https://dl.strem.io/linux/v4.4.106/stremio_4.4.106-1_amd64.deb
sudo apt install ./stremio.deb
sudo add-apt-repository ppa:wireshark-dev/stable
sudo apt-get update
sudo apt-get install wireshark

echo "+++++++++++++++++++++++++++ Making some base development setup +++++++++++++++++++++++++"
mkdir -p ~/projects/challenges
mkdir -p ~/projects/study
git config --global user.email "csmartins.personal@gmail.com"
git config --global user.name "Cadu Martins"

echo "+++++++++++++++++++++++++++ Now I'm gonna make this terminal awesome +++++++++++++++++++"
sudo apt install -y git-core zsh tmux
sudo sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "Add tmux and zsh commands to your ~/.bashrc, one at each line, so you don't need to open tmux manualy"
