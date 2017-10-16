#!/bin/bash

set -xe

if [[ $USER == root ]] ; then
    echo "Please re-run as regular user (non-admin)"
    return false
fi

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

# support better binary names
if [[ ! -f pycharm ]] && ! type pycharm > /dev/null 2>&1 ; then
    ln -s jetbrains-pycharm-ce pycharm
fi
if [[ ! -f code ]] && ! type code > /dev/null 2>&1 ; then
    ln -s visual-studio-code code
fi

# allow root to "see" the same binaries in "path"
elevated_prof="/etc/environment"
if ! sudo grep -i -I "umake" $elevated_prof ; then
    # newline
    sudo sed -i "s#=\"#=\"`pwd`:#" $elevated_prof
fi

popd

set +x
echo
echo "PATH variable will be updated upon reboot"
echo "Allowing 'pycharm, code, and atom' from console terminal"
echo
