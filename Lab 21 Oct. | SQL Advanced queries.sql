-- Lab 21 Oct. | SQL Advanced queries

-- List each pair of actors that have worked together.
select a1.actor_id as actor1, a2.actor_id as actor2 
from sakila.film_actor as a1
join sakila.film_actor as a2 on a2.film_id=a1.film_id 
and a1.actor_id<a2.actor_id
group by a1.actor_id, a2.actor_id ; 

-- For each film, list actor that has acted in more films. -> Tips : Use Rank
select a1.actor_id, 
a1.film_id, 
a3.number, 
row_number() over (partition by a1.film_id order by a3.number desc) as ranking 
from film_actor as a1
join (
select actor_id, count(film_id) as number 
from film_actor as a2
group by actor_id) 
as a3 on a3.actor_id=a1.actor_id ;