#!/bin/bash

echo -e "Cloning Mgba from repo.\n"
git clone --recursive https://github.com/mgba-emu/mgba.git

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
make
sudo make install

echo -e "\nBuild successfull."
