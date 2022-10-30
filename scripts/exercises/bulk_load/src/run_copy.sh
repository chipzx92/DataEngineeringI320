#!/usr/bin/env bash

psql -U ${USER} -h localhost -d ${USER} -f load.sql
