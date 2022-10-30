-- staging_tables.sql

-- Your CREATE TABLE statements go here - these are the tables that the CSV file data will
-- get loaded into. You must create a table for each CSV file.

-- Make this file idempotent by having a DROP TABLE IF EXISTS command for every table.

-- Make sure you preface every table name with the staging schema, e.g., "staging.table_name"

-- First, have all the DROP TABLE IF EXISTS commands
DROP TABLE IF EXISTS staging.<your table_name here>;

-- Then have all of the CREATE TABLE IF NOT EXISTS commands
CREATE TABLE IF NOT EXISTS staging.<your table_name here>
(
    <your columns here>
);
