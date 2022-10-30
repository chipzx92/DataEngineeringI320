#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Usage: `basename $0` EID"
    exit 1
fi
EID=$1
sudo cp ./music_festival/src/dbt/festival/models/star_schema/*.sql /home/${EID}/notebooks/i320d/projects/music_festival/src/dbt/festival/models/star_schema
sudo cp ./music_festival/src/dbt/festival/models/data_products/*.sql /home/${EID}/notebooks/i320d/projects/music_festival/src/dbt/festival/models/data_products
