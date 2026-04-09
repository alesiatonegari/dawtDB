USE dawtDB;

-- 1.INSERT SAMPLE DATA INFO

-- USERS --
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

-- COUNTRY --
INSERT INTO COUNTRY (country_name) VALUES
('USA'), ('South Korea'), ('Japan'), ('United Kingdom'),
('France'), ('Germany'), ('Italy'), ('Spain'),
('Australia'), ('Canada'), ('Mexico'), ('India'),
('China'), ('Brazil'), ('Sweden'), ('Denmark'),
('Ireland'), ('New Zealand'), ('Argentina'), ('Thailand'),
('Nigeria'), ('Russia'), ('Portugal'), ('Austria');

-- GENRE --
INSERT INTO GENRE (genre_name) VALUES
('Sci-Fi'), ('Thriller'), ('Drama'), ('Animation'),
('Crime'), ('Horror'), ('Romance'), ('Action'),
('Mystery'), ('Adventure'), ('Fantasy'), ('Comedy'),
('Documentary'), ('Historical'), ('Musical'), ('Western'),
('Sports'), ('War'), ('Biographical'), ('Psychological'),
('Supernatural'), ('Dystopian'), ('Coming-of-Age'), ('Dark Comedy');

-- MOVIE --
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

-- MOVIE_GENRE --

-- RATING --

-- REVIEW --

-- WATCHLIST --

-- WATCHLOG --



SELECT * FROM USERS;
SELECT * FROM GENRE;
SELECT * FROM COUNTRY;
SELECT * FROM MOVIE;


DELETE FROM MOVIE
WHERE movie_id > 0;

ALTER TABLE MOVIE AUTO_INCREMENT = 1;

