#!/bin/bash
# Copyright (c) Microsoft Corporation. All Rights Reserved.
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

set -x

dir=$1
if [[ -n $dir ]]; then
    localDir="${HOME}/Desktop/${dir}"
    mkdir -p "$localDir"
    sudo mount -t vboxsf "${dir}" "$localDir"
else
    echo "Argument required"
fi
