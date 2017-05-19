#!/bin/bash
# Copyright (c) Microsoft Corporation. All Rights Reserved.
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

set -xe

sudo -u edxapp bash ams-xblock_impl.sh

sudo /edx/bin/supervisorctl restart edxapp:
