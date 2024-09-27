USE restaurants;
SELECT * FROM restaurant;

-- 1. List the top 5 cuisines as per the revenue generated by top 5 restaurants of every cuisine
select cuisine, sum(rating_count*cost) as 'revenue' from 
(    select*, cost*rating_count,
	 ROW_NUMBER() OVER(PARTITION BY cuisine order by cost*rating_count desc) as 'rank'
     from restaurant
) t
where t.rank < 6
GROUP BY cuisine 
ORDER BY revenue desc;

-- 2. What is the of the total revenue is generated by top 1% restaurants
select sum(cost*rating_count) as 'revenue' from 
    (select*, cost*rating_count, row_number() over(order by cost*rating_count) as 'rank'
         from restaurant) t
	where t.rank <= 614;
    
-- 3. Check the same for top 20% restaurants
select sum(cost*rating_count) as 'revenue' from 
    (select*, cost*rating_count, row_number() over(order by cost*rating_count) as 'rank'
         from restaurant) t
	where t.rank <= 12280;

-- 4. What % of revenue is generated by top 20% of restaurants with respect to total revenue?
with 
   q1 as (select sum(cost*rating_count) as 'Top_revenue' from 
    (select*, cost*rating_count, row_number() over(order by cost*rating_count) as 'rank'
         from restaurant) t
	where t.rank <= 12280),
   q2 as (select sum(cost*rating_count) as 'Total_revenue' from restaurant )
select (Top_revenue/Total_revenue)*100 as 'revenue %' from q1,q2;
    