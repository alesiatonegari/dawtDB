-- 1. Show each movie with its country and genres
SELECT m.title, c.country_name,
GROUP_CONCAT(g.genre_name SEPARATOR ', ') AS genres
FROM MOVIE m
JOIN COUNTRY c ON m.country_id = c.country_id
JOIN MOVIE_GENRE mg ON m.movie_id = mg.movie_id
JOIN GENRE g ON mg.genre_id = g.genre_id
GROUP BY m.movie_id, m.title, c.country_name;

-- 2. Show all reviews with the username and movie title
SELECT u.username, m.title, r.review_text
FROM REVIEW r
JOIN USERS u ON r.user_id = u.user_id
JOIN MOVIE m ON r.movie_id = m.movie_id;

-- 3. Show each user's watchlist with movie titles
SELECT u.username, m.title
FROM WATCHLIST wl
JOIN USERS u ON wl.user_id = u.user_id
JOIN MOVIE m ON wl.movie_id = m.movie_id;

