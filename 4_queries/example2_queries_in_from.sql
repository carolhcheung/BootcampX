CREATE TABLE drs_favorites
    (id INTEGER PRIMARY KEY,
    type TEXT,
    reason TEXT);

INSERT INTO drs_favorites(type, reason) VALUES ("biking", "Improves endurance and flexibility.");
INSERT INTO drs_favorites(type, reason) VALUES ("hiking", "Increases cardiovascular health.");

SELECT type FROM drs_favorites; --sees all the dr recommended activities

--SELECT * FROM exercise_logs WHERE type IN ("biking", "hiking"); --if add to list, this query will be outdated

SELECT * FROM exercise_logs WHERE type IN (
    SELECT type FROM drs_favorites);  --this wont go out of date, will change according to drs_favourites

SELECT * FROM exercise_logs WHERE type IN (
    SELECT type FROM drs_favorites WHERE reason LIKE "%cardiovascular%");--can even add on more..