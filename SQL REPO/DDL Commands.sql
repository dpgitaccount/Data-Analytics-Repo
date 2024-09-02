SHOW DATABASES;
USE dpdata;

-- DDL Commands -
-- 1.CREATE FUNCTION-
CREATE TABLE Student(
Roll_no INT,
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Age INT,
Marks INT 
);

-- 2.ALTER FUNCTION - 
ALTER TABLE Student ADD Mother_Name VARCHAR(50);
ALTER TABLE Student ADD Father_Name VARCHAR(50), DROP age;

INSERT INTO Student VALUES ('10', 'Divya', 'Prakash','800', 'Sangita Das', 'RKLD');
INSERT INTO Student VALUES ('11', 'Aditya', 'Prakash','500', 'Sangita Das', 'RKLD');
INSERT INTO Student VALUES ('12', 'Satya', 'Prakash','450', 'Sangita Das', 'RKLD');
INSERT INTO Student VALUES ('13', 'Bhavya', 'Prakash','550', 'Sangita Das', 'RKLD');

SELECT * FROM Student;

-- 3.DROP FUNCTION -
DROP DATABASE sys;
DROP TABLE STUDENT;

-- 4.TRUNCATE FUNCTION - 
TRUNCATE TABLE Student;

-- 5.RENAME FUNCTION -
RENAME TABLE Student TO Student_Details;


