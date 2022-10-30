CREATE DATABASE superset;

CREATE ROLE superset_admin WITH login encrypted password 'superset';

GRANT ALL PRIVILEGES ON DATABASE superset TO superset_admin;
