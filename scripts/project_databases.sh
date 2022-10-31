#!/usr/bin/env bash

declare -a projects=("imdb" "aac" "covid" "olympics" "dwts" "songs")
for project in "${projects[@]}"
do
    psql -U postgres -h localhost -d postgres -c "DROP DATABASE IF EXISTS ${project}"
    psql -U postgres -h localhost -d postgres -c "DROP ROLE ${project}_read_write"
    psql -U postgres -h localhost -d postgres -c "CREATE DATABASE ${project}"
    psql -U postgres -h localhost -d postgres -c "CREATE ROLE ${project}_read_write LOGIN ENCRYPTED PASSWORD '${project}_read_write'"
    psql -U postgres -h localhost -d postgres -c "ALTER ROLE ${project}_read_write SET SEARCH_PATH=staging,analytics"
    psql -U postgres -h localhost -d ${project} -c "CREATE SCHEMA staging AUTHORIZATION ${project}_read_write"
    psql -U postgres -h localhost -d ${project} -c "CREATE SCHEMA analytics AUTHORIZATION ${project}_read_write"
done
