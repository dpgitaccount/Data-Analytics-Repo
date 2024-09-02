CREATE DATABASE MYdata;
USE MYdata;
DROP TABLE Emprecords;

CREATE TABLE Emprecords(
EmpID INT NOT NULL,
EmpName VARCHAR(20) NOT NULL,
JobTitle VARCHAR(20) NOT NULL,
Salary DECIMAL(10,2),
JoiningDate DATE,
Department VARCHAR(30),
Email VARCHAR(50));


INSERT INTO Emprecords (EmpID, EmpName, JobTitle, Salary, JoiningDate, Department, Email)  
VALUES (1, 'Divya Prakash', 'DataAnalyst', 50000, '2024-02-10', 'IT', 'divyaprakash299@gmail.com'),
       (2, 'Aditya Prakash', 'Teacher', 45000, '2024-10-10', 'Teaching', 'adi9@gmail.com'),
       (3, 'Satya Prakash', 'Sales Officer', 35000, '2019-04-13', 'Sales', 'satya789@gmail.com'),
       (4, 'Ritesh Ishwar', 'Surveyer', 25000, '2023-05-14', 'Insurance', 'riteshkish@gmail.com'),
       (5, 'Subham Shah', 'Mechanical Engineer', 25000, '2024-10-10', 'production', 'subhamhah9@gmail.com'),
       (6, 'Virat Kohli', 'Batsman', 5000000, '2008-02-10', 'Cricket', 'vk@gmail18.com'),
       (7, 'Rohit Sharma', 'Batsman', 6000000, '2007-03-05', 'Cricket', 'rohitman45@gmail.com'),
       (8, 'MS Dhoni', 'Batman Keeper', 7000000, '2002-11-12', 'Cricket', 'msd7@gmail.com'),
       (9, 'Kapil Sharma', 'Comedian', 5000000, '2012-06-20', 'Comedian', 'greatkapil@gmail.com');
       
SELECT * FROM Emprecords;
SELECT EmpID,Email,JobTitle,Salary,JoiningDate FROM Emprecords;


#COUNT FUNCTION-
SELECT COUNT(*) AS TotalEmpoyeejoined FROM Emprecords WHERE YEAR(JoiningDate) = 2024;

#AGGREGATE WITH GROUPBY FUNCTION-
SELECT JobTitle, COUNT(*) FROM Emprecords GROUP BY JobTitle;

#AGGREGATE WITH HAVING FUNCTION-
SELECT Salary, COUNT(*) FROM Emprecords GROUP BY Salary HAVING COUNT(*) > 1;

SELECT Salary, COUNT(*) 
FROM Emprecords 
GROUP BY Salary;

#SUM FUNCTION -
SELECT SUM(Salary) AS Total_Salary FROM Emprecords WHERE YEAR(JoiningDate) = 2024;
SELECT SUM(Salary) AS Total_Salary FROM Emprecords;

#AVG FUNCTION - 
SELECT AVG(Salary) AS Average_Salary FROM Emprecords WHERE Year(JoiningDate) = 2024;

#MAX AND MIN FUNCTION_
SELECT MAX(Salary) AS Maximum_Salary FROM Emprecords;
SELECT MIN(Salary) AS Minimum_Salary FROM Emprecords;

# NESTED FUCNTION -
SELECT AVG(MAX(Salary)) FROM Emprecords GROUP BY Salary; # DOUBT

# AGGREGATE WITH DISTINCT FUNCTION -
SELECT COUNT(DISTINCT Salary) FROM Emprecords;




