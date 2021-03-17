/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
select distinct first_name || ' ' || last_name as "Actor Name"
from (
	select first_name, last_name, unnest(special_features) as unnested
	from actor
	inner join film_actor using (actor_id)
	inner join film using (film_id) -- get special_features from film
) as t
where unnested='Behind the Scenes';

