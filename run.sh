#!/bin/bash
# run jupyter lab in $1 folder, if given
# - listening on all network interfaces
# - ready to generate TOC
source ./initenv.sh
if [ -n "$1" ]; then
pushd $1
fi
jupyter lab --ip=0.0.0.0 --no-browser
deactivate