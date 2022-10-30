TRUNCATE TABLE festival.bands;
TRUNCATE TABLE festival.venues;
TRUNCATE TABLE festival.performances;
TRUNCATE TABLE festival.people;
TRUNCATE TABLE festival.tickets;
TRUNCATE TABLE festival.purchases;

\! echo loading data for bands
\copy festival.bands FROM '../../data/bands.csv' WITH HEADER CSV;

\! echo loading data for venues
\copy festival.venues FROM '../../data/venues.csv' WITH HEADER CSV;

\! echo loading data for performances
\copy festival.performances FROM '../../data/performances.csv' WITH HEADER CSV;

\! echo loading data for people
\copy festival.people FROM '../../data/people.csv' WITH HEADER CSV;

\! echo loading data for tickets
\copy festival.tickets FROM '../../data/tickets.csv' WITH HEADER CSV;

\! echo loading data for purchases
\copy festival.purchases FROM '../../data/purchases.csv' WITH HEADER CSV;
