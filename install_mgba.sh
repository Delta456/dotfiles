#!/bin/bash

echo "Cloning Mgba from repo."
git clone --recursive https://github.com/mgba-emu/mgba.git

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
make
sudo make install

echo "Build successfull."