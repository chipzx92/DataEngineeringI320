#!/usr/bin/env bash

declare -a groups=("imdb" "aac" "covid" "faang" "dancing" "songs")
for group in "${groups[@]}"
do
    echo Creating $group
#    sudo groupadd $group
    sudo usermod -a -G $group ubuntu
done
