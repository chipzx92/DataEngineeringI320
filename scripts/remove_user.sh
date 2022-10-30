#!/usr/bin/env bash
if [ $# -ne 1 ]; then
    echo Usage: `basename $0` username
    exit 1
fi
psql -U superset_admin -h localhost -d superset -f delete_superset_user.sql -v user="'$1'"
psql -U postgres -h localhost -d dei320 -f remove_db_user.sql -v user=$1
sudo rm -rf /de_i320/data/$1
sudo userdel $1
sudo rm -rf /home/$1
