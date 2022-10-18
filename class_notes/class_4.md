# Class 4: Live demo pipeline

1. Chip logs in, demos full pipeline (15m, 15)
2. Send invite to James, James accepts on screen, sets up and logs in runs pipeline (10m, 25)
3. Invites out to the students (not Dhanny) (5m, 30)
4. Walk around make sure students are and where they need to be (15m, 45)
5. Walk students through running the work flow. (15,60)
6. Release and Introduce the homework (10,70)

-------------

SELECT *
FROM ticket_facts;

SELECT SUM(price) AS all_time_revenue
FROM ticket_facts;


SELECT venue_id, SUM(price) AS all_time_revenue_per_venue
FROM ticket_facts
GROUP BY venue_id

-- lookup the venue name for each row.
SELECT venue_name, 
       SUM(price) AS all_time_revenue_per_venue
FROM ticket_facts AS f
  JOIN venue_dimension AS v ON f.venue_id = v.id  
GROUP BY venue_id

SELECT band_id, SUM(price) AS  all_time_revenue_per_band
FROM ticket_facts AS f
GROUP BY band_id

SELECT band_id, SUM(price) AS  all_time_revenue_per_band
FROM ticket_facts AS f
  JOIN band_dimension AS v ON f.band_id = b.id  
GROUP BY band_id

-- revenue by band and venue.
SELECT *
FROM ticket_facts AS f;

SELECT venue_id, band_id, SUM(price) AS all_time_revenue
FROM ticket_facts AS f
GROUP BY venue_id, band_id;

-- do lookups for venues/bands
SELECT venue_id, band_id, SUM(price) AS all_time_revenue
FROM ticket_facts AS f
  JOIN venue_dimension AS v ON f.venue_id = v.id
  JOIN band_dimension AS b ON f.band_id = b.id
GROUP BY venue_id, band_id;

-- ticketsales:
SELECT venue_id, band_id, COUNT(*) AS all_time_ticket_sales
FROM ticket_facts AS f
  JOIN venue_dimension AS v ON f.venue_id = v.id
  JOIN band_dimension AS b ON f.band_id = b.id
GROUP BY venue_id, band_id;

SELECT *
FROM ticket_facts AS f;

-- look up time of purchase
SELECT *
FROM ticket_facts AS f
  JOIN purchase_dimension AS p ON f.purchase_id = p.id

-- Now we can extract the Year and Month.
SELECT EXTRACT(YEAR FROM purchase_date) AS purchase_year,
       EXTRACT(MONTH FROM purchase_date) AS purchase_month,
       SUM(price) as revenue,
       *
FROM ticket_facts AS f
  JOIN purchase_dimension AS p ON f.purchase_id = p.id
GROUP BY EXTRACT(YEAR FROM purchase_date) AS purchase_year,
         EXTRACT(MONTH FROM purchase_date) AS purchase_month

-- can now add venue/band groupings.

time_dimension.by_quarter ("2011-Q1")


telematics

cars owned by dealers by brand


----------------------

Do same query on star schema and the ER schema.

show a table and ask is it a fact table or a dimension table.

show a partially changed schema, have them shift an aggregation column from a dimension to a fact table.

difference between "fully denormalized" and fact table.


Could use the design for the ecology field observations.

Assign them the DataCamp database modeling task?

-----------

take out FK from the Fact table ER.

note that the v.id in the start schema vs operational schema is wrong, should be v.venue_id.

move these tables to a new schema called star_schema (probably should have that in the pipeline anyway)

figure out a way to have them build the query up step by step.

SELECT *
FROM ticket_sales_facts;

SELECT SUM(ticket_price)
FROM ticket_sales_facts;

SELECT ticket_sales_facts.band_id, SUM(ticket_price)
FROM ticket_sales_facts
GROUP BY ticket_sales_facts.band_id

SELECT ticket_sales_facts.band_name, SUM(ticket_price)
FROM ticket_sales_facts
  JOIN bands_dimension ON ticket_sales_facts.band_id = bands_dimension.band_id
GROUP BY ticket_sales_facts.band_id


-- revenue by year.

SELECT *
FROM ticket;

-- join in performance_dimension to get performance_start

SELECT *
FROM ticket_sales_facts as f
  JOIN performance_dimension p USING performance_id

-- now we can get the year.

SELECT *, EXTRACT(YEAR FROM p)
FROM ticket_sales_facts as f
  JOIN performance_dimension USING performance_id





----------------------

2022-10-12

CREATE TABLE user_accounts (
    id SERIAL PRIMARY KEY,
    name TEXT
);


CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    name TEXT,
    content TEXT,
    created_at TIMESTAMP,
    user_account_id INTEGER
);

CREATE TABLE posts_resources (
    post_id INTEGER,
    resource_id INTEGER	
);

CREATE TABLE resources (
    id SERIAL PRIMARY KEY,
    name TEXT,
    type TEXT,
    path TEXT
);

CREATE TABLE posts_tags (
    post_id INTEGER,
    tag_id INTEGER
);

CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE bids (
    id SERIAL PRIMARY KEY,
    amount INTEGER,
    submitted_at TIMESTAMP,
    tag_id INTEGER,
    advertiser_id INTEGER
);

CREATE TABLE industries (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE posts_tags (
    industry_id INTEGER,
    advertiser_id INTEGER
);

CREATE TABLE advertisers (
    id SERIAL PRIMARY KEY,
    name TEXT
);

