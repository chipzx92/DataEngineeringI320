# Data Products

Data Products are what get produced at the end of the data transformation pipeline. Data products
are usually _customer-driven_ - we build them in response specific customer and organizational needs.

The dimensional models (star schemas) that we build are data products, too. But we can classify them
as our **primary** data product. A dimensional model also serves as a _data product factory_ - that 
is, we can use our dimensional models to create derived data products to fulfill customer and 
organizational requirements.

![ExtractLoadTransform](images/ExtractLoadTransform.drawio.png)

## What Are Data Products?

Data Products are tables in our data warehouse that are:
* Derived from star schemas.
* Intended to fulfill certain specific needs of our customers.
* Often transient; that is, they may only be for a specific project or inquiry.

One of the most important goals in building data products is to make our data easier to understand,
simpler, and faster to query - the exact same goals we had in building dimensional models but now
taken a step further.

One big conceptual difference between dimensional models and derived data products is that derived
data products are _ad-hoc_ - that is, there is no model or process for creating them. We create them
in response to some need - a request from a data scientist or analyst, a requirement from a 
requirements document in a project plan, or some other triggering event.

This can lead to problems. If the lifecycle of data products is not carefully managed, a bewildering
array of data products may get created to the point that the organization loses track of them. 
Having too many different data products, especially if they are poorly tracked and documented, can
be so confusing that it's worse than not having the data products customers need.

Example: Facebook's (Meta's) issues with finding all their customer data.

### An Example Data Product

Calculating how full each venue gets for each performance requires a more complicated SQL
statement than we've seen before:

```sql
CREATE TABLE analytics.attendance_at_performances AS
WITH performance_attendees AS (
    SELECT performance_id, COUNT(ticket_id) AS tickets_sold
    FROM   ticket_sales_facts AS tsf
    GROUP  BY performance_id
)
SELECT b.band_id,
       b.band_name,
       v.venue_id,
       v.venue_name,
       tickets_sold/(capacity*1.0) AS pct_seats_filled
FROM   ticket_sales_facts AS tsf
JOIN   performance_attendees AS pa ON (pa.performance_id = tsf.performance_id)
JOIN   bands_dimension AS b ON (b.band_id = tsf.band_id)
JOIN   venues_dimension AS v ON (v.venue_id = tsf.venue_id);
```

Instead of making analysts and other engineers to write this complicated SQL again and again, we
can encapsulate this query into a data product that can be reused.

### Why Create Data Products?

1. Simpler access to data
    Instead of writing SQL that joins multiple tables, we can execute a simpler query against a data product.
2. Performance
    Instead of executing the same complex query over and over again, we execute the query once and store the results in the data product. This saves both time and money.
3. Tool constraints (one dataset at a time)
    Superset, for example, can only work on a single dataset at a time. So we build data products for tools like Superset to consume.

#### Why not just create data products directly from the source data in a data lake?

This is a good question and in fact some organizations have taken this approach. The reasoning is
that different teams in an organization can be more flexible and more productive if they can go 
directly to the source data and create exactly what they and their customers need. In other words,
instead of processing data in a data pipeline that gets stored in a centralized data warehouse, 
individual programs or processes create new products. I think that this is a mistake for most 
organizations, for the following reasons:

1) The difficulty of coordinating both the processes and data products created by decentralized projects and teams.
2) Dimensional models provide a well-known, structured way to organize analytical data and to build data products.
3) Star schemas also provide a well-structured way to do ad-hoc queries, as opposed to searching across raw data sources.
4) Combining data from different sources is only done once in a data pipeline but may be repeated many times in a data lake approach.

## Data Products in the Data Pipeline
[In Progress - there will a diagram and some exposition here]

### Exercise - Create a Data Product

Using the star schema tables in the music_festival database, create a data product that can be used
to answer the following questions:

Which performances had an average ticket price over $25 - we want to know the band, the venue,
the number of tickets sold, and the total ticket sales revenue as well as the average ticket price.

The SQL statement can begin with a _DROP TABLE IF EXISTS_ and a _CREATE TABLE...AS_, like so:

```sql
DROP TABLE IF EXISTS <your_table_name>;
CREATE TABLE IF NOT EXISTS <your_table_name> AS
SELECT ...
```
Fill in the table name with what you think is a good descriptive name for this data product. Good
names are important (and not always easy)!

Then fill in the SELECT statement with a query that will fulfill the requirements above.

Question: Why do we want the DROP TABLE in this exercise?