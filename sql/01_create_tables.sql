CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY, 
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    release_year INT CHECK (release_year > 1888), 
    age_rating VARCHAR(10), 
    description TEXT
);

CREATE TABLE movie_genres (
    movie_id INT REFERENCES movies(movie_id) ON DELETE CASCADE,
    genre_id INT REFERENCES genres(genre_id) ON DELETE CASCADE,
    PRIMARY KEY (movie_id, genre_id) 
);

CREATE TABLE movie_actors (
    movie_id INT REFERENCES movies(movie_id) ON DELETE CASCADE,
    actor_id INT REFERENCES actors(actor_id) ON DELETE CASCADE,
    role_name VARCHAR(100),
    PRIMARY KEY (movie_id, actor_id)
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL, 
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    movie_id INT REFERENCES movies(movie_id) ON DELETE CASCADE,
    rating INT CHECK (rating BETWEEN 1 AND 10), 
    comment TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);