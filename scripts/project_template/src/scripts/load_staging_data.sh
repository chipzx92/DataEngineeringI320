#!/usr/bin/env bash

# Run this script that runs the load_staing to load the staging tables.
# Do not modify this file - this is part of your project framework
. ${HOME}/venv/bin/activate
psql -U ${PROJECT}_read_write -h localhost -d ${PROJECT} -f ./copy_staging_data.sql


