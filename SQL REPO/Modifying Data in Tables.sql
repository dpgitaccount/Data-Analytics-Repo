-- Insert Data

CREATE TABLE myLog(
id INT NOT NULL PRIMARY KEY,
name VARCHAR (20),
login INT(6));

INSERT INTO myLog VALUES('01', 'Prakash', '5');
INSERT INTO myLog VALUES('02', 'Parikh', '4');
INSERT INTO myLog VALUES('03', 'Ravi', '6');
INSERT INTO myLog VALUES('04', 'Dp', '2');

SELECT * FROM myLog;

-- Update Data-
UPDATE myLog SET name = 'Divya' WHERE id = 01;

-- Delete Data-
DELETE FROM myLog WHERE id = 01;

-- Truncate Data- 
TRUNCATE Table myLog;

