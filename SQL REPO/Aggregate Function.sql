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
       (9, 'Kapil Sharma', 'Comedian', 5000000, '2012-06-20', 'Comedian', 'greatkapil@gmail.com'),
	   (10, 'Raju Sharma', 'Doctor', 400000, '2015-06-23', 'Medical',NULL),
	   (10, 'Sidhartha Das', 'Doctor', 500000, '2021-06-24', 'Medical',NULL),
	   (10, 'Gaurav Kumar', 'Engineer', 15000, '2024-06-23', 'IT',NULL);



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

# Ascending and Descending- 
SELECT * FROM Emprecords 
ORDER BY JoiningDate asc;
#ORDER BY JoiningDate DESC;

SELECT Empname, JoiningDate, Department
FROM Emprecords
ORDER BY JoiningDate DESC, Department ASC;

SELECT Department, count(*) AS EmplyeeCount
FROM Emprecords
GROUP BY Department; 

SELECT Department, count(*) AS EmplyeeCount
FROM Emprecords
GROUP BY Department
HAVING COUNT(*) > 2;



#                                                  'NULL VALUES'

SELECT * FROM Emprecords ORDER BY Email;

## IS NULL
SELECT * FROM Emprecords WHERE Email IS NULL;

## IS NOT NULL
SELECT * FROM Emprecords WHERE Email IS NOT NULL;

## GROUP BY AND HAVING WITH NULL VALUES-
SELECT Email, COUNT(*) AS EmployeeCount
FROM Emprecords
WHERE Email IS NOT NULL 
GROUP BY Email;

## HAVING WITH NULL VALUE
SELECT Email, COUNT(*) AS EmployeeCount
FROM Emprecords
WHERE Email IS NOT NULL 
GROUP BY Email HAVING (Email) > 2;

## UPDATE WITH NULL VALUE 
UPDATE Emprecords SET Email = 'sd@234gmail.com' WHERE Email IS NULL;


#                                    'DATE AND TIME FUNCTION'

SELECT EmpName, YEAR(JoiningDate) AS JoiningYear, MONTH(JoiningDate) AS JoinMonth
FROM emprecords;

# DATE FORMATING- finding year date and month
SELECT EmpName, DATE_FORMAT(JoiningDate, '%d/%m/%y') AS FormatedJoiningDate
FROM emprecords;

# DATE CALCULATION 
SELECT EmpName, DATEDIFF(CURDATE(),JoiningDate) AS TotalWorkDaysWithCompany
FROM Emprecords
WHERE DATEDIFF(CURDATE(), JoiningDate) > 30; 

# CURRENT DATE AND TIME
SELECT current_date(), current_time(),current_timestamp() FROM Emprecords;

# FINDING OF YEAR AND DATE
SELECT YEAR(JoiningDate), MONTH(JoiningDate), DAY(JoiningDate) FROM Emprecords;

# DATE_ADD
SELECT DATE_ADD(JoiningDate, INTERVAL 7 DAY) FROM Emprecords;

# DATEDIFF FUNCTION -
#SELECT DATEDIFF(endDate, StartDate) FROM Emprecords LIMIT 0, 365;


#                                      'CASE EXPRESSIONS'

SELECT EmpName, Salary,
    CASE 
        WHEN Salary IS NULL THEN 'Unknown_Salary'
        WHEN Salary < 30000 THEN 'LOW_Salary'
        WHEN Salary >= 30000 AND Salary < 50000 THEN 'Medium_Salary'
        ELSE 'High_Salary'
	END AS SalaryRange
FROM Emprecords;


SELECT EmpName, JobTitle, Salary,
    CASE JobTitle
        WHEN 'Batsman' THEN Salary * 0.8
        WHEN 'DataAnalyst' THEN Salary * 0.1
        WHEN 'Teacher' THEN Salary * 0.1
        WHEN 'SalesOfficer' THEN Salary * 0.1
        ELSE Salary * 0.5
	END AS BonusAmount
FROM Emprecords;


SELECT EmpName, DATEDIFF(CURDATE(), JoiningDate) AS DaysWithCompany,
    CASE 
        WHEN DATEDIFF(CURDATE(), JoiningDate) > 400 THEN 'SENIOR'
        WHEN DATEDIFF(CURDATE(), JoiningDate) > 200 THEN 'MIDSENIOR'
        WHEN DATEDIFF(CURDATE(), JoiningDate) < 150 THEN 'FRESHER'
	END AS Experience
FROM Emprecords;
        




