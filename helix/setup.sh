if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

add-apt-repository ppa:maveonair/helix-editor
apt update
apt install helix

# TODO Install common lsp
