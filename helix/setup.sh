#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

add-apt-repository ppa:maveonair/helix-editor && apt update && apt install helix

if [ $? -ne 0 ]; then
  echo "Unable to install helix"
  exit 1
fi

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

if [ -x "$(command -v nvm)" ]; then
  echo "Error installing nvm"
  exit 1
fi

npm install -g dockerfile-language-server-nodejs @microsoft/compose-language-service yaml-language-server vscode-langservers-extracted typescript typescript-language-server

for file in "languages.toml" "config.toml"; do
  curl "https://raw.githubusercontent.com/singh-inder/config-files/refs/heads/main/helix/$file" -o ~/.config/helix/"$file"
done
