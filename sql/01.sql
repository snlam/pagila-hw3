/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 */
select title from
(select film_id, title, rating, unnest(special_features) from film) as temporary
where rating = 'G' and unnest='Trailers'
order by title desc;
