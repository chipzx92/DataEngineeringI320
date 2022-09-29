import sys
import csv
from datetime import datetime
import psycopg2

INSERT_TICKETS = """
INSERT INTO tickets
    (id, price, performance_id, purchase_id, ticketnum)
VALUES
    (%s, %s, %s, %s, %s)"""

max_reps = 0
counter = 0


def insert_tickets(cursor):
    start = datetime.utcnow()
    with open('../data/tickets.csv', newline='') as csvfile:
        reader = csv.reader(csvfile, delimiter=',', quotechar='"', )
        read_and_insert_each_row(cursor,reader)
    end = datetime.utcnow()
    total_time = end - start
    print(f"Inserted {counter} rows into ticket in {total_time}")


def read_and_insert_each_row(cursor, reader):
    global counter
    for row in reader:
        if counter > 0:   # skip header in file
            insert_row(cursor, row)
            if max_reps > 0 and counter >= max_reps:
                return
        counter = counter + 1


def insert_row(cursor, row):
    if max_reps > 0:
        print_sql_statement(cursor, row)
    cursor.execute(INSERT_TICKETS, tuple(row))


def connect_to_db():
    conn = psycopg2.connect(host="localhost",
                            dbname="music_festival",
                            user="festival_read_write",
                            password="writer")
    return conn


def clear_table(cursor):
    cursor.execute("TRUNCATE TABLE festival.tickets")


def print_sql_statement(cursor, row):
    sql = str(cursor.mogrify(INSERT_TICKETS, tuple(row)))
    msg = bytes(sql, "utf-8").decode("unicode_escape")
    print(f"{msg[2:-1]}")


def main():
    global max_reps
    if len(sys.argv) > 1:
        max_reps = int(sys.argv[1])
    try:
        conn = connect_to_db()
        cursor = conn.cursor()
        cursor.execute("BEGIN TRANSACTION")
        clear_table(cursor)
        insert_tickets(cursor)
    finally:
        cursor.execute("COMMIT")
        if conn:
            conn.close()


if __name__ == "__main__":
    main()
