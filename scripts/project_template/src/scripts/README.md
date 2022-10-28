# Semester Project Scripts

## Overview
This directory contains the scripts you need to run to create the tables in your data pipeline.

There are three scripts:
* `create_staging_tables.sh` - You will run this to create your staging tables
* `load_staging_data.sh` - This will run your \copy commands to load the data from the CSV files into your tables
* `run_dbt.sh` - This will run dbt to create and poulate your dimensional model and data products.

## Creating Staging Tables

You will write CREATE TABLE statements to create your staging tables. These are the tables you will
load your CSV files into. These CREATE TABLE statements will go into the `staging_tables.sql` file.
You can edit this file in your Jupyter notebook. This file is located in the `projects/<your project_name>/src/scripts` directory.

You will create the tables by running the `create_staging_tables.sh` script. To run it, open a 
Jupyter terminal and run the following commands:

`cd projects/<your project name>/src/scripts/`  
`bash create_staging_tables.sh`

## Loading Data Into Staging Tables

You will write `\copy` commands into the `create_load_commands.sql` file. These commands will load
the data in your CSV files into your staging tables. You can also edit this file in your 
Jupyter notebook. This file is located in the `projects/<your project_name>/src/scripts` directory.

You will load the data into the staging tables by running the `load_staging_data.sh` script. To run
it, open a Jupyter terminal and run the following commands:

`cd projects/<your project name>/src/scripts`  
`bash load_staging_data.sh`

## Running DBT Model Files

You will create the dbt model files for your dimensional model in the dbt `models/star_schema`
directory. You can find this directory at `projects/<your project name>/src/dbt/<your project name>/models/star_schema`.
 
Later, you will create the dbt model files for your data products in the dbt `models/data_products`
directory. You can find this directory at `projects/<your project name>/src/dbt/<your project name>/models/star_schema`.

You will execute the dbt model files by running the `run_dbt.sh` script. To run it, open a Jupyter
terminal and run the following commands:

`cd projects/<your project name>/src/scripts`
`bash run_dbt.sh`






