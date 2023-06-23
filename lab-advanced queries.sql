-- Question 1

with same_actor as (
	select a.actor_id, a.first_name, a.last_name, fa.film_id from actor a
	join film_actor fa
	on a.actor_id = fa.actor_id
	)
    
select actor1.actor_id as Actor_id1, actor1.first_name, actor1.last_name, actor2.actor_id as Actor_id2,
actor2.first_name, actor2.last_name, actor1.film_id from same_actor actor1
join same_actor actor2
on actor1.film_id = actor2.film_id
and actor1.actor_id > actor2.actor_id
order by actor1.actor_id;

select actor_id, count(film_id) as Films_acted from film_actor
group by actor_id;

select actor_id, count(film_id) from film_actor
group by actor_id;


-- Question 2
with actors_acted as (
    select actor_id, count(film_id) as Films_acted
    from film_actor
    group by actor_id
),
Max_Films as (
    select actor_id, max(Films_acted) as Number_of_Films
    from actors_acted
    group by actor_id
),
Max_Film_Actors as (
    select fa.film_id, MAX(aa.Films_acted) as Max_Number_of_Films
    from film_actor fa
    join actors_acted aa 
    on aa.actor_id = fa.actor_id
    group by fa.film_id
)
select fa.actor_id, fa.film_id, aa.Films_acted
from film_actor fa
join actors_acted aa on aa.actor_id = fa.actor_id
join  Max_Film_Actors mfa 
on mfa.film_id = fa.film_id 
and mfa.Max_Number_of_Films = aa.Films_acted
order by fa.film_id;



	
   
    
    
    
    
    
    
    

    
    
    
    
 
    








    
  