#!/bin/bash

echo "Install Homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Finish installing Homebrew"

echo "Installing Tsuru Client"
brew tap tsuru/homebrew-tsuru
brew install tsuru
echo "Finish installing Tsuru"

echo "Installing Azure Cli"
brew install azure-cli
echo "Finish installing Azure Cli"

echo "Installing Slack"
brew cask install slack
echo "Finish installing slack"

echo "Installing Postman"
brew cask install postman
echo "Finish installing Postman"

echo "Installing wget"
brew install wget
echo "Finish installing wget"

echo "Installing tfenv"
brew install tfenv
echo "Finish installing tfenv"

echo "Installing docker"
brew cask install docker
echo "Finish installing docker"

echo "Installing npm"
brew install npm
echo "Finish installing npm"

echo "Installing hub"
brew install hub
echo "Finish installing hub"

# skip this step if gcloud directory already exist
echo "Installing gcloud sdk"
curl https://sdk.cloud.google.com | bash
echo "Finish installing gcloud sdk"

echo "Make pip great again"
brew install pipenv
echo "Now we have a decent Python package manager"

echo "Install jq"
brew install jq
echo "Finish installing jq"

echo "Install Remote Desktop Manager"
brew install cask microsoft-remote-desktop-beta
echo "Finish installing Remote Desktop Manager"

# find a way to open a new terminal once the installation is finished
#exit

if [[ $(mdfind "kMDItemKind == 'Application'" -onlyin ~/Applications | grep "Visual Studio Code") ]]; then
echo "vscode already installing, passing through"
else
echo "Installing vscode, a decent text editor"
mkdir mac-setup-temp
wget https://az764295.vo.msecnd.net/stable/f359dd69833dd8800b54d458f6d37ab7c78df520/VSCode-darwin-stable.zip -P mac-setup-temp/
unzip mac-setup-temp/VSCode-darwin-stable.zip -d mac-setup-temp
mv -nv mac-setup-temp/Visual\ Studio\ Code.app/ ~/Applications/

cat << EOF >> ~/.bash_profile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF
echo "Finish installing vscode"
fi

echo "Will install TMUX if this terminal is like shit"
if [ ! -x "$(command -v tmux)" ]; then
echo "TMUX is not installed, so i am making terminal great again"
brew install tmux
cat << EOF >> ~/.bash_profile
tmux
EOF
else
echo "This terminal is already awesome, passing through"
fi

echo "Installing OhMyZSH"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
echo "Finished ZSH"

echo "Configuring screenshot default folder destination"
defaults write com.apple.screencapture location ~/Pictures/
killall SystemUIServer
echo "Finish"
