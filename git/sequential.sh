#!/bin/bash

echo
ls -R -d */.git/.. | xargs -I{} sh -c "echo {} && git -C {} $@ && echo -e '---\n'"
