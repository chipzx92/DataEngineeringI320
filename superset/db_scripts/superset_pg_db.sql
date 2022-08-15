CREATE ROLE superset_admin_role
    WITH createdb createrole nologin encrypted password 'ALPHA-atlantes-snaky-pit';

CREATE USER superset_admin
    WITH login encrypted password 'desktop-courier-DEVIANCY-savanna' ROLE superset_admin_role;

CREATE DATABASE superset
    WITH OWNER superset_admin;

GRANT ALL PRIVILEGES ON DATABASE superset TO superset_admin_role WITH GRANT OPTION;