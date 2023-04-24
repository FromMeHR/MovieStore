DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS purchased_movies;
DROP TABLE IF EXISTS balances;

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    password TEXT NOT NULL,
    repeat_password TEXT NOT NULL
);

CREATE TABLE purchased_movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
	movie_name TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE balances (
    user_id INTEGER PRIMARY KEY,
    balance REAL NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);
