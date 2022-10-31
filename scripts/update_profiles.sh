#!/usr/bin/env bash

if [ $# -ne 2 ]; then
    echo "Usage: `basename $0` EID project"
    exit 1
fi

EID=$1
PROJECT=$2

echo EID is ${EID}
echo PROJECT is ${PROJECT}

# Add to project group
usermod -g ${PROJECT} ${EID}
usermod -a -G students ${EID}

# Add PROJECT env var to .profile

HOME_DIR=/home/${EID}
echo -e "export PROJECT=${PROJECT}" >> ${HOME_DIR}/.profile
echo -e "umask 0002" >> ${HOME_DIR}/.profile

# Update dbt profiles.yml

DBT_DIR=${HOME_DIR}/.dbt
EID_FILE=${DBT_DIR}/profiles.yml

chmod 664 ${EID_FILE}
cat << EOF >> ${EID_FILE}
${PROJECT}:
  outputs:
    dev:
      type: "postgres"
      host: "localhost"
      user: "${PROJECT}_read_write"
      password: "${PROJECT}_read_write"
      dbname: "${PROJECT}"
      port: 5432
      schema: "analytics"
  target: dev
EOF
chmod 444 ${EID_FILE}
chown ${EID}:${PROJECT} ${EID_FILE}

# Update pgpass file
sudo chmod 666 ${HOME_DIR}/.pgpass
echo "localhost:5432:${PROJECT}:${PROJECT}_read_write:${PROJECT}_read_write" >> /home/${EID}/.pgpass
sudo chmod 400 ${HOME_DIR}/.pgpass
sudo chown ${EID}:${PROJECT} ${HOME_DIR}/.pgpass

