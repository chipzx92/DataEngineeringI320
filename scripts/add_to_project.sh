#!/usr/bin/env bash

if [ $# -ne 2 ]; then
    echo "Usage: `basename $0` eid project"
    exit 1
fi
eid=$1
project=$2

sudo ln -s /de_i320/data/projects/${project} /home/${eid}/notebooks/i320d/projects/
