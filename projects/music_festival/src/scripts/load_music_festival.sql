TRUNCATE TABLE festival.bands;
TRUNCATE TABLE festival.venues;
TRUNCATE TABLE festival.performances;
TRUNCATE TABLE festival.people;
TRUNCATE TABLE festival.tickets;
TRUNCATE TABLE festival.purchases;

\copy festival.bands FROM '../../data/bands.csv' WITH HEADER CSV;

\copy festival.venues FROM '../../data/venues.csv' WITH HEADER CSV;

\copy festival.performances FROM '../../data/performances.csv' WITH HEADER CSV;

\copy festival.people FROM '../../data/people.csv' WITH HEADER CSV;

\copy festival.tickets FROM '../../data/tickets.csv' WITH HEADER CSV;

\copy festival.purchases FROM '../../data/purchases.csv' WITH HEADER CSV;
