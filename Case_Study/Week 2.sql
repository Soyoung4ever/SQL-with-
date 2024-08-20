*/
### Tasks (MUST-DO):

1. **Data Manipulation:**
    - **Insert a New Movie:** Add a new movie titled "A New Dawn," released in 2023, with a genre of "Drama." Set an initial average rating of 8.2.
2. **Aggregation Functions:**
    - **Total Viewing Hours by Genre:** Calculate the total viewing hours for each genre.
    - **Average Rating by Genre:** Find the average rating for movies in each genre.
3. **Group By and Having Clauses:**
    - **Genres with High Average Rating:** List genres where the average rating of movies is above 7.5.
    - **Genres with High Viewing Hours:** Identify genres where the total viewing hours exceed 5000 minutes.
4. **Join Operations:**
    - **Movies by Genre:** Retrieve a list of genres and the count of movies in each genre.
    - **Average Viewing Duration by User:** Find the average viewing duration for each user.
  /*

--Answer 1 
Insert INTO Movies
VALUES (106, 'A New Dawn', 2023, 3, 8.2);

--Answer 2-1
SELECT g.name AS genre, SUM(v.duration) AS total_viewing_minutes
FROM Viewership v
JOIN Movies m ON v.movie_id = m.movie_id
JOIN Genres g ON m.genre_id = g.genre_id
GROUP BY g.name;

--Answer 2-2
SELECT g.name as genre, avg(m.rating) as average_rating
FROM Moview m
JOIN Genres g on m.genre_id = g.genre_id
GROUP by g.name;

--Answer 3-1
SELECT g.name as genre, avg(m.rating) as average_rating
FROM Movies m
Join Genres g on m.genre_id = g.genre_id
GROUP by g.name
HAVING avg(rating) > 7.5;

--Answer 3-2
SELECT g.name AS genre, SUM(v.duration) AS total_viewing_minutes
FROM Viewership v
JOIN Movies m ON v.movie_id = m.movie_id
JOIN Genres g ON m.genre_id = g.genre_id
GROUP BY g.name
HAVING SUM(v.duration) > 5000;

--Answer 4-1
SELECT g.name as genre, count(m.movie_id) as movie_count
from Movies m
INNER JOIN Genres g on m.genre_id=g.genre_id
GROUP by g.name;

--Answer 4-2
SELECT u.name AS user_name, AVG(v.duration) AS average_viewing_duration
FROM Viewership v
JOIN Users u ON v.user_id = u.user_id
GROUP BY u.name;

