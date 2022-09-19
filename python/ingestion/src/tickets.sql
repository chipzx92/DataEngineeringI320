TRUNCATE TABLE festival.tickets;
\timing on
\copy festival.tickets FROM ../data/tickets.csv WITH CSV HEADER;
