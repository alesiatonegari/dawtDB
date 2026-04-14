-- Run this entire file as-is and everything should insert fine.
-- If there are inaccuracies in the data for any reason, run the section of code below in isolation,
-- then run the insert statements again.

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE WATCHLIST;
TRUNCATE TABLE REVIEW;
TRUNCATE TABLE RATING;
TRUNCATE TABLE WATCHLOG;
TRUNCATE TABLE MOVIE_GENRE;
TRUNCATE TABLE MOVIE;
TRUNCATE TABLE COUNTRY;
TRUNCATE TABLE GENRE;
TRUNCATE TABLE USERS;
SET FOREIGN_KEY_CHECKS = 1;

---------------------------------

INSERT INTO `USERS` (user_id, username, email) VALUES
(1, 'LeonSKennedy', 'rookie_cop@raccooncity.gov'),
(2, 'JillValentine', 'master_of_unlocking@stars.com'),
(3, 'ChrisRedfield', 'boulder_puncher@bsaa.org'),
(4, 'AlbertWesker', 'complete_global_saturation@umbrella.com'),
(5, 'ClaireRedfield', 'looking_for_chris@terrasave.org'),
(6, 'AdaWong', 'spy_in_red@unknown.com'),
(7, 'PeterParker', 'friendly_neighbor@dailybugle.com'),
(8, 'VictorVonDoom', 'richards_is_inferior@latveria.gov'),
(9, 'ReedRichards', 'mr_fantastic@baxterbuilding.com'),
(10, 'SteveRogers', 'man_out_of_time@avengers.com'),
(11, 'TonyStark', 'genius_billionaire@starkintl.com'),
(12, 'BruceBanner', 'dont_make_me_angry@gamma.edu'),
(13, 'LoganHowlett', 'best_at_what_i_do@xavier.edu'),
(14, 'WandaMaximoff', 'chaos_magic@westview.net'),
(15, 'NatashaRomanoff', 'red_in_ledger@shield.gov'),
(16, 'MattMurdock', 'blind_justice@nelsonandmurdock.law'),
(17, 'FinnMertens', 'the_human@ooo.land'),
(18, 'SimonPetrikov', 'ice_king@icekingdom.ooo'),
(19, 'BonnibelBubblegum', 'princess_science@candykingdom.ooo'),
(20, 'MarcelineAbadeer', 'vampire_queen@cave.ooo'),
(21, 'JakeTheDog', 'magical_mutt@ooo.land'),
(22, 'BMO', 'video_game_pal@ooo.land'),
(23, 'MordecaiBird', 'slack_off@thepark.net'),
(24, 'RigbyRaccoon', 'hambonning@thepark.net');

INSERT INTO GENRE (genre_name) VALUES
('Sci-Fi'), ('Thriller'), ('Drama'), ('Animation'),
('Crime'), ('Horror'), ('Romance'), ('Action'),
('Mystery'), ('Adventure'), ('Fantasy'), ('Comedy'),
('Documentary'), ('Historical'), ('Musical'), ('Western'),
('Sports'), ('War'), ('Biographical'), ('Psychological'),
('Supernatural'), ('Dystopian'), ('Coming-of-Age'), ('Dark Comedy');

INSERT INTO `COUNTRY` (country_id, country_name) VALUES
(1, 'USA'), (2, 'South Korea'), (3, 'Japan'), (4, 'UK'), (5, 'France'),
(6, 'Germany'), (7, 'Italy'), (8, 'Mexico'), (9, 'Australia'), (10, 'Canada'),
(11, 'Spain'), (12, 'India'), (13, 'Brazil'), (14, 'South Africa'), (15, 'New Zealand'),
(16, 'Egypt'), (17, 'Thailand'), (18, 'Sweden'), (19, 'Ireland'), (20, 'Norway'),
(21, 'Denmark'), (22, 'Netherlands'), (23, 'Argentina'), (24, 'Greece');

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
(8, 'Pan''s Labyrinth', '2006-10-11', 'A girl escapes into a dark fantasy world.', 118),
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

INSERT INTO MOVIE_GENRE (movie_id, genre_id) VALUES
(1, 1), (1, 2), (2, 2), (2, 3), (3, 3), (3, 5), (4, 4), (4, 11),
(5, 1), (5, 3), (6, 6), (6, 2), (7, 7), (7, 3), (8, 8), (8, 2),
(9, 4), (9, 7), (10, 9), (10, 20), (11, 8), (11, 2), (12, 3), (12, 23),
(13, 5), (13, 24), (14, 11), (14, 6), (15, 8), (15, 22), (16, 14), (16, 10),
(17, 4), (17, 1), (18, 3), (18, 5), (19, 6), (19, 9), (20, 7), (20, 3),
(21, 17), (21, 14), (22, 1), (22, 22), (23, 3), (23, 23), (24, 9), (24, 2);

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

INSERT INTO RATING (user_id, movie_id, rating_value) VALUES
(1, 1, 9),  (2, 2, 8),  (3, 3, 10),
(4, 4, 8),  (5, 5, 9),  (6, 6, 7),
(7, 7, 10), (8, 8, 9),  (9, 9, 8),
(10, 10, 8),(11, 11, 7), (12, 12, 9),
(13, 13, 10),(14, 14, 8),(15, 15, 8),
(16, 16, 7),(17, 17, 8), (18, 18, 8),
(19, 19, 9),(20, 20, 8), (21, 21, 7),
(22, 22, 10),(23, 23, 9),(24, 24, 10);

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

INSERT INTO WATCHLIST (user_id, movie_id) VALUES
(1, 2), (2, 3), (3, 4), (4, 5),
(5, 6), (6, 7), (7, 8), (8, 9),
(9, 10), (10, 11), (11, 12), (12, 13),
(13, 14), (14, 15), (15, 16), (16, 17),
(17, 18), (18, 19), (19, 20), (20, 21),
(21, 22), (22, 23), (23, 24), (24, 1);
