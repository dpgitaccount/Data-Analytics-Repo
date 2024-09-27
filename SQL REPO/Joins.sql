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

-- JOINS OPERATION --

-- User 2021 and 2022 Inner Join-
select * from users.users_2021 as t_2021;
select * from users.users_2022 as t_2022;

select * from users.users_2021 as t_2021 INNER JOIN users.users_2022 as t_2022 
ON t_2021.UserID = t_2022.UserID;

-- User 2022 and 2023
select * from users.users_2022 as t_2022 INNER JOIN users.users_2023 as t_2023 
ON t_2022.UserID = t_2023.UserID;

-- User 2021 and 2023
select * from users.users_2021 as t_2021 INNER JOIN users.users_2023 as t_2023
ON t_2021.UserID = t_2023.UserID;

-- User 2022,2022 and 2023
select * from users.users_2021 as t_2021 INNER JOIN users.users_2022 as t_2022 
ON t_2021.UserID = t_2022.UserID INNER JOIN users.users_2023 as t_2023 ON t_2023.UserID = t_2021.UserID;

-- Left Join on User 2021 and 2022
select * from users.users_2021 as t_2021 LEFT JOIN users.users_2022 as t_2022
ON t_2021.UserID = t_2022.UserID;

-- User 2022 and 2023
select * from users.users_2022 as t_2022 LEFT JOIN users.users_2023 as t_2023
ON t_2022.UserID = t_2023.UserID;

-- User 2021,2022 and 2023
select * from users.users_2021 as t_2021 LEFT JOIN users.users_2022 as t_2022 
ON t_2021.UserID = t_2022.UserID LEFT JOIN users.users_2023 as t_2023 ON t_2023.UserID = t_2021.UserID;

-- Right Join on User 2021 and 2022
select * from users.users_2021 as t_2021 RIGHT JOIN users.users_2022 as t_2022
ON t_2021.UserID = t_2022.UserID;

-- User 2022 and 2023
select * from users.users_2022 as t_2022 RIGHT JOIN users.users_2023 as t_2023
ON t_2022.UserID = t_2023.UserID;

-- User 2021, 2022 and 2023
select * from users.users_2021 as t_2021 RIGHT JOIN users.users_2022 as t_2022 
ON t_2021.UserID = t_2022.UserID RIGHT JOIN users.users_2023 as t_2023 ON t_2023.UserID = t_2021.UserID;


-- Cross Inner Join on User 2021 and 2022
select * from users.users_2021 as t_2021 LEFT JOIN users.users_2022 as t_2022
ON t_2021.UserID = t_2022.UserID
UNION
select * from users.users_2021 as t_2021 RIGHT JOIN users.users_2022 as t_2022
ON t_2021.UserID = t_2022.UserID;

-- User 2022 and 2023
select * from users.users_2022 as t_2022 LEFT JOIN users.users_2023 as t_2023
ON t_2022.UserID = t_2023.UserID
UNION
select * from users.users_2022 as t_2022 RIGHT JOIN users.users_2023 as t_2023
ON t_2022.UserID = t_2023.UserID;

-- User 2021, 2022 and 2023
select * from users.users_2021 as t_2021 LEFT JOIN users.users_2022 as t_2022 
ON t_2021.UserID = t_2022.UserID LEFT JOIN users.users_2023 as t_2023 ON t_2023.UserID = t_2021.UserID
UNION
select * from users.users_2021 as t_2021 RIGHT JOIN users.users_2022 as t_2022 
ON t_2021.UserID = t_2022.UserID RIGHT JOIN users.users_2023 as t_2023 ON t_2023.UserID = t_2021.UserID;


