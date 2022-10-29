#!/usr/bin/env bash

declare -a projects=("imdb" "aac" "covid" "faang" "dancing" "songs")
for project in "${projects[@]}"
do
    psql -U postgres -h localhost -d postgres -c "CREATE DATABASE ${project}"
    psql -U postgres -h localhost -d postgres -c "CREATE ROLE ${project}_read_write LOGIN ENCRYPTED PASSWORD '${project}_read_write'"
    psql -U postgres -h localhost -d ${project} -c "CREATE SCHEMA AUTHORIZATION ${project}_read_write"
done
