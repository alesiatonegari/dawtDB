-- TRIGGER 1: LOGS A NEW WATCHLOG ENTRY
-- =========================================
CREATE TRIGGER trg_log_new_watchlog_entry
BEFORE INSERT ON WATCHLOG
FOR EACH ROW
SET NEW.watch_date = IF(NEW.watch_date IS NULL, CURDATE(), NEW.watch_date);

-- EX:  
-- Insert a watch record without a date (should auto-fill today):
INSERT INTO WATCHLOG (user_id, movie_id, rewatch)
VALUES (1, 3, 0);

-- Verify watch_date was stamped automatically:
SELECT * FROM WATCHLOG WHERE user_id = 1 AND movie_id = 3;
-- Expected: watch_date = today's date

-- TRIGGER 2: SETS REWATCH FLAG
-- =======================================
CREATE TRIGGER trg_set_rewatch_flag
BEFORE UPDATE ON WATCHLOG
FOR EACH ROW
SET NEW.rewatch = IF(
    OLD.watch_date IS NOT NULL AND NEW.watch_date != OLD.watch_date,
    1,
    NEW.rewatch
);

-- EX:  
-- Check the current state for user 1, movie 1:
SELECT * FROM WATCHLOG WHERE user_id = 1 AND movie_id = 1;
-- Expected: rewatch = 0, watch_date = 2024-01-10

-- Simulate logging a new viewing by changing the date:
UPDATE WATCHLOG
SET watch_date = '2025-03-15'
WHERE user_id = 1 AND movie_id = 1;

-- Verify rewatch was automatically set to 1:
SELECT * FROM WATCHLOG WHERE user_id = 1 AND movie_id = 1;
-- Expected: rewatch = 1, watch_date = 2025-03-15


-- TRIGGER 3: THIS PRESERVES A COPY OF ANY DELETED REVIEWS
-- ========================================================
CREATE TABLE IF NOT EXISTS REVIEW_AUDIT (
    audit_id    INT          PRIMARY KEY AUTO_INCREMENT,
    review_id   INT,
    user_id     INT,
    movie_id    INT,
    review_text TEXT,
    deleted_at  DATETIME     DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER trg_log_deleted_review
AFTER DELETE ON REVIEW
FOR EACH ROW
INSERT INTO REVIEW_AUDIT (review_id, user_id, movie_id, review_text, deleted_at)
VALUES (OLD.review_id, OLD.user_id, OLD.movie_id, OLD.review_text, NOW());

-- EX:  
-- Delete a review:
DELETE FROM REVIEW WHERE review_id = 1;

-- Verify the row is gone from REVIEW:
SELECT * FROM REVIEW WHERE review_id = 1;
-- Expected: empty result set

-- Verify the audit log captured the deleted review:
SELECT * FROM REVIEW_AUDIT WHERE review_id = 1;
-- Expected: user_id=1, movie_id=1, review_text='Mind-blowing...', deleted_at=<timestamp>



-- THIS GETS THE USERS WATCH SUMMARY
-- =================================
DELIMITER $$
CREATE PROCEDURE GetUserWatchSummary(IN p_user_id INT)
BEGIN
    SELECT
        u.username,
        m.title,
        wl.watch_date,
        wl.rewatch,
        r.rating_value
    FROM WATCHLOG wl
    JOIN USERS  u  ON wl.user_id  = u.user_id
    JOIN MOVIE  m  ON wl.movie_id = m.movie_id
    LEFT JOIN RATING r
           ON r.user_id  = wl.user_id
          AND r.movie_id = wl.movie_id
    WHERE wl.user_id = p_user_id
    ORDER BY wl.watch_date DESC;
END$$
DELIMITER ;

-- EX:  
-- Get the watch summary for user 3 (steve):
CALL GetUserWatchSummary(3);
-- Expected: username=steve, title=The Godfather,
--           watch_date=2024-01-20, rewatch=1, rating_value=10


-- CONVERTS NUMERIC RATING INTO A DESCRIPTION
-- ======================================================================
DELIMITER $$
CREATE FUNCTION GetRatingLabel(p_rating DECIMAL(3,1))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE label VARCHAR(20);

    IF    p_rating >= 9  THEN SET label = 'Excellent';
    ELSEIF p_rating >= 7 THEN SET label = 'Good';
    ELSEIF p_rating >= 5 THEN SET label = 'Average';
    ELSEIF p_rating >= 3 THEN SET label = 'Poor';
    ELSE                      SET label = 'Terrible';
    END IF;

    RETURN label;
END$$
DELIMITER ;

-- EX:  
-- Use the function inline to label all ratings:
SELECT
    m.title,
    r.rating_value,
    GetRatingLabel(r.rating_value) AS rating_label
FROM RATING r
JOIN MOVIE m ON r.movie_id = m.movie_id
ORDER BY r.rating_value DESC;
-- Expected: each movie row shows its numeric rating + readable label

