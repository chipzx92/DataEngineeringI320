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

----------------------

Is it true that a JOIN from a fact table to a dimension table never changes the grain?

JOINs to bridge tables change the grain.

-----------------

Where do you do things like resolving name synomyms.  Could do it early in the pipeline, or after the star schema.  I guess this is more data validation/cleaning.

-----------------

need notes on building the star schema transformation query.

SELECT b.id AS band_id, 
       v.id AS venue_id,
       f.id AS performance_id,
       c.id AS purchase_id,
       t.id AS ticket_id,
       p.id AS people_id,
       t.price AS ticket_price       
FROM   festival.bands AS b
LEFT OUTER JOIN   festival.performances AS f ON (b.id = f.band_id)
JOIN   festival.venues AS v ON (v.id = f.venue_id)
JOIN   festival.tickets AS t ON (t.performance_id = f.id)
LEFT OUTER JOIN   festival.purchases AS c ON (c.id = t.purchase_id)
LEFT OUTER JOIN   festival.people AS p ON (p.id = c.person_id)


The grain of the fact table is each ticket.  First need is to get the grain, then we can join and add foreign keys.

SELECT *
FROM tickets

SELECT t.id AS ticket_id, *
FROM tickets AS t

SELECT t.id AS ticket_id, 
       t.price AS ticket_price, *
FROM tickets AS t

/* Now look to navigate across the ER, following foreign keys.
  We have performance_id and we have purchase_id.  We need those.
*/

SELECT t.id AS ticket_id, 
       t.price AS ticket_price,
       t.performance_id
FROM tickets AS t

/* But we don't yet have band_id and venue_id or person_id)
We have to get those from joins.
  We will eventually need to go both directions
  but let's head towards performances first.
*/


-- You can think of this as adding all the columns from the performances table,
-- then renaming those we will keep. Adding the ,* shows all columns even when you 
-- have selected some. This can cause some duplicates which sql resolves with subscripts
-- e.g., performance_id__1

SELECT t.id AS ticket_id, 
       t.price AS ticket_price,
       t.performance_id,
       *
FROM tickets AS t
  JOIN performances AS p ON t.performance_id = p.id

-- Of the new columns performance_id, band_id, venue_id we will keep band_id and venue_id but not performance_start

SELECT t.id AS ticket_id, 
       t.price AS ticket_price, 
       t.performance_id AS performance_id,
       p.venue_id AS venue_id,
       p.band_id AS band_id,
       *
FROM tickets AS t
  JOIN performances AS p ON t.performance_id = p.id

-- We don't need to join to venues and bands because we already have venue_id and band_id
-- and the facts table doesn't need the names (those go in the dimensions).

-- So now we can go back and follow the purchase_id key

SELECT t.id AS ticket_id, 
       t.price AS ticket_price, 
       t.performance_id AS performance_id,
       p.venue_id AS venue_id,
       p.band_id AS band_id,
        p.purchase_id AS purchase_id,
       *
FROM tickets AS t
  JOIN performances AS p ON t.performance_id = p.id


-- Now we can use purchase_id to join to purchases to get the id.

SELECT t.id AS ticket_id, 
       t.price AS ticket_price, 
       t.performance_id AS performance_id,
       p.venue_id AS venue_id,
       p.band_id AS band_id,
       p.purchase_id AS purchase_id,
       *
FROM tickets AS t
  JOIN performances AS p ON t.performance_id = p.id
  JOIN purchases AS pr ON t.purchase_id = pr.id


---------------

give them CSV files + analyst scenarios.

conceptual ER
physical ER for source data.

--> load scripts for CSV to staging tables. Finish by Tuesday

transformation diagram to star schema.

--> staging tables to star schema.  Ideally finish by Thursday but also next Tuesday

data products design and justification (2-3 paragraphs, could include lo-fi prototype)

--> dbt files for data products Finish by 2nd Tuesday

dashboard design

--> create dashboard in superset.  Finish by 2nd Thursday.

everything submitted as jupyter notebook exported as HTML.



