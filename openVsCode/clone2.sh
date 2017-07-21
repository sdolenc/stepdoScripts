#!/bin/bash
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

# Clones and opens a list of git repositories.
# Usage examples:
#
# bash <fullPath>/clone2.sh remoteUrl1 remoteUrl2 <...> remoteUrlN
#
# bash <fullPath>/clone2.sh localDestinationDirectory remoteUrl1 <...> remoteUrlN
#
# bash clone2.sh /var/tmp                                  \
# https://github.com/edx-solutions/xblock-drag-and-drop-v2 \
# https://github.com/open-craft/xblock-vectordraw          \
# https://github.com/open-craft/problem-builder            \
# https://github.com/edx-solutions/xblock-mentoring        \
# https://github.com/open-craft/xblock-leaderboard         \
# https://github.com/edx-solutions/xblock-google-drive     \
# https://github.com/open-craft/xblock-group-project-v2    \
# https://github.com/Microsoft/xblock-azure-media-services
#
# mkdir -p ~/e/tmp && bash clone2.sh ~/e/tmp \
# https://github.com/Microsoft/edx-configuration.git  \
# https://github.com/microsoft/edx-platform.git       \
# https://github.com/microsoft/edx-theme.git          \
# https://github.com/Microsoft/oxa_kitchen_sink.git   \
# https://github.com/Microsoft/oxa-tools.git          \
#

set -x

for var in "$@" ; do
    # Update working directory to new location
    if [[ -d "$var" ]] ; then
        cd "$var"
        continue
    fi

    # Clone repo
    git clone "$var"

    if [[ $? -eq 0 ]] ; then
        # Open new repo with vs code
        code `basename "$var" .git`
    fi
done
