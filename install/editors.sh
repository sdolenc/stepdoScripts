#!/bin/bash

set -xe

# packages
sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make
sudo apt-get update
sudo apt-get install -y ubuntu-make

pushd /tmp
set -x

destination_prefix=$HOME/.local/share/umake/ide

# install editors
umake ide pycharm ${destination_prefix}/pycharm
umake ide atom    ${destination_prefix}/atom
umake ide visual-studio-code --accept-license ${destination_prefix}/code

popd

pushd ${destination_prefix}/../bin

# use better binary names
if ! type charm > /dev/null 2>&1 ; then
    ln -s jetbrains-pycharm-ce charm
fi
if ! type pycharm > /dev/null 2>&1 ; then
    ln -s jetbrains-pycharm-ce pycharm
fi
if ! type code > /dev/null 2>&1 ; then
    ln -s visual-studio-code code
fi

popd

echo "PATH variable will be updated upon reboot"
echo "Allowing 'pycharm, code, and atom' from console terminal"
echo
