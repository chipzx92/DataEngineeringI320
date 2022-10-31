#!/usr/bin/env bash
find ../../data -name '*.csv' -print -exec head -n 2 {} \;
