#!/bin/bash

echo "+++++++++++++++++++++++++++ Updating system for no surprises +++++++++++++++++++++++++++"
sudo apt update

echo "+++++++++++++++++++++++++++ Installing some awesome tools for you, awesome developer +++"
sudo apt install -y git curl pwgen
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo snap install --classic code

echo "+++++++++++++++++++++++++++ Installing some awesome pythonic tools +++++++++++++++++++++"
sudo apt install software-properties-common python-software-properties
sudo add-apt-repository ppa:pypa/ppa
sudo apt update
sudo apt install python3-pip -y
pip3 install --user pipenv
export PATH="$PATH:$HOME/.local/bin"
curl https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"

echo "+++++++++++++++++++++++++++ Installing chemestry tools ++++++++++++++++++++++++++++++++"
echo "+++++++++++++++++++++++++++ Installing Quantum Espresso 6.4 +++++++++++++++++++++++++++"
wget -O q-e.tgz https://github.com/QEF/q-e/releases/download/qe-6.4/qe-6.4_release_pack.tgz
sudo tar -xzvf q-e.tgz -C /opt/
sudo /opt/qe_release_6.4/configure
sudo make -C /opt/qe_release_6.4/ all

echo "+++++++++++++++++++++++++++ Installing Quantum Espresso 6.5 +++++++++++++++++++++++++++"
wget -O q-e.tgz https://github.com/QEF/q-e/releases/download/qe-6.5/qe-6.5-ReleasePack.tgz
sudo tar -xzvf q-e.tgz -C /opt/
sudo /opt/qe-6.5/configure
sudo make -C /opt/qe-6.5/ all

echo "+++++++++++++++++++++++++++ Installing Xcrysden 1.6.2 +++++++++++++++++++++++++++++++++"
sudo apt install -y tk libglu1-mesa libtogl2 libfftw3-3 libxmu6 imagemagick openbabel libgfortran5
wget -O xcrysden.tar.gz http://www.xcrysden.org/download/xcrysden-1.6.2-linux_x86_64-shared.tar.gz
sudo tar -xzvf xcrysden.tar.gz -C /opt/

echo "+++++++++++++++++++++++++++ Installing Xmgrace ++++++++++++++++++++++++++++++++++++++++"
sudo apt-get install -y grace