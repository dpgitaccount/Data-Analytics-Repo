use restaurants;
select * from restaurant;

-- 1. Finding the restaurant_id from the link
select *, substring_index(link, '-', -1) as id from restaurant;

-- 2. Updating the restaurant_id in the original table
drop table if exists rest_1;
create table if not exists rest_1 as
    (select *, substring_index(link, '-', -1) as new_id from restaurant);
select * from rest_1;

-- 3. Clean the name column and update it on the table
drop table if exists rest_2;
create table if not exists rest_2 as
    (select *, lower(trim(name)) as new_name from rest_1);
select * from rest_2;

-- 4. Clean the city &  cuisine column and update it on the table
drop table if exists rest_3;
create table if not exists rest_3 as
    (select new_id, new_name, lower(trim(city)) as cleaned_city, rating, rating_count, lower(trim(cuisine)) as clean_cuisine, cost
    from rest_2);
select * from rest_3;

-- 5. Remove the odd cuisines from the table
-- drop table if exists rest_4;
create table if not exists rest_4 as
    (
         select new_id, new_name, cleaned_city, rating, rating_count, clean_cuisine, cost
         from rest_3
         where clean_cuisine not in ('combo','na','discount offer from garden cafe express kankurgachi', 
								     'svanidhi street food vendor','tex-mex',
								     'special discount from (hotel swagath)',
                                     'free delivery ! limited stocks!'
                                     ));
select * from rest_4;

drop table rest_1,rest_2,rest_3;