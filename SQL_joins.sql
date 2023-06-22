-- Question 1
select c.name, count(c.name) from film f
join film_category fc
on f.film_id = fc.film_id
join category c
on fc.category_id = c.category_id
group by c.name;

-- Question 2
select s.first_name, s.last_name, a.address from staff s
join address a
on s.address_id = a.address_id;

-- Question 3
select s.staff_id, s.first_name, s.last_name, count(p.amount) from staff s
join payment p
on s.staff_id = p.staff_id
where p.payment_date between '2005-08-01' and '2005-08-31'
group by s.staff_id;

-- Question 4 
select f.title, count(fa.actor_id) from film f
join film_actor fa
on f.film_id = fa.film_id
group by f.title;

-- Question 5
select c.customer_id, c.first_name, c.last_name, sum(p.amount)from payment p 
join customer c
on p.customer_id = c.customer_id
group by c.customer_id
order by c.last_name, sum(p.amount);





