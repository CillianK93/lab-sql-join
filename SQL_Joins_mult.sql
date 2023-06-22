-- Question 1 
select s.store_id, a.address, c.city, co.country from store s
join address a
on s.address_id = a.address_id
join city c
on a.city_id = c.city_id
join country co
on c.country_id = co.country_id;

-- Question 2
select s.store_id, sum(p.amount) from staff s
join payment p
on s.staff_id = p.staff_id
group by s.store_id;

-- Question 3
select c.name, avg(length) from film f
join film_category fc
on f.film_id = fc.film_id
join category c
on fc.category_id = c.category_id
group by c.name;

-- Question 4
select c.name, avg(length) from film f
join film_category fc
on f.film_id = fc.film_id
join category c
on fc.category_id = c.category_id
group by c.name
order by avg(length) desc;

-- Question 5 
select f.title, count(r.rental_id) from film f
join inventory i
on f.film_id = i.film_id
join rental r 
on i.inventory_id = r.inventory_id
group by f.title
order by count(r.rental_id) desc;

-- Question 6
select c.name, sum(p.amount) from category c
join film_category fc 
on fc.category_id = c.category_id
join film f 
on f.film_id = fc.film_id
join inventory i
on i.film_id = f.film_id
join rental r
on r.inventory_id = i.inventory_id
join payment p
on p.customer_id = r.customer_id
group by c.name
order by sum(p.amount) desc
limit 5;

-- Question 7
select f.title from film f
join inventory i 
on i.film_id = f.film_id
where (f.title = 'Academy Dinosaur') and (i.store_id = 1);

