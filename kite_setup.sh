#!/bin/bash

# Get kite plugin for vim
mkdir -p ~/.vim/pack/kite/start/kite
git clone https://github.com/kiteco/vim-plugin.git ~/.vim/pack/kite/start/kite/

# instll kite server in the system
mkdir kite_installation
cd kite_installation
wget -O kite-installer-dropbox https://www.dropbox.com/s/lcdheyto0hqln77/kite-installer.sh?dl=0
bash kite-installer-dropbox --download
bash kite-installer-dropbox --install
cd ..
rm -r kite_installation
