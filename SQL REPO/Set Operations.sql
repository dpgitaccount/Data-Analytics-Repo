USE  gfgdata;
DROP DATABASE IF EXISTS users;
CREATE DATABASE users;

-- Crate Table
CREATE TABLE IF NOT EXISTS users.users_2021 (UserID INT PRIMARY KEY, Name VARCHAR(30));
CREATE TABLE IF NOT EXISTS users.users_2022 (UserID INT PRIMARY KEY, Name VARCHAR(30));
CREATE TABLE IF NOT EXISTS users.users_2023 (UserID INT PRIMARY KEY, Name VARCHAR(30));

-- Insert data
INSERT INTO users.users_2021 (UserID, Name) VALUES (3, 'Divya Prakash'), (5,'Aditya Prakash'), (7, 'Gautam');
INSERT INTO users.users_2022 (UserID, Name) VALUES (10, 'Revanth'), (2,'rozy'), (3, 'Ishan'), (4,'Raghav');
INSERT INTO users.users_2023 (UserID, Name) VALUES (6, 'Virat'), (2,'Rohit'), (3, 'Dhoni'), (4, 'Raina'), (5, 'raunak');

SELECT * FROM users.users_2021;
SELECT * FROM users.users_2022;
SELECT * FROM users.users_2023;

DROP TABLE users.users_2021;
DROP TABLE users.users_2022;
DROP TABLE users.users_2023;

-- UNION | Remove the duplicate
SELECT * FROM users.users_2021 UNION SELECT * FROM users.users_2022;
SELECT * FROM users.users_2021 UNION SELECT * FROM users.users_2023;
SELECT * FROM users.users_2023 UNION SELECT * FROM users.users_2023;
SELECT * FROM users.users_2021 UNION SELECT * FROM users.users_2022 UNION select * from users.users_2023;

-- UNION ALL | Don't remove the duplicate
SELECT * FROM users.users_2021 UNION ALL SELECT * FROM users.users_2022;
SELECT * FROM users.users_2021 UNION ALL SELECT * FROM users.users_2023;
SELECT * FROM users.users_2022 UNION ALL SELECT * FROM users.users_2023;
SELECT * FROM users.users_2021 UNION ALL SELECT * FROM users.users_2022 UNION ALL select * from users.users_2023;
(SELECT * FROM users.users_2021 UNION ALL SELECT * FROM users.users_2022) UNION  select * from users.users_2023;

-- EXCEPT - | shoq all the data of dominating table that is not in another table and Except is not work in MySql to thst instead of that always using Left Join for this
SELECT * FROM users.users_2021 as t_1 LEFT JOIN users.users_2022 as t_2 ON t_1.userID = t_2.userID;
SELECT * FROM users.users_2022 as t_2 LEFT JOIN users.users_2023 as t_3 ON t_2.userID = t_3.userID;
SELECT * FROM users.users_2021 as t_1 LEFT JOIN users.users_2023 as t_3 ON t_1.userID = t_3.userID;

-- INTERSECT | Return the data that are common in both the table and Intersect is work in MySql so that instead of this use inner join.
SELECT * FROM users.users_2021 as t_1 INNER JOIN  users.users_2022 as t_2 ON t_1.userID = t_2.userID;
SELECT * FROM users.users_2022 as t_2 LEFT JOIN users.users_2023 as t_3 ON t_2.userID = t_3.userID;
SELECT * FROM users.users_2021 as t_1 LEFT JOIN users.users_2022 as t_2 ON t_1.userID = t_2.userID;
SELECT * FROM users.users_2021 as t_1 LEFT JOIN users.users_2023 as t_3 ON t_1.userID = t_3.userID;


                                 -- ASSIGNMENT --
-- 1. list the new users added in 2022
SELECT * FROM users.users_2021 as t_1 LEFT JOIN users.users_2022 as t_2
ON t_1.UserId = t_2.UserID;

-- 2. list the new users added in 2023
SELECT * FROM users.users_2022 as t_2 LEFT JOIN users.users_2023 as t_3
ON t_2.UserId = t_3.UserID;

-- 3. list the users who left us
select * from users.users_2021 EXCEPT select * from users.users_2022 EXCEPT select users.users_2023;

-- 4. list all the users that are there throuhout the data base for year 2021 & 2022
select * from users.users_2022 UNION select * from users.users_2021;

-- 5. list all the users that are there throughout the database
select * from users.users_2021 UNION select * from users.users_2022 UNION select * from users.users_2023;

-- 6. list the users that are there with us from last 3 years
select * from users.users_2021 INTERSECT select * from users.users_2022 INTERSECT select * from users.users_2023;

-- 7. list the all users except that users who are there with us from 3 years
select * from users.users_2022 UNION select * from users.users_2021
EXCEPT
select * from users.users_2021 INTERSECT select * from users.users_2022 INTERSECT select * from users.users_2023;

-- 8. operators with join
select * from users.users_2021 as t_2021 LEFT JOIN users.users_2022 as t_2022
ON t_2021.UserID = t_2022.UserID
UNION
select * from users.users_2021 as t_2021 RIGHT JOIN users.users_2022 as t_2022
ON t_2021.UserID = t_2022.UserID;




