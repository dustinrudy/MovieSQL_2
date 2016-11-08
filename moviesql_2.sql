/* 1. Get the average rating for a movie */

SELECT movies.movieid, movies.title, avg(ratings.rating)
FROM movies
  JOIN ratings ON movies.movieid = ratings.movieid
WHERE movies.movieid = '40815'
GROUP BY movies.movieid;

/* 2. Get the total ratings for a movie */

SELECT movies.movieid, movies.title, count(ratings.rating)
FROM movies
  JOIN ratings ON movies.movieid = ratings.movieid
WHERE movies.movieid = '40815'
GROUP BY movies.movieid;

/* 3. Get the total movies for a genre */

SELECT movie_genre.genre_id, count(movies.genres)
FROM movies
  JOIN movie_genre ON movies.movieid = movie_genre.movieid
WHERE movie_genre.genre_id = '2'
GROUP BY movie_genre.genre_id;


/* 4. Get the average rating for a user */
SELECT ratings.userid, avg(ratings.rating)
FROM ratings
WHERE ratings.userid = '4'
GROUP BY ratings.userid;

/* 5. Find the user with the most ratings */
SELECT ratings.userid, count(ratings.rating)
FROM ratings
GROUP BY ratings.userid
ORDER BY count DESC
LIMIT 1;


/* 6. Find the user with the highest average rating */
SELECT ratings.userid, count(ratings.rating), avg(ratings.rating)
FROM ratings
GROUP BY ratings.userid
ORDER BY avg DESC
LIMIT 1;

/* 7. Find the user with the highest average rating with more than 50 reviews */
SELECT ratings.userid, count(ratings.rating) as highest, avg(ratings.rating) as average
FROM ratings
GROUP BY ratings.userid
HAVING count(ratings.rating) > 50
ORDER BY highest, average DESC;

/* 8. Find the movies with an average rating over 4 */
SELECT movies.movieid, movies.title, avg(ratings.rating) AS average
FROM ratings
  JOIN movies ON ratings.movieid = movies.movieid
GROUP BY movies.movieid
HAVING avg(ratings.rating) = 4;

/* 9. For each genre find the total number of reviews as well as the average review sort by highest average review. */
SELECT genres, count(ratings.rating) AS reviews, avg(ratings.rating) AS average
FROM ratings
  JOIN movie_genre ON ratings.movieid = movie_genre.movieid
  JOIN genre ON movie_genre.genre_id = genre.id
GROUP BY genre.genres
ORDER BY average DESC;

/* 10. Create a new table called actors (We are going to pretend the actor can only play in one movie) The table should include name, character name, foreign key to movies and date of birth at least plus an id field. */
SELECT title, movieid
FROM movies;
/* 11. Pick 3 movies and create insert statements for 10 actors each. You should use the multi value insert statements */

INSERT INTO actors (name, character_name, date_of_birth, id, movieid)
    VALUES('John Krasinski', 'Jim', 'March 21 1975', 1, 260),
          ('Margaret Thatcher','Mary Poppins','November 21 1901', 2, 260),
      ('Tits McGee', 'Will Ferrell', 'February 1 1999', 3, 260),
      ('Jason Shabo', 'JSON', 'July 4 1776', 4, 260),
      ('Jeff Newman', 'Legolas', 'April 5 1990', 5, 260),
      ('Ryan Lee', 'Ryan', 'September 9 1983', 6, 260),
      ('Tim Lee', 'Shabo', 'May 22 1990', 7, 260),
      ('Mike Sweeney', 'Jedi Lord', 'March 1 1975', 8, 260),
      ('Carrie Fisher', 'Trinity', 'April 8 1999', 9, 260),
      ('Joe Duplantier', 'Joejira', 'March 1 1943', 10, 260);

INSERT INTO actors (name, character_name, date_of_birth, id, movieid)
    VALUES('Jenna Fischer', 'Pam', 'December 25 1971', 11, 275),
          ('Jack Black','Gus','November 1 1955', 12, 275),
      ('Toby Mcguire', 'Spiderman', 'March 10 1980', 13, 275),
      ('Carrie Smidt', 'Tara', 'July 10 1972', 14, 275),
      ('George Clooney', 'Monster Man', 'April 5 1922', 15, 275),
      ('Pharrel Williams', 'Happy Man', 'March 20 1991', 16, 275),
      ('Tom Cruise', 'Rob', 'June 21 1881', 17, 275),
      ('Denzel Washington', 'Darth Vader', 'May 1 1993', 18, 275),
      ('Keanu Reeves', 'Neo', 'February 1 1000', 19, 275),
      ('Jesus Christ', 'Buddha', 'January 1 2000', 20, 275);

INSERT INTO actors (name, character_name, date_of_birth, id, movieid)
    VALUES('BJ Novak', 'Ryan', 'December 22 1977', 21, 300),
          ('Bryan Cranston','Walter White','November 3 1933', 22, 300),
      ('James Franco', 'Luke Skywalker', 'April 10 1988', 23, 300),
      ('Andrew Lincoln', 'Rick', 'October 11 1972', 24, 300),
      ('John Berthanal', 'Shane', 'April 30 1997', 25, 300),
      ('Adam Levine', 'Rock Singer', 'March 20 1777', 26, 300),
      ('Creed Bratton', 'Jens Kidman', 'June 21 1999', 27, 300),
      ('Dustin Rudy', 'Michael', 'November 1 1993', 28, 300),
      ('Daniel Radcliffe', 'Mama Juju', 'February 28 2000', 29, 300),
      ('Emma Watson', 'Goddess', 'January 12 1922', 30, 300);

/* 12. Create a new column in the movie table to hold the MPAA rating. UPDATE 5 different movies to their correct rating */

UPDATE movies
SET mpaa_rating = 'PG-13'
WHERE movieid = 155;

SELECT title, mpaa_rating
FROM movies;