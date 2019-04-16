#!/bin/bash

echo "Cloning Aseprite from repo."

git clone --recursive https://github.com/aseprite/aseprite.git

echo "Successfully cloned Aseprite"

echo "Downloading dependencies"
sudo apt-get install -y g++ cmake ninja-build libx11-dev libxcursor-dev libgl1-mesa-dev libfontconfig1-dev

echo "Installing Skia"

mkdir $HOME/deps
cd $HOME/deps
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
git clone -b aseprite-m71 https://github.com/aseprite/skia.git
export PATH="${PWD}/depot_tools:${PATH}"
cd skia

echo "Compiling Skia"
python2 tools/git-sync-deps
gn gen out/Release --args="is_debug=false is_official_build=true skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false"
ninja -C out/Release skia

echo "Compiled Skia, Aseprite will begin to compile"
cd aseprite
mkdir build
cd build
cmake \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DLAF_OS_BACKEND=skia \
  -DSKIA_DIR=$HOME/deps/skia \
  -DSKIA_OUT_DIR=$HOME/deps/skia/out/Release \
  -G Ninja \
  ..
ninja aseprite

echo "Installation of Aseprite is complete."