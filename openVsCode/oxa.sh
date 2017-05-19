#!/bin/bash
# Copyright (c) Microsoft Corporation. All Rights Reserved.
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

set -x

if type code >/dev/null 2>&1; then

    tools="/oxa/oxa-tools"
    if [ -d $tools ]; then
        pushd $tools
        directory_path="$HOME/.admincode"
        sudo code . --user-data-dir="$directory_path/oxa_tools/"
        popd
    fi

    conf="/oxa/oxa-tools-config"
    if [ -d $conf ]; then
        pushd $conf
        directory_path="$HOME/.admincode"
        sudo code . --user-data-dir="$directory_path/oxa_tools/"
        popd
    fi

else
    echo "please install vs code"
fi
