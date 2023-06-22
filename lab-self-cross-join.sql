-- Question 1
select fa1.actor_id, a1.first_name, a1.last_name, fa2.actor_id, a2.first_name, a2.last_name, title  from film_actor fa1
join film_actor fa2 
on fa1.actor_id <> fa2.actor_id
and fa1.film_id = fa2.film_id
join film f
on fa1.film_id = f.film_id
join actor a1
on fa1.actor_id = a1.actor_id
join actor a2
on fa2.actor_id = a2.actor_id
order by fa1.actor_id;

-- Question 2
with pair_rentals as (
select rental_id, inventory_id, film_id, customer_id from rental
join inventory using(inventory_id))
select pr1.film_id, pr1.customer_id, pr2.customer_id, count(*) from pair_rentals pr1
join pair_rentals pr2
on pr1.customer_id < pr2.customer_id
and pr1.film_id = pr2.film_id
group by pr1.film_id, pr1.customer_id, pr2.customer_id
having count(*) > 3;

-- Question 3
create temporary table Actor_id
select distinct actor_id from actor;

create temporary table Film_id
select distinct film_id from film;

select * from Actor_id
cross join film_id;






