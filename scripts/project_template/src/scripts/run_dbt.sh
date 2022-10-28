#!/usr/bin/env bash

. ${HOME}/venv/bin/activate
DBT_HOME=${HOME}/notebooks/i320d/projects/${PROJECT}/src/dbt

# run the dbt engine on the model scripts in your project
# Do not modify this file - this is part of your project framework
dbt run --project-dir ${DBT_HOME}/${PROJECT}  --profiles-dir ${DBT_HOME}/${PROJECT} --target dev
