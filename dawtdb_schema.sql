CREATE DATABASE IF NOT EXISTS dawt_db_schema;
USE dawt_db_schema;

CREATE TABLE COUNTRY (
    country_id  INT          NOT NULL AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (country_id)
);
 
CREATE TABLE GENRE (
    genre_id   INT         NOT NULL AUTO_INCREMENT,
    genre_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (genre_id)
);
 
CREATE TABLE MOVIE (
    movie_id     INT          NOT NULL AUTO_INCREMENT,
    country_id   INT          NOT NULL,
    title        VARCHAR(255) NOT NULL,
    release_date DATE,
    overview     TEXT,
    runtime      INT,
    PRIMARY KEY (movie_id),
    CONSTRAINT fk_movie_country
        FOREIGN KEY (country_id) REFERENCES COUNTRY (country_id)
);
 
CREATE TABLE MOVIE_GENRE (
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    CONSTRAINT fk_mg_movie
        FOREIGN KEY (movie_id) REFERENCES MOVIE (movie_id),
    CONSTRAINT fk_mg_genre
        FOREIGN KEY (genre_id) REFERENCES GENRE (genre_id)
);
 
CREATE TABLE USER (
    user_id  INT          NOT NULL AUTO_INCREMENT,
    username VARCHAR(50)  NOT NULL,
    email    VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id)
);
 
CREATE TABLE RATING (
    rating_id    INT NOT NULL AUTO_INCREMENT,
    user_id      INT NOT NULL,
    movie_id     INT NOT NULL,
    rating_value DECIMAL(3, 1), 
    PRIMARY KEY (rating_id),
    CONSTRAINT fk_rating_user
        FOREIGN KEY (user_id)  REFERENCES USER  (user_id),
    CONSTRAINT fk_rating_movie
        FOREIGN KEY (movie_id) REFERENCES MOVIE (movie_id)
);
 
CREATE TABLE REVIEW (
    review_id   INT  NOT NULL AUTO_INCREMENT,
    user_id     INT  NOT NULL,
    movie_id    INT  NOT NULL,
    review_text TEXT,
    PRIMARY KEY (review_id),
    CONSTRAINT fk_review_user
        FOREIGN KEY (user_id)  REFERENCES USER  (user_id),
    CONSTRAINT fk_review_movie
        FOREIGN KEY (movie_id) REFERENCES MOVIE (movie_id)
);
 
CREATE TABLE WATCHLOG (
    log_id     INT  NOT NULL AUTO_INCREMENT,
    user_id    INT  NOT NULL,
    movie_id   INT  NOT NULL,
    watch_date DATE,
    rewatch    TINYINT(1) DEFAULT 0, 
    PRIMARY KEY (log_id),
    CONSTRAINT fk_wl_user
        FOREIGN KEY (user_id)  REFERENCES USER  (user_id),
    CONSTRAINT fk_wl_movie
        FOREIGN KEY (movie_id) REFERENCES MOVIE (movie_id)
);
 
CREATE TABLE WATCHLIST (
    watchlist_id INT NOT NULL AUTO_INCREMENT,
    user_id      INT NOT NULL,
    movie_id     INT NOT NULL,
    PRIMARY KEY (watchlist_id),
    CONSTRAINT fk_wlist_user
        FOREIGN KEY (user_id)  REFERENCES USER  (user_id),
    CONSTRAINT fk_wlist_movie
        FOREIGN KEY (movie_id) REFERENCES MOVIE (movie_id)
);