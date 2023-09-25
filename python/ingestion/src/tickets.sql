\timing on
TRUNCATE TABLE festival.tickets;
\copy festival.tickets FROM ../data/tickets.csv WITH CSV HEADER;
