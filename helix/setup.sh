#!/bin/bash

sudo add-apt-repository ppa:maveonair/helix-editor -y && sudo apt update && sudo apt install helix

if [ $? -ne 0 ]; then
    echo "Unable to install helix"
    exit 1
fi

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

if [ -x "$(command -v nvm)" ]; then
    echo "Error installing nvm"
    exit 1
fi

nvm install --lts || exit 1

npm install -g dockerfile-language-server-nodejs @microsoft/compose-language-service yaml-language-server vscode-langservers-extracted typescript typescript-language-server bash-language-server

if [ ! -d ~/.config/helix ]; then
    mkdir -p ~/.config/helix
fi

for file in "languages.toml" "config.toml"; do
    curl "https://raw.githubusercontent.com/singh-inder/config-files/refs/heads/main/helix/$file" -o ~/.config/helix/"$file"
done
