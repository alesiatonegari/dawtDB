SELECT 
    u.username,
    COUNT(DISTINCT wl.movie_id) AS unique_movies,
    ROUND(AVG(r.rating_value), 2) AS avg_rating,
    CONCAT(u.username, ' watched ', COUNT(DISTINCT wl.movie_id), ' films') AS summary
FROM USERS u
LEFT JOIN WATCHLOG wl ON u.user_id = wl.user_id
LEFT JOIN RATING r ON u.user_id = r.user_id
GROUP BY u.user_id, u.username
ORDER BY unique_movies DESC;



SELECT g.genre_name, m.title, ROUND(AVG(r.rating_value), 1) AS avg_rating
FROM MOVIE m
JOIN MOVIE_GENRE mg ON m.movie_id = mg.movie_id
JOIN GENRE g ON mg.genre_id = g.genre_id
JOIN RATING r ON m.movie_id = r.movie_id
WHERE m.movie_id IN (
    SELECT movie_id FROM RATING GROUP BY movie_id HAVING AVG(rating_value) >= 3.5
)
GROUP BY g.genre_name, m.movie_id, m.title
ORDER BY g.genre_name, avg_rating DESC;



SELECT DISTINCT
    u.username,
    CONCAT(m.title, ' (', YEAR(m.release_date), ')') AS movie_label,
    CASE WHEN rv.review_text IS NOT NULL THEN LEFT(rv.review_text, 50) ELSE 'No review' END AS review
FROM USERS u
JOIN WATCHLIST wl ON u.user_id = wl.user_id
JOIN MOVIE m ON wl.movie_id = m.movie_id
LEFT JOIN REVIEW rv ON rv.user_id = u.user_id AND rv.movie_id = m.movie_id
ORDER BY u.username;