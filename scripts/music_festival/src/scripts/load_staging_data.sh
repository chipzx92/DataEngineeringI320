#!/usr/bin/env bash
psql -U ${USER} -h localhost -d ${USER} -f ../sql/create_festival_tables.sql  
psql -U ${USER} -h localhost -d ${USER} -f ../sql/load_music_festival.sql
psql -U ${USER} -h localhost -d ${USER} -f ../sql/create_analytics_schema.sql  
