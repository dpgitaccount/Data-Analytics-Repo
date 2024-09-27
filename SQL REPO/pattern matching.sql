use gfgdata;

select * from data;

-- Find the products where the product name ends with 's'
SELECT * FROM data WHERE product_name LIKE'%s'; # Gives the data with last letter s.
SELECT * FROM data WHERE product_name LIKE's%'; # Gives the data with fisrt letter s.

-- Find the products where the brand name contains 'ad'
SELECT * FROM data WHERE brand_name LIKE'%ad%'; 

-- Finds the products where brand name starts with 'p' and ends with 's'
SELECT * FROM data WHERE brand_name LIKE 'p%s';

-- Finds the products where the product name contains with 'sho'
SELECT * FROM data WHERE product_name LIKE '%sho%';

-- Find the products where the brands name is exactly of 6 characters log
SELECT * FROM data Where brand_name LIKE '______';

-- Fnds the products where the second character of the brand name is 's'
SELECT * FROM data WHERE brand_name LIKE '_s%';

-- Fnds the products where the second character of the brand name is 's' and fourth is 'a'
SELECT * FROM data WHERE brand_name LIKE '_s_a%';

-- Mathing using REGEX methods-
SELECT * FROM data WHERE brand_name REGEXP '^b';






