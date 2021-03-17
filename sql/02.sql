/*
 * Count the number of movies that contain each type of special feature.
 */
select unnest as special_features, count(film_id) as count from 
(select film_id, unnest(special_features) from film) as t
group by unnest
order by unnest;
