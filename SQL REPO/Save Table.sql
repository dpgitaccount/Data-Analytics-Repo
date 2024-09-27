USE restaurants;
								## EXPORTING TABLE ##

-- 1.Select all columns from the 'restaurants' table with alias 'r'
select * from restaurant;

-- 2.Create a new table names 'Delhi_restaurants' containing restaurants of Delhi only
drop table if exists Delhi_restaurants;
create table if not exists Delhi_restaurants as select * from restaurant where city = 'Delhi';
select * from Delhi_restaurants;

-- 3.Create a new table named 'city_statistics' containing aggregated statistics for each city
drop table if exists city_stats;
create table if not exists city_stats as 
select city,avg(rating) as avg_rating, count(*) as num_of_restaurants from restaurant group by city;
select * from city_stats;

-- 4.Create a new table named 'expensive_restaurants' containing restaurants with a cost greater than 500
drop table if exists expensive_restaurants;
create table if not exists expensive_restaurants as 
select * from restaurant where cost > 500;
select * from expensive_restaurants;


                                  ## ALIAS ## 
                                  
-- 1.Select all columns from the 'restaurants' table with alias 'r'
select * from restaurant as r;
-- 2.Select the city and the average cost of restaurants in each city using table aliases and aggregate functions
select r.city, avg(r.cost) as 'avg_cost'
from restaurant as r
group by r.city;

-- 3.Select restaurants that have a higher rating than the average rating of all restaurants in the same city using self-referencing query with table aliases
select r.*
from restaurant as r
where r.rating > (select avg(rating) from restaurant where city = r.city);


						## TEMPORARY TABLE ##

-- 1.Creatae your first temporary table
drop table if exists temp_restro;
create temporary table temp_restro as select * from restaurant where city = 'Delhi';
select * from temp_restro;

-- 2.Drop temporary tables if they exist
drop table if exists temp_restro;

-- 3.Create a new temporary table named 'sirsa_restaurants' containing restaurants of Sirsa only
drop table if exists temp_restro_sirsa;
create temporary table temp_restro_sirsa as select * from restaurant where city = 'sirsa';
select * from temp_restro_sirsa;

-- 4.Create a new temporary table named 'city_statistics' containing aggregated statistics for each city
drop table if exists city_stats;
create temporary table city_stats as 
       select city, avg(rating) as avg_rating, count(*) as num_of_restaurants from restaurant group by city;
select * from city_stats;

-- 5.Create a new temporary table named 'expensive_restaurants' containing restaurants with a cost greater than 500
drop table if exists temp_expensive_restro;
create temporary table temp_expensive_restro as 
       select * from restaurant where cost > 500;
select * from temp_expensive_restro;


