use gfgdata;
SELECT * FROM data;

-- Basic subquery: find the average rating of produts
select avg(rating) as avg_rating from gfgdata.data;

-- subquery in where clause: find the brand names with a rating higher then the average rating
select brand_name from gfgdata.data where rating > (select avg(rating) as avg_rating from gfgdata.data);

-- subquery in select clause: retrieve the product name along with the average rating of product
select product_name, rating,
       (select round(avg(rating)) from gfgdata.data) as avg_rating
from gfgdata.data;

-- subquery with multiple results: find the total rating count of products for each brand compare to the overall average rating
select brand_name, 
     (select sum(rating_count) from gfgdata.data where brand_name = p.brand_name) as total_rating_count
from (select distinct brand_name from gfgdata.data) as p;