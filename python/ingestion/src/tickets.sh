#!/usr/bin/env bash

psql -U ${DB_USER} -h localhost -d music_festival -f ./tickets.sql