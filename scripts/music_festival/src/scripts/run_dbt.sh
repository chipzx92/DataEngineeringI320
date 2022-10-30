#!/usr/bin/env bash

. ${HOME}/venv/bin/activate
DBT_HOME=${HOME}/notebooks/i320d/projects/music_festival/src/dbt

# run the dbt engine on the model scripts in the festival project
dbt run --project-dir ${DBT_HOME}/festival --profiles-dir ${DBT_HOME}/festival --target dev

# give the read-only user SELECT permission on the tables in the analytics schema
psql -U festival_read_write -h localhost -d music_festival -c "GRANT SELECT ON ALL TABLES IN SCHEMA analytics TO festival_read_only"
