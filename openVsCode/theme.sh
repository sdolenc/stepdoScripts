#!/bin/bash
# Copyright (c) Microsoft Corporation. All Rights Reserved.
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

set -xe

#todo: consider adding theme installation if missing (similar to ams.sh)

if type code >/dev/null 2>&1; then

    pushd '/edx/app/edxapp/themes'
    directory_path="$HOME/.admincode"
    sudo code . --user-data-dir="$directory_path/theme/"
    PS1='\u:\W\$ '

    # Caller is responsible for popd.
    # There are cases when it's useful to stay in this directory.

else
    echo "please install vs code"
fi
