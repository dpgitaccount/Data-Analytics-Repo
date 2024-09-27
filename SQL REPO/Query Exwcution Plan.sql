DROP TABLE IF EXISTS messy_indian_dataset;
CREATE TABLE IF NOT EXISTS messy_indian_dataset (
    id INT,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    purchase_amount DECIMAL(10, 2),
    purchase_date DATE
);

-- Insert messy data into the table for Indian users
INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
(1, 'Rajesh Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05'),
(2, 'Priya Sharma', 25, 'Female', 'priya@example.com', '9876543211', 'Delhi', 'Delhi', NULL, '2023-02-15'),
(3, 'Amit Kumar', 35, 'Male', 'amit@example.com', '9876543212', 'Bangalore', 'Karnataka', 750.25, '2023-03-25'),
(4, 'Ritu Singh', 28, 'Female', NULL, '9876543213', 'Kolkata', 'West Bengal', 1200.75, '2023-04-10'),
(5, 'Rajesh Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05'),
(6, 'Priya Sharma', 25, 'Female', 'priya@example.com', '9876543211', 'Delhi', 'Delhi', 800.00, '2023-02-15'),
(7, 'Amit Kumar', NULL, 'Male', 'amit@example.com', NULL, 'Bangalore', 'Karnataka', 750.25, '2023-03-25'),
(8, 'Ritu Singh', 28, 'Female', 'ritu@example.com', '9876543213', 'Kolkata', 'West Bengal', 1200.75, '2023-04-10'),
(9, 'Ankit Tiwari', 32, 'Male', 'ankit@example.com', '9876543214', 'Lucknow', 'Uttar Pradesh', 900.00, '2023-05-20'),
(10, 'Swati Gupta', 27, 'Female', 'swati@example.com', '9876543215', 'Jaipur', 'Rajasthan', 1500.00, NULL);

SELECT * FROM messy_indian_dataset;

                                      ## Orders of Execution ##
select name, city
          from messy_indian_dataset;
-- execution - 
-- 1. from
-- 2. select
          
select name, city, purchase_amount
    from messy_indian_dataset
        where purchase_amount > 1000;
-- execution - 
-- 1. from
-- 2. where
-- 3. select
        
SELECT name, city, purchase_amount
	FROM messy_indian_dataset
		WHERE purchase_amount > 1000
			ORDER BY purchase_amount DESC;

-- execution - 
-- 1. from
-- 2. where
-- 3. select
-- 4. order by

SELECT city, AVG(purchase_amount) AS avg_purchase
	FROM messy_indian_dataset
		GROUP BY city;
        
-- execution - 
-- 1. from
-- 2. group by
-- 3. select

SELECT city, AVG(purchase_amount) AS avg_purchase
	FROM messy_indian_dataset
		GROUP BY city
			HAVING AVG(purchase_amount) > 1000;
-- execution - 
-- 1. from
-- 2. group by
-- 3. having
-- 4. select


DROP TABLE states;
CREATE TABLE states ( state VARCHAR(50), region VARCHAR(50) );
INSERT INTO states (state, region) VALUES 	('Maharashtra', 'West'), ('Delhi', 'North'), ('Karnataka', 'South'), 
											('West Bengal', 'East'), ('Rajasthan', 'West');
SELECT m.name, m.city, s.region
	FROM messy_indian_dataset m
		JOIN states s ON m.state = s.state;
-- execution - 
-- 1. from
-- 2. join
-- 3. select

SELECT name, city, purchase_amount
	FROM messy_indian_dataset
		WHERE purchase_amount > (SELECT AVG(purchase_amount) FROM messy_indian_dataset);
-- execution - 
-- 1. subquery(from)
-- 2. subquery(Select)
-- 3. from
-- 4. where
-- 5. select


-- Order of Execution
-- 1. FROM: Determines the source tables and joins if any.
-- 2. WHERE: Applies row filtering.
-- 3. GROUP BY: Groups rows by specified columns.
-- 4. HAVING: Applies group filtering.
-- 5. SELECT: Determines which columns to include in the final result set.
-- 6. ORDER BY: Sorts the result set.
-- 7. LIMIT: Restricts the number of rows in the result set.