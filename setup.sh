#!/usr/bin/env bash

set -e

echo "Setting up..."

echo "Updating software..."
sudo apt update -y && sudo apt upgrade -y
sudo apt autoclean -y && sudo apt autoremove -y

echo "Checking/creating Projects folder..."
if [[ ! -d "$HOME/Projects" ]]; then
  mkdir $HOME/Projects
  mv $HOME/dotfiles-ubuntu $HOME/Projects/dotfiles-ubuntu
fi

echo "Installing Zsh, Oh-My-Zsh, Autosuggestions, Forgit, Spaceship theme..."
sudo apt install -y zsh

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  sudo git clone https://github.com/wfxr/forgit.git "$ZSH_CUSTOM/plugins/forgit"
  sudo git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  sudo git clone https://github.com/spaceship-prompt/spaceship-prompt "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
  sudo ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
  sudo chsh -s $(which zsh) $(whoami)
fi

echo "Removing directories and files..."
if [[ -f $HOME/.bashrc ]]; then rm $HOME/.bashrc; fi
if [[ -f $HOME/.gitconfig ]]; then rm $HOME/.gitconfig; fi
if [[ -f $HOME/.tool-versions ]]; then rm $HOME/.tool-versions; fi
if [[ -f $HOME/.zprofile ]]; then rm $HOME/.zprofile; fi
if [[ -f $HOME/.zshrc ]]; then rm $HOME/.zshrc; fi

echo "Creating symlinks..."
if [[ ! -d $HOME/.dotfiles ]]; then ln -s $HOME/Projects/dotfiles-ubuntu $HOME/.dotfiles; fi
if [[ ! -e $HOME/.gitconfig ]]; then ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig; fi
if [[ ! -e $HOME/.tool-versions ]]; then ln -s $HOME/.dotfiles/asdf/tool-versions $HOME/.tool-versions; fi
if [[ ! -e $HOME/.tfswitchrc ]]; then ln -s $HOME/.dotfiles/terraform/tfswitchrc $HOME/.tfswitchrc; fi
if [[ ! -e $HOME/.zshrc ]]; then ln -s $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc; fi
