#!/bin/bash
# Copyright (c) Microsoft Corporation. All Rights Reserved.
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

set -xe

if type code >/dev/null 2>&1; then

    pushd '/edx/var/edxapp'
    directory_path="$HOME/.admincode"
    sudo code . --user-data-dir="$directory_path/edx_var_edxapp/"
    PS1='\u:\W\$ '
    popd

    pushd '/edx/app/edxapp'
    directory_path="$HOME/.admincode"
    sudo code . --user-data-dir="$directory_path/edx_app_edxapp/"
    PS1='\u:\W\$ '
    popd

    # Caller is responsible for popd.
    # There are cases when it's useful to stay in this directory.

else
    echo "please install vs code"
fi
