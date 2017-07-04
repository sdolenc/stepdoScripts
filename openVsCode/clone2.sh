#!/bin/bash
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

# Clones and opens a list of git repositories.
# Usage:
# bash <fullPath>/clone2.sh remoteUrl1 remoteUrl2 <...> remoteUrlN

for var in "$@" ; do
    git clone "$var"
    code `basename "$var" .git`
done
