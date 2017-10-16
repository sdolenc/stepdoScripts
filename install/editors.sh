#!/bin/bash

set -xe

sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make
sudo apt-get update
sudo apt-get install -y ubuntu-make

pushd /tmp
set -x

destination_prefix=$HOME/.local/share/umake/ide

umake ide pycharm ${destination_prefix}/pycharm
umake ide atom    ${destination_prefix}/atom
umake ide visual-studio-code --accept-license ${destination_prefix}/code

popd
