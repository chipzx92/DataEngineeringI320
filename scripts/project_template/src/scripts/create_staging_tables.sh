#!/usr/bin/env bash

# Run this script to create the staging tables that you defined in the staging_tables.sql file.
# Do not modify this file - this is part of your project framework

. ${HOME}/venv/bin/activate
psql -U ${PROJECT}_read_write -h localhost -d ${PROJECT} -f ./staging_tables.sql


