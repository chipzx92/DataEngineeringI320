import os
import csv
from datetime import datetime
import psycopg2

INSERT_TICKETS = """
INSERT INTO tickets
    (id, price, performance_id, purchase_id, ticketnum)
VALUES
    (%s, %s, %s, %s, %s)"""

# count the number of rows that get inserted
counter = 0

# get the user login and password to the database
user = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")

# connect to the database
conn = psycopg2.connect(host="localhost",
                        dbname="music_festival",
                        user="festival_read_write",
                        password=password)

# get a cursor (used to execute SQL statements)
cursor = conn.cursor()

try:
    # begin a transaction
    cursor.execute("BEGIN TRANSACTION")

    # empty the table of any existing records
    cursor.execute("TRUNCATE TABLE festival.tickets")

    # get the start time
    start = datetime.utcnow()

    # insert the rows from the CSV file
    # open the CSV file
    print("Loading data from csv file...")
    with open('../data/tickets.csv', newline='') as csvfile:
        csv_reader = csv.reader(csvfile, delimiter=',', quotechar='"', )
        # read each row from the CSV file
        for row in csv_reader:
            if counter > 0:  # skip header in file
                # insert the row
                cursor.execute(INSERT_TICKETS, tuple(row))
            counter = counter + 1

    # commit the transaction
    cursor.execute("COMMIT")

    # done reading rows, get the end time and calculate the total time
    end = datetime.utcnow()
    total_time = end - start
    print(f"Inserted {counter} rows into ticket in {total_time}")

except Exception as ex:
    # if an exception occurs, roll back the transaction
    if cursor:
        cursor.execute("ROLLBACK")
    # print out the error message and stack trace from the exception
    print(f"Error: {ex}")
finally:
    # close the connection to the database
    if conn:
        conn.close()
