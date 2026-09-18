-- фильмы выпущенные после 2010 года по убыванию года выпуска
SELECT title, release_year 
FROM movies 
WHERE release_year>2010 
ORDER BY release_year DESC;

-- топ 5 самых длинных фильмов
SELECT title, duration_minutes
FROM movies
ORDER BY duration_minutes DESC
LIMIT 5;

-- вывести всех актеров, чья фамилия начинается на букву Д
SELECT first_name, last_name 
FROM actors
WHERE last_name LIKE 'Д%'
ORDER BY last_name;

-- вывести фильм и его жанры через запятую
SELECT m.title,
STRING_AGG(g.name, ', ' ORDER BY g.name) AS genres
FROM movies m
JOIN movie_genres mg ON m.movie_id = mg.movie_id
JOIN genres g ON g.genre_id = mg.genre_id
GROUP BY m.movie_id, m.title
ORDER BY m.title;

-- вывести главного актера каждого фильма
SELECT m.title, a.first_name || ' ' || a.last_name AS main_actor, ma.role_name
FROM movies m
JOIN movie_actors ma ON m.movie_id = ma.movie_id
JOIN actors a ON a.actor_id = ma.actor_id
ORDER BY m.title;

-- вывести имена пользователей, их отзыв, и фильм, на который был оставлен отзыв/ рейтинг = 10
SELECT r.review_id, 
r.rating || ' ' || r.comment AS Review, 
u.username AS user_name, 
m.title AS movie_name
FROM reviews r
JOIN users u ON u.user_id = r.user_id
JOIN movies m ON r.movie_id = m.movie_id
WHERE r.rating = 10
LIMIT 20;

-- подсчитать количество фильмов в каждом жанре
SELECT g.name, COUNT(mg.movie_id) AS movie_count
FROM genres g
LEFT JOIN movie_genres mg ON mg.genre_id = g.genre_id
GROUP BY g.name
ORDER BY movie_count DESC;

-- топ 5 жанров по количеству фильмов
SELECT g.name, COUNT(mg.movie_id) AS movies_count
FROM genres g
LEFT JOIN movie_genres mg ON g.genre_id = mg.genre_id
GROUP BY g.name
ORDER BY movies_count DESC
LIMIT 5;

-- топ 10 пользователей по количеству написанных отзывов
SELECT u.username, COUNT(r.user_id) AS count_reviews
FROM users u
LEFT JOIN reviews r ON r.user_id = u.user_id
GROUP BY u.username
ORDER BY count_reviews DESC
LIMIT 10;

-- вывести фильмы у которых больше 40 отзывов
SELECT m.title, COUNT(r.review_id) AS count_reviews
FROM movies m
JOIN reviews r ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
HAVING COUNT(r.review_id) > 40
ORDER BY count_reviews DESC;

--средний рейтинг каждого жанра
SELECT g.name, ROUND(AVG(r.rating),2) AS avg_rating
FROM genres g
JOIN movie_genres mg ON mg.genre_id = g.genre_id
JOIN reviews r ON r.movie_id = mg.movie_id
GROUP BY g.name
ORDER BY avg_rating DESC;

-- фильмы у которых нет ни одного отзыва
SELECT m.title, m.release_year
FROM movies m
LEFT JOIN reviews r ON m.movie_id = r.movie_id
WHERE r.review_id IS NULL
ORDER BY m.title;

-- фильмы, у которых средний рейтинг выше среднего по всем фильмам
SELECT m.title, ROUND(AVG(r.rating), 2) AS avg_rating
FROM movies m
JOIN reviews r ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
HAVING AVG(r.rating) > (SELECT AVG(rating) FROM reviews)
ORDER BY avg_rating DESC;

-- пользователи, которые ни разу не оставили отзыв
SELECT u.username, u.email
FROM users u
LEFT JOIN reviews r ON u.user_id = r.user_id
WHERE r.review_id IS NULL
ORDER BY u.username;

-- актеры, которые снимались в фильмах жанра 'Драма'
SELECT DISTINCT
    a.first_name || ' ' || a.last_name AS actor,
    m.title AS movie_title
FROM actors a
JOIN movie_actors ma ON a.actor_id = ma.actor_id
JOIN movies m ON ma.movie_id = m.movie_id
JOIN movie_genres mg ON m.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
WHERE g.name = 'Драма'
ORDER BY actor, movie_title;