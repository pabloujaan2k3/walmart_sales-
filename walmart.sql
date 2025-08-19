-- Exploring the dataset cleaned in python.
Use walmart;
SELECT * FROM `walmart.cl`;
select count(*) from `walmart.cl`;

select COUNT(DISTINCT Branch) 
from `walmart.cl`;

select max(quantity) from `walmart.cl`;
select min(quantity) from `walmart.cl`;

-- BUSINESS PROBLEMS 
-- Q1. Find the different payment method and number of transactions, quantity sold.
select distinct payment_method, -- Solution
COUNT(*) as no_of_transctns,
sum(quantity) as quantity_sold
from `walmart.cl`
group by payment_method;

-- Q2.Identify the highest rated category in each branch, displaying the branch, category
-- Avg. Rating 

SELECT Branch, Category , avg_rating 
FROM (
    SELECT 
        Branch,
        category AS Category,
        AVG(rating) AS avg_rating,
        RANK() OVER(PARTITION BY Branch ORDER BY AVG(rating) DESC) AS Ranking
    FROM `walmart.cl`
    GROUP BY Branch, category
) ranked_categories
WHERE Ranking = 1
ORDER BY Branch;

-- Q3. Identify the busiest day for each branch 
-- based on the no. of transactions 
SET SQL_SAFE_UPDATES = 0;
select distinct date from `walmart.cl` limit 10;
alter table `walmart.cl` add column proper_date3 date;
update `walmart.cl`
set proper_date3= str_to_date(date, '%d/%m/%y');
with tbl
as
(select 
	branch,
    dayname((proper_date3)) as day_name,
    count(*) as no_transactions,
     RANK() OVER(PARTITION BY Branch ORDER BY count(*) DESC) AS Ranking
    from `walmart.cl`
    group by branch,
    dayname((proper_date3))
    )
    select * from tbl 
    where Ranking=1;
    
    
-- Q4.Calculate the total quantity of items sold per payment method.
-- List payment_method and total_quantity.
select distinct payment_method, -- Solution
sum(quantity) as quantity_sold
from `walmart.cl`
group by payment_method;

-- Q5.Determine the average, minimum and maximum rating of category
-- for each city. List the city, average_rating, min_rating and max_rating.alter
select 
      city,
      category,
      min(rating) as min_rating,
      max(rating) as max_rating,
      avg(rating) as avg_rating
from `walmart.cl`
group by city, category;

-- Q6. Calculate the total profit for each category by considering 
-- total_profit as (unit_price*quantuty * profit_margin).
-- List the category and total_profit, ordered from highst to lowest profit.
select 
     category,
     sum(Total) as total_revenue,
     sum(Total * profit_margin) as profit,
     rank() over(order by  sum(Total * profit_margin) desc) as ranking
from `walmart.cl` 
group by category;  

-- Q7.  Determine the most common payment method for each branch.
-- Display the branch and the preferred payment method.
with cte
as
(select 
   Branch,
   payment_method,
   count(*) as total_trnsctns,
   rank() over(partition by Branch order by count(*) desc) as Ranking
from `walmart.cl`
group by Branch, payment_method
)
select * from cte
where Ranking =1 ;
-------------------------------------------------
alter table `walmart.cl`
drop column proper_date,
drop column proper_date1,
drop column proper_date2;

-- Q8. Categoriae sales into 3 groups MORNING, AFTERNOON, EVENING.
-- Find out each of the shift and no. of invoices.
-- SOLUTION :-
-- Get detailed records with shift_time
SELECT
    *,
    CASE
        WHEN HOUR(STR_TO_DATE(time, '%H:%i:%s')) < 12 THEN 'Morning'
        WHEN HOUR(STR_TO_DATE(time, '%H:%i:%s')) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift_time,
    TIME(STR_TO_DATE(time, '%H:%i:%s')) AS time_value
FROM `walmart.cl`;

-- Get aggregated data by shift
SELECT
    CASE
        WHEN HOUR(STR_TO_DATE(time, '%H:%i:%s')) < 12 THEN 'Morning'
        WHEN HOUR(STR_TO_DATE(time, '%H:%i:%s')) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift_time,
    Branch,
    COUNT(*) AS total_orders,
    rank() over(partition by Branch order by COUNT(*) desc ) as Ranking
FROM `walmart.cl`
GROUP BY Branch,shift_time
order by Branch, COUNT(*) desc;

-- Q9.Identify 5 branch with highest decrease ratio in  revenue 
-- compared to the last year( current year 2023)
-- rdr=last_rev-cr_rev/ls_rev*100
select *,
(proper_date3) as formated_date
from `walmart.cl`;
-- 2022 Sales
WITH rev_2022 AS (
    SELECT
        Branch,
        SUM(cast(Total as decimal(10,2))) AS revenue
    FROM `walmart.cl`
    WHERE YEAR(proper_date3) = 2022
    GROUP BY Branch
    order by Branch desc
),
 rev_2023 as (
   SELECT
        Branch,
        SUM(cast(Total as decimal(10,2))) AS revenue
    FROM `walmart.cl`
    WHERE YEAR(proper_date3) = 2023
    GROUP BY Branch
    order by Branch 
)
select 
ls.Branch,
ls.revenue as last_year_rev,
cs.revenue as cr_year_rev,
round((ls.revenue - cs.revenue)/ls.revenue *100,2) as ratio_rev_decrease
from rev_2022 as ls 
join 
rev_2023 as cs
on ls.Branch = cs.Branch
where 
	ls.revenue > cs.revenue 
    order by round((ls.revenue - cs.revenue)/ls.revenue *100,2) desc
limit 5;











  


	
    


 

















