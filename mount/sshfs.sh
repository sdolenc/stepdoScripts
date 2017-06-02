#!/bin/bash
# Copyright (c) Microsoft Corporation. All Rights Reserved.
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

set -x

# Configuration. #todo: parameterize this.
username=lexoxaadmin
prefix=lexoxabvt
shortname=c12jb
suffix=southcentralus.cloudapp.azure.com
directories=(tmp home oxa)

for dir in "${directories[@]}"; do
    localDir="${HOME}/Desktop/${shortname}_${dir}/"
    mkdir -p "$localDir"

    sudo apt-get install sshfs
    sshfs "${username}@${prefix}${shortname}.${suffix}:/${dir}" "$localDir"
done
