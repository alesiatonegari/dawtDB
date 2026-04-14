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

-- 4. Movie Summary with Runtime and Details
SELECT 
    CONCAT(title, ' (', runtime, ' mins)') AS movie_details, 
    c.country_name
FROM MOVIE m
JOIN COUNTRY c ON m.country_id = c.country_id
ORDER BY runtime DESC;

-- 5. Most popular genre by total watches
SELECT
    g.genre_name,
    COUNT(wl.log_id) AS total_watches
FROM GENRE g
JOIN MOVIE_GENRE mg ON g.genre_id  = mg.genre_id
JOIN WATCHLOG   wl ON mg.movie_id = wl.movie_id
JOIN MOVIE       m ON mg.movie_id = m.movie_id
GROUP BY g.genre_id, g.genre_name
ORDER BY total_watches DESC;

-- 6. Average rating per movie with total watch count
SELECT
    m.title,
    ROUND(AVG(r.rating_value), 2) AS avg_rating,
    COUNT(wl.log_id)              AS total_watches
FROM MOVIE m
LEFT JOIN RATING   r  ON m.movie_id = r.movie_id
LEFT JOIN WATCHLOG wl ON m.movie_id = wl.movie_id
GROUP BY m.movie_id, m.title
ORDER BY avg_rating DESC, total_watches DESC;
