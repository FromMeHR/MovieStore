DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS purchased_movies;
DROP TABLE IF EXISTS balances;
DROP TABLE IF EXISTS reviews;

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

CREATE TABLE reviews (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    rating INTEGER NOT NULL,
    first_name1 TEXT NOT NULL,
    last_name1 TEXT NOT NULL,
    comment TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (first_name1) REFERENCES users (first_name),
    FOREIGN KEY (last_name1) REFERENCES users (last_name)
);

SELECT AVG(rating) as avg_rating FROM reviews WHERE movie_id = ?
