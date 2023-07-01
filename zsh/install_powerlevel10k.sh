#!/bin/bash

echo -e "Installing Fonts"

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

mv "MesloLGS NF Regular.ttf" ~/.local/share/fonts
mv "MesloLGS NF Bold.ttf" ~/.local/share/fonts
mv "MesloLGS NF Italic.ttf" ~/.local/share/fonts
mv "MesloLGS NF Bold Italic.ttf" ~/.local/share/fonts

echo -e "\nInstalling Powerlevel 10K"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

exec zsh
