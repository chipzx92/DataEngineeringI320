#!/usr/bin/env bash

SQL_DIR=${HOME}/i320d/projects/music_festival/src/sql
#SQL_DIR=${HOME}/iSchool/projects/DataEngineeringI320/projects/music_festival/src/sql
. ${HOME}/venv/bin/activate
psql -U festival_read_write -h localhost -d music_festival -f ${SQL_DIR}/load_music_festival.sql


