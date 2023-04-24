import sqlite3
import os

if not os.path.exists('database.db'):
    open('database.db', 'w').close()

connection = sqlite3.connect('database.db')

with open('schema.sql') as f:
    connection.executescript(f.read())

cur = connection.cursor()

connection.commit()

connection.close()
