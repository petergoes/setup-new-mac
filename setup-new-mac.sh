#!/bin/sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/petergoes/dotfiles/main/install-tools.sh)"

gh config set git_protocol ssh
gh config set browser open
gh auth login

cd ~
git clone https://github.com/petergoes/dotfiles.git
cd dotfiles


mv ~/.zshrc ~/.zshrc.bak

ln -s ./dotfiles/.zshrc ~/.zshrc
ln -s ./dotfiles/.vimrc ~/.vimrc
ln -s ./dotfiles/git/.gitconfig ~/.gitconfig
ln -s ./dotfiles/git/.git-custom-commands ~/.git-custom-commands
ln -s ./dotfiles/starship ~/.config

fnm install --lts

cd dotfiles/.fig
npm install
npm run build && npm run copy-to-global