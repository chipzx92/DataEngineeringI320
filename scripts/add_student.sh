#!/usr/bin/env bash

if [ $# -ne 5 ]; then
    echo "Usage: `basename $0` EID role email first-name last-name"
    exit 1
fi

if [ $1 == 'root' ] || [ $1 == 'ubuntu' ]; then
    echo "Unauthorized user name"
    exit 1
fi 

EID=$1
ROLE=$2
EMAIL=$3
FIRST=$4
LAST=$5

# remove user if already exists
sudo deluser ${EID}
sudo rm -rf /home/${EID}
sudo rm -rf /de_i320/data/${EID}

PASSWD=`openssl rand -hex 5` 

echo "Setting up account for student ${EID}"
sudo useradd -b /home -g students --create-home --password ${EID}${PASSWD}  --shell /usr/bin/bash ${EID}
echo "Created account for ${EID}"

sudo mkdir /de_i320/data/${EID}
sudo chown ${EID}:students /de_i320/data/${EID}
sudo -u ${EID} ln -s /de_i320/data/${EID} /home/${EID}/data

echo "Created linked data directory for ${EID}"
echo "Student account created for ${EID}"

echo ${EID} ${EID}${PASSWD} >> logins

echo "Set up python virtual environment for student"
sudo su - ${EID} -c "python -m venv venv "
sudo su - ${EID} -c 'echo -e "\n# Activate python virtual environment\n. $HOME/venv/bin/activate" >> $HOME/.profile'

echo "Create postgres user and schema for student"
echo "REVOKE ALL PRIVILEGES ON DATABASE dei320 FROM ${EID};" > ${EID}.sql
echo "DROP SCHEMA IF EXISTS ${EID} CASCADE;" >> ${EID}.sql
echo "DROP USER IF EXISTS ${EID};" >> ${EID}.sql
echo "CREATE USER ${EID} WITH LOGIN encrypted password '${EID}${PASSWD}';" >> ${EID}.sql
echo "GRANT CONNECT ON DATABASE dei320 TO ${EID};" >> ${EID}.sql
echo "CREATE SCHEMA AUTHORIZATION ${EID};" >> ${EID}.sql

psql -U postgres -h localhost -d dei320 -f ${EID}.sql

sudo su - ${EID} -c 'echo -e "\n# Default postgres schema to user schema\n" >> $HOME/.profile'
sudo su - ${EID} -c 'echo export PG_OPTIONS=\"SET SEARCH_PATH=${EID},public\" >> $HOME/.profile'

echo "Created user and schema in postgres database"

echo "Creating user in Superset"

pushd  /usr/local/superset
. ./venv/bin/activate
export FLASK_APP=superset
flask fab create-user --role ${ROLE} --username ${EID} --firstname ${FIRST} --lastname ${LAST} --email ${EMAIL} --password ${EID}${PASSWD}

deactivate
popd

echo ${EID} ${EID}${PASSWD} >> superset_users

echo "Created superset user"

echo "Creating music_festival example project"
sudo mkdir /home/${EID}/data/projects
sudo cp -R ./music_festival /home/${EID}/data/projects
sudo chown -R ${EID}:students /home/youngcc4/data/projects
echo "Created example project"

