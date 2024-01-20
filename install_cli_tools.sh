#!/bin/bash

set -e

function cleanup {
  rm -f hyperfine_*.deb
  rm -f bat_*.deb
  rm -f pastel_*.deb
  rm -f atuin_*.deb
}

trap cleanup EXIT

function get_latest_release_url {
  local repo=$1
  local asset_name=$2
  local url="https://api.github.com/repos/$repo/releases/latest"
  local download_url=$(curl -s "$url" | jq -r ".assets[] | select(.name | contains(\"$asset_name\")) | .browser_download_url" | head -n 1)
  echo "$download_url"
}

echo "Select the packages to install:"
echo "1. Hyperfine"
echo "2. bat"
echo "3. pastel"
echo "4. atuin"

read -p "Enter the package numbers (comma-separated): " choices

IFS=',' read -ra selected_packages <<< "$choices"

for package in "${selected_packages[@]}"; do
  case $package in
    1)
      echo "Installing Hyperfine"
      hyperfine_url=$(get_latest_release_url "sharkdp/hyperfine" "amd64.deb")
      wget -O hyperfine.deb "$hyperfine_url"
      sudo dpkg -i hyperfine.deb
      echo "Installation Done"
      ;;
    2)
      echo "Installing bat"
      bat_url=$(get_latest_release_url "sharkdp/bat" "amd64.deb")
      wget -O bat.deb "$bat_url"
      sudo dpkg -i bat.deb
      echo "Installation Done"
      ;;
    3)
      echo "Installing pastel"
      pastel_url=$(get_latest_release_url "sharkdp/pastel" "amd64.deb")
      wget -O pastel.deb "$pastel_url"
      sudo dpkg -i pastel.deb
      echo "Installation Done"
      ;;
    4)
      echo "Installing atuin"
      atuin_url=$(get_latest_release_url "atuinsh/atuin" "amd64.deb")
      wget -O atuin.deb "$atuin_url"
      sudo dpkg -i atuin.deb
      echo "Installation Done"
      ;;
    *)
      echo "Invalid package number: $package"
      ;;
  esac
done
