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

PASSWD=`openssl rand -hex 2` 

echo "Setting up account for student ${EID}"
PASSWORD=${EID}${PASSWD}
sudo useradd -b /home -g students --create-home --password ${PASSWORD}  --shell /usr/bin/bash ${EID}
# do this because password doesn't seem to take in useradd
echo "${EID}:${PASSWORD}" | sudo chpasswd 
echo "Created account for ${EID} ${PASSWORD}"

sudo mkdir /de_i320/data/${EID}
sudo chown ${EID}:students /de_i320/data/${EID}
sudo mkdir /home/${EID}/notebooks
sudo chown ${EID}:students /home/${EID}/notebooks
sudo -u ${EID} ln -s /de_i320/data/${EID} /home/${EID}/notebooks/i320d

echo "Created linked project directory for ${EID}"
echo "Student account created for ${EID}"

echo ${EID} ${EID}${PASSWD} >> logins

echo "Create postgres user and schema for student"
echo "REVOKE ALL PRIVILEGES ON DATABASE dei320 FROM ${EID};" > ${EID}.sql
echo "DROP SCHEMA IF EXISTS ${EID} CASCADE;" >> ${EID}.sql
echo "DROP SCHEMA IF EXISTS staging CASCADE;" >> ${EID}.sql
echo "DROP SCHEMA IF EXISTS analytics CASCADE;" >> ${EID}.sql
echo "DROP USER IF EXISTS ${EID};" >> ${EID}.sql
echo "CREATE USER ${EID} WITH LOGIN encrypted password '${EID}${PASSWD}';" >> ${EID}.sql
echo "DROP DATABASE ${EID};" >> ${EID}.sql
echo "CREATE DATABASE ${EID} WITH OWNER ${EID};" >> ${EID}.sql
echo "GRANT CONNECT ON DATABASE ${EID} TO ${EID};" >> ${EID}.sql
psql -U postgres -h localhost -d dei320 -f ${EID}.sql
echo "DROP SCHEMA IF EXISTS ${EID} CASCADE;" >> ${EID}.sql
echo "DROP SCHEMA IF EXISTS staging CASCADE;" >> ${EID}.sql
echo "DROP SCHEMA IF EXISTS analytics CASCADE;" >> ${EID}.sql
echo "CREATE SCHEMA AUTHORIZATION ${EID};" >> ${EID}_2.sql
echo "CREATE SCHEMA staging AUTHORIZATION ${EID};" >> ${EID}_2.sql
echo "CREATE SCHEMA analytics AUTHORIZATION ${EID};" >> ${EID}_2.sql
echo "GRANT ALL PRIVILEGES ON SCHEMA ${EID} TO ${EID};" >> ${EID}_2.sql
echo "GRANT ALL PRIVILEGES ON SCHEMA staging TO ${EID};" >> ${EID}_2.sql
echo "GRANT ALL PRIVILEGES ON SCHEMA analytics TO ${EID};" >> ${EID}_2.sql
echo "ALTER ROLE ${EID} SET SEARCH_PATH=${EID},analytics,staging,festival,public;" >> ${EID}_2.sql
psql -U postgres -h localhost -d ${EID} -f ${EID}_2.sql

echo "Created database, user and schema in postgres database"

echo "setting up db access"
sudo cp ./.pgpass /home/${EID}
sudo chmod 666 /home/${EID}/.pgpass
echo "localhost:5432:${EID}:${EID}:${EID}${PASSWD}" >> /home/${EID}/.pgpass
sudo chmod 400 /home/${EID}/.pgpass
sudo chown ${EID}:students /home/${EID}/.pgpass

echo "Set up python virtual environment for student"
sudo su - ${EID} -c "cd ${HOME}"
sudo su - ${EID} -c "python -m venv venv "
sudo su - ${EID} -c 'echo -e "\n# Activate python virtual environment\n. $HOME/venv/bin/activate" >> $HOME/.profile'

echo "Installing dbt"
sudo su - ${EID} -c '. $HOME/venv/bin/activate'
sudo su - ${EID} -c 'python3 -m pip install wheel dbt-postgres'

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
sudo mkdir /home/${EID}/notebooks/i320d/projects
sudo cp -R ./music_festival /home/${EID}/notebooks/i320d/projects
sudo cp -R ./exercises /home/${EID}/notebooks/i320d/projects
sudo chown -R ${EID}:students /home/${EID}/notebooks/i320d/projects
echo "Created example project"

# set login directory to projects directory
sudo su - ${EID} -c 'echo -e "\ncd ${HOME}/notebooks/i320d/projects\n" >> $HOME/.profile'

