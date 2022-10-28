-- For each table that you create, there should be a TRUNCATE TABLE command and a \copy command
-- Replace <your_table> with the name of the table you are creating from the CSV file
-- Replace <your CSV file> with the name of the CSV file
-- For example, if you have a csv file called 'tickets.csv', your commands would be
-- TRUNCATE TABLE tickets;
-- \copy tickets FROM '../../data/tickets.csv' WITH HEADER CSV;
-- repeat this for each csv file/table in your project

TRUNCATE TABLE <your_table>;

\copy <your_table>  FROM '../../data/<your CSV file>' WITH HEADER CSV;

