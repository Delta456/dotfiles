#!/bin/bash

echo -e "Installing Hyperfine"
wget https://github.com/sharkdp/hyperfine/releases/download/v1.17.0/hyperfine_1.17.0_amd64.deb
sudo dpkg -i hyperfine_1.17.0_amd64.deb
echo -e "\nInstallation Done"

echo -e "\nInstalling bat"
wget https://github.com/sharkdp/bat/releases/download/v0.23.0/bat_0.23.0_amd64.deb
sudo dpkg -i bat_0.23.0_amd64.deb
echo -e "\nInstallation Done"

echo -e "\nInstalling pastel"
wget "https://github.com/sharkdp/pastel/releases/download/v0.9.0/pastel_0.9.0_amd64.deb"
sudo dpkg -i pastel_0.9.0_amd64.deb
echo -e "\nInstallation Done"
