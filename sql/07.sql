/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSEL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

select first_name || ' ' || last_name as "Actor Name" from actor
inner join film_actor using (actor_id)
inner join (
	select film_id from film_actor
	where actor_id in (
		select distinct actor_id from (
			select actor_id from actor
			inner join film_actor using (actor_id)
			inner join (
				select film_id from film_actor
				where actor_id = 112
			) AS BacallFilms1 using (film_id)
			where actor_id != 112
	) as BacallActors2 )
) as BacallFilms2 using (film_id)

where actor_id not in ( -- finding Bacall 1's to exclude
	select distinct actor_id from (
		select actor_id from actor
		inner join film_actor using (actor_id)
		inner join (
			select film_id from film_actor
			where actor_id = 112
		) as BacallFilms1 using (film_id)
		where actor_id != 112
	) as distinctBacall1	) and actor_id !=112
group by "Actor Name"
order by "Actor Name";
