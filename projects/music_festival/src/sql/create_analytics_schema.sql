CREATE SCHEMA IF NOT EXISTS analytics;
GRANT SELECT ON ALL TABLES IN SCHEMA analytics TO festival_read_only;
ALTER ROLE festival_read_write SET SEARCH_PATH=analytics,festival;
ALTER ROLE festival_read_only SET SEARCH_PATH=analytics,festival;

-- DROP TABLE IF EXISTS analytics.band_performance_facts CASCADE;
-- DROP TABLE IF EXISTS analytics.bands_dimension;
-- DROP TABLE IF EXISTS analytics.performances_dimension;
-- DROP TABLE IF EXISTS analytics.venues_dimension;
-- DROP TABLE IF EXISTS analytics.purchases_dimension;
-- DROP TABLE IF EXISTS analytics.tickets_dimension;
-- DROP TABLE IF EXISTS analytics.people_dimension;

-- CREATE TABLE IF NOT EXISTS analytics.bands_dimension
-- (
--     band_id    BIGINT PRIMARY KEY,
--     name       TEXT,
--     fee        INTEGER
-- );
-- 
-- CREATE TABLE IF NOT EXISTS analytics.performances_dimension
-- (
--     performance_id    BIGINT PRIMARY KEY,
--     performance_start TIMESTAMP,
--     performance_end   TIMESTAMP
-- );
-- 
-- CREATE TABLE IF NOT EXISTS analytics.venues_dimension
-- (
--     venue_id    BIGINT PRIMARY KEY,
--     venue_name  TEXT
-- );
-- 
-- CREATE TABLE IF NOT EXISTS analytics.purchases_dimension
-- (
--     purchase_id   BIGINT PRIMARY KEY,
--     purchase_date TIMESTAMP
-- );
-- 
-- CREATE TABLE IF NOT EXISTS analytics.tickets_dimension
-- (
--     ticket_id  BIGINT PRIMARY KEY,
--     ticketnum  TEXT
-- );
-- 
-- CREATE TABLE IF NOT EXISTS analytics.people_dimension
-- (
--     person_id   BIGINT PRIMARY KEY,
--     person_name TEXT
-- );
-- 
-- CREATE TABLE IF NOT EXISTS analytics.band_performance_facts
-- (
--     band_id         BIGINT,
--     venue_id        BIGINT,
--     performance_id  BIGINT,
--     purchase_id     BIGINT,
--     ticket_id       BIGINT,
--     person_id       BIGINT,
--     ticket_price    INTEGER,
--     FOREIGN KEY (band_id)  REFERENCES analytics.bands_dimension(band_id),
--     FOREIGN KEY (venue_id)  REFERENCES analytics.venues_dimension(venue_id),
--     FOREIGN KEY (performance_id)  REFERENCES analytics.performances_dimension(performance_id),
--     FOREIGN KEY (purchase_id)  REFERENCES analytics.purchases_dimension(purchase_id),
--     FOREIGN KEY (ticket_id)  REFERENCES analytics.tickets_dimension(ticket_id),
--     FOREIGN KEY (person_id)  REFERENCES analytics.people_dimension(person_id)
--  );