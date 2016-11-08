/* 1. Select all columns and rows from the movies table */

SELECT *
FROM movies;


/* 2. Select only the title and id of the first 10 rows */

SELECT title, movieid
FROM movies
WHERE movieid <= '10';

/* 3. Find the movie with the id of 485 */

SELECT title, movieid
FROM movies
WHERE movieid = '485';

/* 4. Find the id (only that column) of the movie Made in America (1993) */

SELECT movieid
FROM movies
WHERE title = 'Made in America (1993)';

/* 5. Find the first 10 sorted alphabetically */

SELECT title, movieid
FROM movies
WHERE movieid <= '10'
ORDER BY title ASC;

/* 6. Find all movies from 2002 */

SELECT title, movieid
FROM movies
WHERE title like '%(2002)%';

/* 7. Find out what year the Godfather came out */

SELECT title, movieid
FROM movies
WHERE title like '%Godfather%';

/* 8. Without using joins find all the comedies */

SELECT title, genres, movieid
FROM movies
WHERE genres like '%Comedy%';

/* 9. Find all comedies in the year 2000 */

SELECT title, genres, movieid
From movies
WHERE genres like '%Comedy%' AND title like '%(2000)%';

/* 10. Find any movies that are about death and are a comedy */

SELECT title, genres, movieid
FROM movies
WHERE genres like '%Comedy%' AND title like '%Death%';

/* 11. Find any movies from either 2001 or 2002 with a title containing super */

SELECT title, movieid
FROM movies
WHERE (title like '%(2001)%' OR title like '%(2002)%') AND title like '%Super%';

/* 12. Find all the ratings for the movie Godfather, show just the title and the rating */

SELECT title, ratings.movieid, rating
From movies
  JOIN ratings ON movies.movieid = ratings.movieid
WHERE movies.title like '%Godfather, The%';

/* 13. Order the previous objective by newest to oldest */

SELECT title, ratings.movieid, rating, timestamp
From movies
  JOIN ratings ON movies.movieid = ratings.movieid
WHERE movies.title like '%Godfather, The%'
ORDER BY timestamp ASC;

/* 14. Find the comedies from 2005 and get the title and imdbid from the links table */

SELECT title, links.imdbid, genres
From movies
  JOIN links ON movies.movieid = links.movieid
WHERE genres like '%Comedy%' AND title like '%(2005)%';

/* 15. Find all movies that have no ratings */

SELECT title, ratings.rating
FROM movies
  LEFT JOIN ratings ON movies.movieid = ratings.movieid
WHERE rating ISNULL;

/* 16. Find all fantasy movies using the many to many join between movies and genres through movie_genre table. */
SELECT m.*
FROM movies m
  JOIN movie_genre mg ON mg.movieid = m.movieid
  JOIN genre g ON g.id = mg.genre_id
WHERE g.genres = 'Fantasy';

/* 17. Use concat and research about internet movie database to produce a valid url from the imdbid */

/* 18. Use concat and research about the movie database to produce a valid url from tmdbid*/

/* 19. Get the ratings for The Usual Suspects and convert the timestamp into a human readable date time */

/* 20. Using SQL normalize the tags in the tags table. Make them lowercased and replace the spaces with -*/

/* 21. The movie_genre table was produced by a sql query that could match a movie to the appropriate rows in genre without the use of the join table. Reproduce that query. */

SELECT *
FROM movies
  JOIN genre ON movies.genres like concat('%', genre.genres, '%')
WHERE movieid = 485;


SELECT *
FROM movies
WHERE title like '%Goblet%';