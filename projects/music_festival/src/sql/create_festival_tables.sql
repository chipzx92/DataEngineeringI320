CREATE SCHEMA IF NOT EXISTS festival;

DROP TABLE IF EXISTS festival.bands;
DROP TABLE IF EXISTS festival.venues;
DROP TABLE IF EXISTS festival.performances;
DROP TABLE IF EXISTS festival.tickets;
DROP TABLE IF EXISTS festival.purchases;
DROP TABLE IF EXISTS festival.people;

CREATE TABLE IF NOT EXISTS festival.bands (
    id SERIAL,
    name TEXT,
    fee INTEGER
);

CREATE TABLE IF NOT EXISTS festival.venues (
    id SERIAL PRIMARY KEY,
    name TEXT,
    capacity INTEGER
);

CREATE TABLE IF NOT EXISTS festival.performances (
    id SERIAL PRIMARY KEY,
    performance_start TIMESTAMP WITH TIME ZONE,
    band_id INTEGER,
    venue_id INTEGER
);

CREATE TABLE IF NOT EXISTS festival.tickets (
    id SERIAL PRIMARY KEY,
    price INTEGER,
    performance_id INTEGER,
    purchase_id INTEGER,
    ticketnum TEXT
);

CREATE TABLE IF NOT EXISTS festival.purchases (
    id SERIAL PRIMARY KEY,
    purchase_date TIMESTAMP WITH TIME ZONE,
    person_id INTEGER
);

CREATE TABLE IF NOT EXISTS festival.people
(
    id   SERIAL PRIMARY KEY,
    name TEXT
);

GRANT SELECT ON ALL TABLES IN SCHEMA festival TO festival_read_only;
