#!/usr/bin/env bash

. ${HOME}/venv/bin/activate
DBT_HOME=${HOME}/notebooks/i320d/projects/${PROJECT}/src/dbt

# run the dbt engine on the model scripts in your project
# Do not modify this file - this is part of your project framework
rm -rf ${DBT_HOME}/${PROJECT}/models/star_schema/.ipynb_checkpoints
rm -rf ${DBT_HOME}/${PROJECT}/models/data_products/.ipynb_checkpoints
dbt run --project-dir ${DBT_HOME}/${PROJECT} --target dev
