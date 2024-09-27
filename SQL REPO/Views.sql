use restaurants;
select * from restaurant;

-- 1. Create the view
drop view if exists restro;
create View restro as (
       select name,city,rating,rating_count as 'orders',
       cuisine,cost,cost*rating_count as 'revenue' from restaurant);
select * from restro;

-- 2. Create a view for end_user
drop view if exists end_user;
create view end_user as (
         select name, city,rating,rating_count as 'orders',
         cuisine, cost from restaurant);
select* from end_user

-- 3. Create a view of sweet dishes
drop view if exists restro_sweet_dishes;
create view restro_sweet_dishes as (
         select * from restaurant where cuisine in ('Sweets','Desserts','Bakery','Ice_Cream'));
select * from restro_sweet_dishes;

select distinct cuisine from restaurant;
         
-- 4. Create a view of top 100 restaurants
drop view if exists to_100;
create view to_100 as (
         select * from restaurant order by rating_count desc limit 100);
select * from to_100;

-- 5. Create a view of restaurant atleast 100 people visited
drop view if exists least_100;
create view least_100 as (
         select * from restaurant order by rating_count asc limit 100);
select * from least_100;

-- 6. Create a view of top 1000 most expensive restaurants
drop view if exists top_1000_exp;
create view top_1000_exp as (
         select * from restaurant order by cost desc limit 100);
select * from top_1000_exp;

-- 7. Create a view for top-rated restaurants in each city
drop view if exists top_rated_restro_per_city;
create view top_rated_restro_per_city as (
		select * from (
           select*, row_number() over(partition by city order by rating*rating_count desc) as 'rank'
               from restaurant)
		   as ranked_table
		where ranked_table.rank = 1);
	select * from top_rated_restro_per_city;

