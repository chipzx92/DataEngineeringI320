-- staging_tables.sql

-- Your CREATE TABLE statements go here - these are the tables that the CSV file data will
-- get loaded into. You must create a table for each CSV file.

-- Make this file idempotent by having a DROP TABLE IF EXISTS command for every table.

-- First, have all the DROP TABLE IF EXISTS commands
DROP TABLE IF EXISTS <your table_name here>;

-- Then have all of the CREATE TABLE IF NOT EXISTS commands
CREATE TABLE IF NOT EXISTS <your table_name here>
(
    <your columns here>
);