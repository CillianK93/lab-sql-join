-- Question 1
with active_users_cte as (
select customer_id, convert(rental_date, date) as Activity_date,
	date_format(convert(rental_date, date), '%m') as Activity_month,
    date_format(convert(rental_date, date), '%y') as Activity_year
    from rental
    )
    Select Activity_year, Activity_month, count(distinct customer_id) as Active_Users
    from active_users_cte
    group by Activity_year, Activity_month;
    
-- Question 2 
with active_users_cte as (
select customer_id, convert(rental_date, date) as Activity_date,
	date_format(convert(rental_date, date), '%m') as Activity_month,
    date_format(convert(rental_date, date), '%y') as Activity_year
    from rental
    ),
    pre_month_cte as (    
    Select Activity_year, Activity_month, count(distinct customer_id) as Active_Users
    from active_users_cte
    group by Activity_year, Activity_month
    )
select Activity_year, Activity_month, Active_Users,
lag(Active_users) over (order by Activity_year, Activity_month) as Last_Month
from pre_month_cte;

-- Question 3
with active_users_cte as (
select customer_id, convert(rental_date, date) as Activity_date,
	date_format(convert(rental_date, date), '%m') as Activity_month,
    date_format(convert(rental_date, date), '%y') as Activity_year
    from rental
    ),
pre_month_cte as (    
    Select Activity_year, Activity_month, count(distinct customer_id) as Active_Users
    from active_users_cte
    group by Activity_year, Activity_month
    ),
active_users_dif as (
	select Activity_year, Activity_month, Active_Users,
	lag(Active_users) over (order by Activity_year, Activity_month) as Last_Month
	from pre_month_cte
    )
select *,
(Active_users - Last_Month) as Difference,
concat(round((active_users - Last_Month)/active_users * 100), '%') as Percent_Difference
from active_users_dif;

-- Question 4
with active_users_cte as (
select customer_id, convert(rental_date, date) as Activity_date,
	date_format(convert(rental_date, date), '%m') as Activity_month,
    date_format(convert(rental_date, date), '%y') as Activity_year
    from rental
    ),
retained_customers as (
select distinct 
	customer_id as Active_id,
    Activity_year,
    Activity_month
from active_users_cte
order by Active_id, Activity_Year, Activity_Month)
select ret1.Active_id, ret1.Activity_Year, ret1.Activity_Month, ret2.Activity_Month as Previous_Month
from retained_customers ret1
join retained_customers ret2
on ret1.activity_Year = ret2.activity_Year
and ret1.Activity_Month = ret2.Activity_Month+1
and ret1.Active_id = ret2.Active_id
order by ret1.Active_id, ret1.Activity_Year, ret1.Activity_Month;

