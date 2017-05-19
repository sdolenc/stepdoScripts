#!/bin/bash
# Copyright (c) Microsoft Corporation. All Rights Reserved.
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

set -xe

if type code >/dev/null 2>&1; then

    xblock_path='/edx/app/edxapp/venvs/edxapp/src/azure-media-services'
    if [ ! -d $xblock_path ]; then
        curr_script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
        pushd $curr_script_path/../install
        sudo bash ams-xblock.sh
        popd
    fi

    pushd $xblock_path
    directory_path="$HOME/.admincode"
    sudo code . --user-data-dir="$directory_path/ams_xblock/"
    PS1='\u:\W\$ '

else
    echo "please install vs code"
fi
