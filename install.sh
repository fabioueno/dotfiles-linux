#!/usr/bin/env bash

set -e

echo "Setting up..."

# Pip needs to be one of the first things to be installed, because it's a dependency of
# the other packages: PgCli & Pls
echo "Installing Pip..."
sudo apt install -y python3-pip

# Unzip needs to be one of the first things to be installed, because it's a dependency
# of the other packages: Hack Nerd Font & AWS Cli
echo "Installing Unzip..."
sudo apt install -y unzip

echo "Installing ASDF..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0

echo "Installing Atuin..."
bash <(curl https://raw.githubusercontent.com/ellie/atuin/main/install.sh)

echo "Installing AWS Cli..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

echo "Installing Docker..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker $(whoami)

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

echo "Installing FZF..."
sudo apt install -y fzf

echo "Installing Hack Nerd Font..."
sudo apt install -y fontconfig

curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep "browser_download_url.*Hack.zip" | cut -d : -f 2,3 | tr -d \" | wget -qi -
sudo unzip Hack.zip -d /usr/local/share/fonts/
rm Hack.zip
fc-cache -fv

echo "Installing JQ..."
sudo apt install -y jq

echo "Installing Neovim..."
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update -y
sudo apt install -y neovim

echo "Installing Pls..."
pip install --user --upgrade pls

echo "Installing Poetry..."
curl -sSL https://install.python-poetry.org | python3 -

echo "Installing PostgreSQL, PgCli..."
sudo apt install -y postgresql postgresql-contrib

sudo apt install -y libpq-dev python3-pip
sudo pip install pgcli

echo "Installing RipGrep..."
curl -s https://api.github.com/repos/BurntSushi/ripgrep/releases/latest | grep "browser_download_url" | tail -n 1 | cut -d : -f 2,3 | tr -d \" | wget -qi -
sudo dpkg -i ripgrep_*.deb
rm ripgrep_*.deb

echo "Installing Silver Searcher..."
sudo apt install -y silversearcher-ag

echo "Installing TfSwitch & Terraform..."
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | sudo bash

echo "Installing ASDF plugins..."

source ~/.zshrc

# Common dependencies
sudo apt install -y build-essential

# Erlang dependencies
sudo apt install -y autoconf automake fop libgl1-mesa-dev libglu1-mesa-dev libncurses-dev libncurses5-dev libpng-dev libssh-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libxml2-utils m4 unixodbc-dev xsltproc

# Python dependencies
sudo apt install -y libbz2-dev libffi-dev liblzma-dev libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libxmlsec1-dev tk-dev xz-utils zlib1g-dev

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add python

asdf install

echo "Installing Yarn..."
npm install --global yarn
