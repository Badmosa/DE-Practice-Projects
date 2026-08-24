# The processes of Database Connection.
# sqlite3.connect = to connect a Database
# sqlite3:remove: = to remove a Database

import sqlite3
connection = sqlite3.connect("test_database.db")

cursor = connection.cursor()
print(type(cursor))

query = "SELECT datetime('now', 'localtime')"
print(cursor.execute(query))

print(cursor.fetchone()) # DATETIME: Autoomatically displays the durrent date and time

# perfect format
time = cursor.execute(query).fetchone()[0]
print(time)

# To close a database connection:
connection.close()

# Using a with statement to manage a database connection:
# The resulting code is often cleaner and shorter than code written without a  with  statement.
with sqlite3.connect("test_databse.db") as connection:
    cursor = connection.cursor()
    query = "SELECT datetime('now', 'locally');"
    time = cursor.execute(query).fetchone()[0]
print(time)

# Working With Database Tables
# Data bases are used to store and retrieve information. Howeveer, to do this, a table with values is needed.
#import sqlite3
#connection = sqlite3.connect("test_database.db")
#cursor = connection.cursor()
#cursor.execute(
#"""CREATE TABLE People(
#FirstName TEXT,
#LastName TEXT,
#Age INT
#);"""
#)

#cursor.execute(
#"""INSERT INTO People VALUES(
#'Ron',
#'Obvious',
#42
#);"""
#)

#cursor.execute("DROP TABLE People;")
#connection.commit()
#connection.close()

# Using the with statement to mnage connection
# import sqlite3
# with sqlite3.connect("test_database.db") as connection:
#     cursor = connection.cursor()
#     cursor.execute(
#         """CREATE TABLE People(
#             FirstName TEXT,
#             LastName TEXT,
#             Age INT
#         );"""
#     )

# cursor.execute(
#     """INSERT INTO People VALUES(
#         'Ron',
#         'Obvious',
#         42
#         );"""
#     )


# Use cursor.executescript to execute multiple SQL stattement at a time
import sqlite3
with sqlite3.connect("test_database.db") as connection:
    cursor = connection.cursor()
    cursor.executescript(
        """DROP TABLE IF EXISTS People
        CREATE TABLE People(
            FirstName TEXT,
            LastName TEXT,
            Age INT
        );"""
    )

cursor.execute(
    """INSERT INTO People VALUES(
        'Ron',
        'Obvious',
        42
        );"""
    )