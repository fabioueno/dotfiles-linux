# Dotfiles [Ubuntu]

This repository contains personal dotfiles and scripts for bootstraping a new Ubuntu
machine.

I wasn't able to automate everything, so there are two steps in this process:

1. Set up `zsh` and `oh-my-zsh` and some config/dotfiles: [`setup.sh`](../setup.sh)
2. Install everything else: [`install.sh`](../install.sh)

After executing the setup shell script, you need to change to `zsh`, so run `env zsh`
before running the installation script. This is required because `TfSwitch` installer
crashes when using `bash`. And I didn't manage to source `zsh` without stopping the
script.
