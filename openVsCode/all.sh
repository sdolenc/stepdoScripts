#!/bin/bash
# Copyright (c) Microsoft Corporation. All Rights Reserved.
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

set -xe

CURRENT_SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
directory_path="$HOME/.admincode"

# Useful set of ignores if you want to create a local git repo to track changes
# It's Completely benign if you don't intend this.
git_ignore()
{
    sudo bash -c "cat <<EOF >.gitignore
edxapp/venvs/edxapp/src/*
.rbenv
forum/.gem/*
*.pyc
.cache
.npm
EOF"
}

#todo: continue splitting into individual files (like w/ ams.sh)
if type code >/dev/null 2>&1; then

    pushd /edx/app
    git_ignore
    sudo code . --user-data-dir="$directory_path/edx_app/"
    popd

    pushd /edx/app/edx_ansible/edx_ansible
    sudo code . --user-data-dir="$directory_path/edx_ans_conf/"
    popd

    source $CURRENT_SCRIPT_PATH/platform.sh
    popd

    pushd /edx/etc
    sudo code . --user-data-dir="$directory_path/edx_etc/"
    popd

    source $CURRENT_SCRIPT_PATH/edxapp.sh
    popd

    source $CURRENT_SCRIPT_PATH/ams.sh
    popd

    # has balancing popd(s) included.
    source $CURRENT_SCRIPT_PATH/oxa.sh

    #todo: future consideration: machine_etc.sh
else
    echo "please install vs code"
fi