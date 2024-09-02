CREATE DATABASE Work;
USE Work;

CREATE TABLE Engineers(
ID INT(4) NOT NULL,
Name VARCHAR(20) NOT NULL,
Salary VARCHAR(20) NOT NULL,
Email VARCHAR(20) NOT NULL );

INSERT INTO Engineers VALUES('01','Divya Prakash','50000','dp299@gmail.com');
INSERT INTO Engineers VALUES('02','Aditya Prakash','55000','aditya342@gmail.com');
INSERT INTO Engineers VALUES('03','Satya','30000','Sp334@gmail.com');
INSERT INTO Engineers VALUES('04','subham shah','25000','skh34@gmail.com');
INSERT INTO Engineers VALUES('05','kamal neupane','15000','kamaln234@gmail.com');
INSERT INTO Engineers VALUES('06','Aryan khanna','40000','ak345@gmail.com');
INSERT INTO Engineers VALUES('07','Rohit','7000000','rohit45@gmail.com');
INSERT INTO Engineers VALUES('08','Dhoni','5000000','dhoni7@gmail.com');
INSERT INTO Engineers VALUES('09','Raghav','24000','raghav9@gmail.com');
INSERT INTO Engineers VALUES('09','Raghav','24000','raghav9@gmail.com');

SELECT * FROM Engineers;
SELECT ID, Salary FROM Engineers;
UPDATE Engineers SET Salary = '75000' WHERE ID = 0708; -- Doubt


SELECT SUM(Salary) FROM Engineers;

-- Distinct Method
SELECT DISTINCT Email FROM Engineers;

-- ALIASING -
SELECT e.Email AS EmailId_of_Employee FROM Engineers as e;

-- Query Logs- 


SELECT  ID, Name FROM Engineers;

-- Alliasing- 
SELECT ID AS EmployeeID, Name AS EmployeeName FROM Engineers;

-- Mathematical Calculations- 
SELECT ID, Salary,(Salary+1000) AS Bonus FROM Engineers;

-- CASE STATEMENTS-
SELECT Name, Salary,
CASE
WHEN Salary > 40000 THEN 'HIGH' WHEN Salary BETWEEN 20000 AND 25000 THEN 'MEDIUM'
ELSE 'LOW'
END AS SalaryRange FROM Engineers;

# CONCATENATE FUNCTION - 
SELECT CONCAT(Name , ' ',Email) AS NAME_and_EMAIL FROM Engineers;


SELECT COUNT(*) FROM Engineers;

# Filtering- 
SELECT * FROM Engineers WHERE Salary > 20000;

# AND OPERATOR-
SELECT * FROM Engineers WHERE Salary BETWEEN 40000 AND 50000;

# OR & BETWEEN Operator-
SELECT * FROM Engineers WHERE Salary BETWEEN 40000 AND 50000 OR Id = 01;

# NOT Operator-
SELECT Name FROM Engineers WHERE NOT (Salary>40000);

# LIKE Operator-
SELECT * FROM Engineers WHERE Name  NOT LIKE '% D';

# IN Operator-
SELECT Name FROM Engineers WHERE Email IN ('Dp299@gmailcom');

SELECT * FROM Engineers WHERE Salary > 30000 AND Email = 'dp299@gmail.com';

# NULL Operator
SELECT * FROM Engineers WHERE Email IS NULL;


SELECT FirstName, LastName FROM Employees WHERE (Age >= 30 AND Department = 'HR') OR (Salary > 60000);

