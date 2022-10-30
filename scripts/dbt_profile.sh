#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Usage: `basename $0` EID"
    exit 1
fi

eid=$1
home_dir=/home/${eid}
dbt_dir=${home_dir}/.dbt
if [ ! -f ${dbt_dir} ]; then
    mkdir ${dbt_dir}
    chmod 755 ${dbt_dir}
    chown ${eid}:students ${dbt_dir}
fi

eid_file=${dbt_dir}/profiles.yml
if [ ! -f ${eid_file} ]; then
    touch ${eid_file}
fi

chmod 664 ${eid_file}
cat << EOF >> ${eid_file}
festival:
  outputs:
    dev:
      type: "postgres"
      host: "localhost"
      user: "festival_read_write"
      password: "jocund-SCUM-moisten-haggle"
      dbname: "music_festival"
      port: 5432
      schema: "analytics"
  target: dev
EOF
chmod 444 ${eid_file}
chown ${eid}:students ${eid_file}
