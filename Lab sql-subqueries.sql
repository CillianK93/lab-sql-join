-- Question 1
select count(inventory_id) as no_of_copies from inventory
where film_id in (
select film_id from film
where title = 'Hunchback Impossible');

-- Question 2
select title, length from film
where length > (select avg(length) from film)
order by length desc;

-- Question 3
select fa.actor_id ,a.first_name, a.last_name from film_actor fa
join actor a
on fa.actor_id = a.actor_id  
where film_id in 
(select film_id from film 
where title = 'Alone Trip');



-- Question 4
select title from film
where film_id in 
(select film_id from film_category
where category_id in 
(select category_id from category 
where name = 'family'));

-- Question 5 using subqueries
select first_name, last_name, email from customer
where address_id in
(select address_id from address
where city_id in
(select city_id from city
where country_id in
(select country_id from country
where country = 'Canada')));

-- Question 5 using joins.
select c.first_name, c.last_name, c.email,co.country from customer c
join address a using (address_id)
join city using (city_id)
join country co using (country_id)
where country = 'Canada';

-- Question 6
select title from film
where film_id in
(select film_id from film_actor
where actor_id =
(select actor_id from film_actor
group by actor_id
order by count(film_id) desc limit 1));

-- Question 7
 select title from film
 where film_id in 
 (select film_id from inventory
 where inventory_id in
 (select inventory_id from rental
 where customer_id = 
 (select customer_id from payment
 group by customer_id
 order by sum(amount) desc limit 1)));
 
 -- Question 8
 
select customer_id, sum(amount) as total_amount_spent from payment
group by customer_id
having total_amount_spent > (
select avg(total_amount) from (
select customer_id, sum(amount) as total_amount from payment
group by customer_id) co)
order by total_amount_spent desc;







