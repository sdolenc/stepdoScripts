#!/bin/bash
# Copyright (c) Microsoft Corporation. All Rights Reserved.
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

set -xe

user=edxapp

if [ `whoami` == $user ]; then
    source /edx/app/$user/${user}_env 

    /edx/bin/pip.$user install -e git+https://github.com/Microsoft/xblock-azure-media-services#egg=azure-media-services
else
    echo must run as $user
fi
