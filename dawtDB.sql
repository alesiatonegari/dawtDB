CREATE DATABASE dawtDB;
USE dawtDB;

-- 1.CREATE TABLES --

-- USERS TABLE
CREATE TABLE USERS (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- COUNTRY TABLE
CREATE TABLE COUNTRY (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL
);

-- MOVIE TABLE
CREATE TABLE MOVIE (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    country_id INT,
    title VARCHAR(200) NOT NULL,
    release_date DATE,
    overview TEXT,
    runtime INT,
    FOREIGN KEY (country_id) REFERENCES COUNTRY(country_id)
);

-- GENRE TABLE
CREATE TABLE GENRE (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(100) NOT NULL
);

-- MOVIE_GENRE (junction table)
CREATE TABLE MOVIE_GENRE (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id),
    FOREIGN KEY (genre_id) REFERENCES GENRE(genre_id)
);

-- RATING TABLE
CREATE TABLE RATING (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    rating_value DECIMAL(3,1),
    FOREIGN KEY (user_id) REFERENCES USERS(user_id),
    FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id)
);

-- REVIEW TABLE
CREATE TABLE REVIEW (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    review_text TEXT,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id),
    FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id)
);

-- WATCHLOG TABLE
CREATE TABLE WATCHLOG (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    watch_date DATE,
    rewatch TINYINT(1) DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id),
    FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id)
);

-- WATCHLIST TABLE
CREATE TABLE WATCHLIST (
    watchlist_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id),
    FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id)
);

-- 2.INSERT SAMPLE DATA INFO --

-- USERS
INSERT INTO USERS (username, email) VALUES
('john doe','jd142@yahoo.com'),
('jane doe','jd134@yahoo.com'),
('steve','steve.h@hotmail.com'),
('max','maxman@gmail.com'),
('label','lalabel8@gmail.com'),
('mabel','mabel.123@gmail.com'),
('dipper','pinecone.2@gmail.com'),
('bill','cy.bill@gmail.com'),
('stan','stan.pines.real@gmail.com'),
('wendy','wwndice@gmail.com'),
('candy','candypop.sparklez@gmail.com'),
('garett','gar.hall@gmail.com'),
('devin','de584436@hotmail.com'),
('lexi','alexia.v25@gmail.com'),
('frida','fritos274@gmail.com'),
('brisa','writer.bo@outlook.com'),
('justice','switchmar@gmail.com'),
('patience','pat.colsey2@gmail.com'),
('kat','kaytlynn.vergaras@gmail.com'),
('stephen','stephen.obtuse@gmail.com'),
('steven','steven.ontogonal@gmail.com'),
('xavier','deflores.x51@gmail.com'),
('lilly','pantherlilly360@gmail.com'),
('marco','marco.polo@gmail.com');

-- COUNTRY
INSERT INTO COUNTRY (country_name) VALUES
('USA'), ('South Korea'), ('Japan'), ('United Kingdom'),
('France'), ('Germany'), ('Italy'), ('Spain'),
('Australia'), ('Canada'), ('Mexico'), ('India'),
('China'), ('Brazil'), ('Sweden'), ('Denmark'),
('Ireland'), ('New Zealand'), ('Argentina'), ('Thailand'),
('Nigeria'), ('Russia'), ('Portugal'), ('Austria');

-- GENRE
INSERT INTO GENRE (genre_name) VALUES
('Sci-Fi'), ('Thriller'), ('Drama'), ('Animation'),
('Crime'), ('Horror'), ('Romance'), ('Action'),
('Mystery'), ('Adventure'), ('Fantasy'), ('Comedy'),
('Documentary'), ('Historical'), ('Musical'), ('Western'),
('Sports'), ('War'), ('Biographical'), ('Psychological'),
('Supernatural'), ('Dystopian'), ('Coming-of-Age'), ('Dark Comedy');

-- MOVIE
INSERT INTO MOVIE (country_id, title, release_date, overview, runtime) VALUES
(1, 'Inception', '2010-07-16', 'A thief who enters dreams.', 148),
(2, 'Parasite', '2019-05-30', 'A class conflict thriller.', 132),
(1, 'The Godfather', '1972-03-24', 'A mafia family saga.', 175),
(3, 'Spirited Away', '2001-07-20', 'A girl enters a spirit world.', 125),
(1, 'Interstellar', '2014-11-07', 'Astronauts search for a new home.', 169),
(4, '28 Days Later', '2002-11-01', 'A virus devastates England.', 113),
(5, 'Amelie', '2001-04-25', 'A shy waitress changes lives.', 122),
(1, 'The Dark Knight', '2008-07-18', 'Batman faces the Joker.', 152),
(3, 'Your Name', '2016-08-26', 'Two teens swap bodies.', 106),
(2, 'Oldboy', '2003-11-21', 'A man imprisoned for 15 years seeks answers.', 120),
(6, 'Run Lola Run', '1998-08-20', 'A woman has 20 minutes to save her boyfriend.', 81),
(7, 'Cinema Paradiso', '1988-11-17', 'A filmmaker recalls his childhood love of film.', 155),
(1, 'Pulp Fiction', '1994-10-14', 'Interconnected crime stories in LA.', 154),
(8, 'Pan\'s Labyrinth', '2006-10-11', 'A girl escapes into a dark fantasy world.', 118),
(9, 'Mad Max: Fury Road', '2015-05-15', 'A chase across a post-apocalyptic wasteland.', 120),
(10, 'Atanarjuat', '2001-06-08', 'An Inuit legend brought to life.', 172),
(3, 'Akira', '1988-07-16', 'A biker gang in Neo-Tokyo uncovers dark powers.', 124),
(4, 'Trainspotting', '1996-02-23', 'Young drug addicts in Edinburgh.', 93),
(1, 'Get Out', '2017-02-24', 'A Black man uncovers a sinister secret.', 104),
(5, 'Blue Is the Warmest Colour', '2013-05-23', 'A coming-of-age love story.', 179),
(12, 'Lagaan', '2001-06-15', 'Villagers challenge British rulers to cricket.', 224),
(6, 'Metropolis', '1927-01-10', 'A futuristic city divided by class.', 153),
(1, 'Moonlight', '2016-10-21', 'A young mans journey of self-discovery.', 111),
(2, 'The Handmaiden', '2016-06-01', 'A con artist targets a wealthy heiress.', 145);

-- MOVIE_GENRE
INSERT INTO MOVIE_GENRE VALUES
(1, 1), (1, 2),
(2, 2), (2, 3),
(3, 3), (3, 5),
(4, 4), (4, 11),
(5, 1), (5, 3),
(6, 6), (6, 2),
(7, 7), (7, 3),
(8, 8), (8, 2),
(9, 4), (9, 7),
(10, 9), (10, 20),
(11, 8), (11, 2),
(12, 3), (12, 23),
(13, 5), (13, 24),
(14, 11), (14, 6),
(15, 8), (15, 22),
(16, 14), (16, 10),
(17, 4), (17, 1),
(18, 3), (18, 5),
(19, 6), (19, 9),
(20, 7), (20, 3),
(21, 17), (21, 14),
(22, 1), (22, 22),
(23, 3), (23, 23),
(24, 9), (24, 2);

-- RATING
INSERT INTO RATING (user_id, movie_id, rating_value) VALUES
(1, 1, 9),  (2, 2, 8),  (3, 3, 10),
(4, 4, 8),  (5, 5, 9),  (6, 6, 7),
(7, 7, 10), (8, 8, 9),  (9, 9, 8),
(10, 10, 8),(11, 11, 7), (12, 12, 9),
(13, 13, 10),(14, 14, 8),(15, 15, 8),
(16, 16, 7),(17, 17, 8), (18, 18, 8),
(19, 19, 9),(20, 20, 8), (21, 21, 7),
(22, 22, 10),(23, 23, 9),(24, 24, 10);

-- REVIEW
INSERT INTO REVIEW (user_id, movie_id, review_text) VALUES
(1, 1, 'Mind-blowing concept and execution!'),
(2, 2, 'A masterpiece of tension and class commentary.'),
(3, 3, 'Timeless. Every scene is perfect.'),
(4, 4, 'Magical and deeply emotional.'),
(5, 5, 'Visually stunning and heartbreaking.'),
(6, 6, 'Raw and terrifying. Stayed with me for days.'),
(7, 7, 'Charming, whimsical and full of heart.'),
(8, 8, 'The greatest superhero film ever made.'),
(9, 9, 'Beautiful animation and a touching story.'),
(10, 10, 'Disturbing and brilliant. Unforgettable.'),
(11, 11, 'Relentless energy from start to finish.'),
(12, 12, 'A love letter to cinema itself.'),
(13, 13, 'Dialogue like no other film ever made.'),
(14, 14, 'Dark and haunting. Del Toro at his best.'),
(15, 15, 'Pure adrenaline. Incredible practical effects.'),
(16, 16, 'A quiet epic that deserves more recognition.'),
(17, 17, 'Groundbreaking animation even today.'),
(18, 18, 'Gritty, honest and deeply human.'),
(19, 19, 'Smart, scary and socially important.'),
(20, 20, 'Emotionally devastating and beautifully shot.'),
(21, 21, 'Epic in every sense of the word.'),
(22, 22, 'A visionary film ahead of its time.'),
(23, 23, 'Quiet, poetic and profoundly moving.'),
(24, 24, 'Twisty and seductive. Park Chan-wook is a genius.');

-- WATCHLIST
INSERT INTO WATCHLIST (user_id, movie_id) VALUES
(1, 2), (2, 3), (3, 4), (4, 5),
(5, 6), (6, 7), (7, 8), (8, 9),
(9, 10), (10, 11), (11, 12), (12, 13),
(13, 14), (14, 15), (15, 16), (16, 17),
(17, 18), (18, 19), (19, 20), (20, 21),
(21, 22), (22, 23), (23, 24), (24, 1);

-- WATCHLOG
INSERT INTO WATCHLOG (user_id, movie_id, watch_date, rewatch) VALUES
(1, 1, '2024-01-10', FALSE), (2, 2, '2024-01-15', FALSE),
(3, 3, '2024-01-20', TRUE),  (4, 4, '2024-02-01', FALSE),
(5, 5, '2024-02-05', FALSE), (6, 6, '2024-02-10', FALSE),
(7, 7, '2024-02-14', TRUE),  (8, 8, '2024-02-20', FALSE),
(9, 9, '2024-03-01', FALSE), (10, 10, '2024-03-05', TRUE),
(11, 11, '2024-03-10', FALSE),(12, 12, '2024-03-15', FALSE),
(13, 13, '2024-03-20', TRUE), (14, 14, '2024-03-25', FALSE),
(15, 15, '2024-04-01', FALSE),(16, 16, '2024-04-05', FALSE),
(17, 17, '2024-04-08', TRUE), (18, 18, '2024-04-10', FALSE),
(19, 19, '2024-04-12', FALSE),(20, 20, '2024-04-14', FALSE),
(21, 21, '2024-04-16', TRUE), (22, 22, '2024-04-18', FALSE),
(23, 23, '2024-04-20', FALSE),(24, 24, '2024-04-22', FALSE);


-- TEST QUERIES TO SEE IF TABLES OUTPUT CORRECTLY --
SELECT * FROM USERS;
SELECT * FROM GENRE;
SELECT * FROM COUNTRY;
SELECT * FROM MOVIE;
SELECT * FROM MOVIE_GENRE;
SELECT * FROM RATING;
SELECT * FROM REVIEW;
SELECT * FROM WATCHLIST;
SELECT * FROM WATCHLOG;

