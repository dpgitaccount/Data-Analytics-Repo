-- CONSTRAINTS-
SHOW DATABASES;
USE dpdata;

-- 1.NOT NULL-
CREATE TABLE StudentData(
Student_ID INT(6) NOT NULL,
Studnet_Age INT(2) NOT NULL,
Name VARCHAR(20) NOT NULL
);

INSERT INTO StudentData VALUES('01','25','Divya Prakash');
SELECT * FROM StudentData;

-- 2.UNIQUE -
CREATE TABLE StudentData(
Student_ID INT(6) NOT NULL unique,
Studnet_Age INT(2) NOT NULL,
Name VARCHAR(20) NOT NULL
);

INSERT INTO StudentData VALUES('01','25','Divya Prakash');
SELECT * FROM StudentData;

-- 3.PRIMARY KEY And Forign Key-

CREATE TABLE Costumer(
ID INT(6) NOT NULL unique,
Name VARCHAR(20) NOT NULL,
Address VARCHAR(20) NOT NULL,
PRIMARY KEY(ID)
);

CREATE TABLE Orders(
Order_ID INT(6) NOT NULL unique,
Parcel_Name VARCHAR(30) NOT NULL,
ID INT(6) NOT NULL unique,
primary key(ID),
foreign key(ID) references Costumer(ID));


-- 4.CHECK-
CREATE TABLE SD(
Student_ID INT(6) NOT NULL unique,
Student_Age INT(2) NOT NULL check(Student_Age > 18),
Name VARCHAR(20) NOT NULL
);

INSERT INTO SD VALUES('01','25','Divya Prakash');
SELECT * FROM SD;

-- DEFAULT-
CREATE TABLE SD(
Student_ID INT(6) NOT NULL unique,
Student_Age INT DEFAULT 18,
Name VARCHAR(20) NOT NULL
);

INSERT INTO SD VALUES('01','25','Divya Prakash');
SELECT * FROM SD;

