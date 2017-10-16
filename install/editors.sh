#!/bin/bash

set -xe

sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make
sudo apt-get update
sudo apt-get install -y ubuntu-make

pushd /tmp

umake ide pycharm
umake ide atom
umake ide visual-studio-code

popd
