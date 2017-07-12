#!/bin/bash
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

# Clones and opens a list of git repositories.
# Usage examples:
# bash <fullPath>/clone2.sh remoteUrl1 remoteUrl2 <...> remoteUrlN
# bash <fullPath>/clone2.sh localDestinationDirectory remoteUrl1 <...> remoteUrlN
# bash clone2.sh /var/tmp                                  \
# https://github.com/edx-solutions/xblock-drag-and-drop-v2 \
# https://github.com/open-craft/xblock-vectordraw          \
# https://github.com/open-craft/problem-builder            \
# https://github.com/edx-solutions/xblock-mentoring        \
# https://github.com/open-craft/xblock-leaderboard         \
# https://github.com/edx-solutions/xblock-google-drive     \
# https://github.com/open-craft/xblock-group-project-v2    \
# https://github.com/Microsoft/xblock-azure-media-services

for var in "$@" ; do
    # Update working directory to new location
    if [[ -d "$var" ]] ; then
        cd "$var"
        continue
    fi

    # Clone repo
    git clone "$var"

    # Open new repo with vs code
    code `basename "$var" .git`
done