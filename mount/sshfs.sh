#!/bin/bash
# Copyright (c) Microsoft Corporation. All Rights Reserved.
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

set -xe

# Configuration. #todo: parameterize this.
username=lexoxaadmin
prefix=lexoxabvt
shortname=c12jb
suffix=southcentralus.cloudapp.azure.com
directories=(tmp home oxa)

make_dir()
{
    if [[ ! -d "$1" ]]; then
        mkdir -p "$1"
    fi
}

for dir in "${directories[@]}"; do
    localDir="${HOME}/Desktop/${shortname}_${dir}/"
    make_dir "$localDir"

    sudo apt-get install sshfs
    sshfs "${username}@${prefix}${shortname}.${suffix}:/${dir}" "$localDir"
done

dir="shared"
localDir="${HOME}/Desktop/${dir}"
make_dir "$localDir"
sudo mount -t vboxsf "${dir}" "$localDir"
