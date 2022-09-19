# Source Systems and Data Ingestion

Most organizations have their operational data in many different source systems. We want to
**E**xtract the data out of these sources, **L**oad into our analytical data warehouse, and 
**T**ransform it into data products that we can use to analyze and visualize the data.

Producing useful data products often means combining data from different sources to provide the
information needed to understand 

## An Example: Car dealerships and dead batteries

There are about 17,000 car dealerships across the country. All of them have cars parked on their lots
waiting to be sold, used as loaners, or waiting to be rented. One problem that these dealerships
have is that if a car sits for more than 30 days, their battery will go dead. If it's a new car, the
dealership is obliged to replace the battery. For large dealerships, this can get very expensive.
And for those large dealerships, it's very difficult to keep track of the last time a car was 
started (which charges the battery) or even where a specific car is located.

Dealerships wanted a solution to this problem - an app that would keep track of the last time
a car was turned off, record where it was located, and send out an alert when it needed to be
started to prevent the battery from dying. To do this, data from two systems needed to be combined -
the data from the dealership's operational database which had the information about the car (make,
model, year, color, VIN, etc.) and data from the Telematics feed from the car, which would have an 
record of the event of when the car was turned off and what its GPS coordinates were at that time.

![System Diagram](./images/TelematicsBatteries.drawio.png)

## Bringing Source Data Into Our Data Warehouse

### Extraction
The first step is extract the data from source systems. Today, a wide variety of tools in the 
Modern Data Stack exist to do this. Most of them use the underlying `bulk load` and `bulk unload` 
features of the source system. In a relational database, the bulk load/unload feature works by 
bypassing the higher-level features of the database in order to write large amounts of data to and
from the database as fast as possible.

![DBMS Layers](./images/DBMSLayers.drawio.png)

Using the bulk load/unload features will improve performance by an order of magnitude or more. This
is absolutely essential when we are dealing with datasets of hundreds of millions or even billions
of records.

In Postgres, bulk load or unload is done using the `COPY` command. The Postgres psql program has a 
client `\copy` command that does the same thing - we will use `\copy` in our programs.

Here is an example of extracting the `tickets` table to a CSV file using `\copy`
```sql
music_festival=> \copy festival.tickets to 'festival.csv' WITH CSV HEADER;
COPY 3590408
Time: 1481.022 ms (00:01.481)
```

We now have a copy of the tickets data from our source system that we can load into our data 
warehouse.

Let's say we decided not to use the bulk loader to load this data and instead wrote a program to
write the data into the data warehouse one record at a time.

We'd have to do the following:
* Connect to the database
* Open the CSV file for reading
* Read each record in the CSV file:
  * parse the fields in the record
  * execute an SQL insert command with the values of the fields to write the record to the database

This takes a minimum of 25-30 lines of python code to do this. If we run our python program, this is
the result:  

```
chip@chips-air % python ingest.py  
Inserted 3590409 rows into tickets table in 0:03:09.625822  
```

It takes a a little over 3 minutes to run. But if we use the `\copy` command in an sql script:  

```
chip@chips-air src % psql -U festival_read_write -h localhost -d music_festival -f tickets.sql  
Timing is on.  
TRUNCATE TABLE  
Time: 23.390 ms  
COPY 3590408  
Time: 17760.980 ms (00:17.761)  
```  

It takes less than 18 seconds. So we have an order-of-magnitude performance improvement (18 seconds
versus 189 seconds) and an order-of-magnitude less code (3 lines of code versus 30 lines of code) if
we use the bulk loader versus writing a program. And on today's systems that run in the cloud and
bill by resource usage, we might also pay an order-of-magnitude more in monetary cost.