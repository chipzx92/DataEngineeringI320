# DataEngineeringI320
Public Repository for I320 Data Engineering Class

## Install dbt for Postgres
### Create a python virtual environment
```
python -m venv venv
. ./venv/bin/activate
```
### Install DBT and any other python packages
```
python -m pip install -r python/requirements.txt
```
### Edit the dbt/festival/festival.yml
Set your database connection information
```
festival: 
  outputs: 
    dev: 
      type: "postgres"
      host: "<your database host>"
      user: "festival_read_write"
      password: "writer"
      dbname: "music_festival"
      port: 5432
      schema: "analytics"
  target: dev
```

## Install pgadmin
Go to pgadmin home - https://www.pgadmin.org/download/pgadmin-4-macos/
Click on Download
Download version for your operating system (mac, windows, etc.)
Follow installation instructions