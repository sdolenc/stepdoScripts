#!/bin/bash

echo
ls -R -d */.git/.. | xargs -P10 -I{} git -C {} $@
