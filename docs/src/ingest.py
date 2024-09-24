import csv
from datetime import datetime
import psycopg2

counter = 0

INSERT_TICKETS = """
INSERT INTO tickets
    (id, price, performance_id, purchase_id, ticketnum)
VALUES
    (%s, %s, %s, %s, %s)"""

# connect to the database and get a cursor
print("Connecting to database")
conn = psycopg2.connect(host="localhost",
                        dbname="music_festival",
                        user="festival_read_write",
                        password="writer")
cursor = conn.cursor()
cursor.execute("BEGIN TRANSACTION")

# delete all records from the tickets table
print("Truncating tables")
cursor.execute("TRUNCATE TABLE festival.tickets")

start = datetime.utcnow()

# insert the data
print("Loading data")
with open('../data/tickets.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='"', )
    for row in reader:
        if counter > 0:  # skip header in file
            cursor.execute(INSERT_TICKETS, tuple(row))
        counter = counter + 1
        if counter > 0 and counter % 500 == 0:
            print(f"Inserted {counter} rows")
cursor.execute("COMMIT")

# calculate the time to load the data
end = datetime.utcnow()
total_time = end - start
print(f"Inserted {counter} rows into ticket in {total_time}")
