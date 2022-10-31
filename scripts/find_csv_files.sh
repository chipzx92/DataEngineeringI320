#!/usr/bin/env bash
find . -name '*.csv' -print -exec head -n 1 {} \;
