/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */
select t.title from(
	select * from (
		select film_id, title, unnest(special_features) as special_feature from film) as t
where special_feature = 'Behind the Scenes'
) as t
--where unnest = 'Behind the Scenes'
inner join
(select * from
	(select film_id, title, unnest(special_features) as special_feature_2 from film) as b
where special_feature_2 = 'Trailers') as b
--where unnest = 'Trailers
on t.title = b.title
order by title;
