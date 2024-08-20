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

*/
### Advanced Tasks:

1. **Top Rated Movies by Viewership:**
    - Create a query that lists the top 10 movies by viewership duration in the last year, along with their average ratings and the total number of unique viewers. Order the results by viewership duration in descending order.
2. **User Retention Analysis:**
    - Determine the average number of movies viewed per month by users in each subscription type. Identify any significant differences in engagement across the different subscription types over the last year.
3. **Content Optimization:**
    - For each genre, identify the movie with the highest average rating and the longest viewership duration. Combine this data to recommend which genres the streaming service should focus on acquiring more content for.
4. **Correlating Ratings and Viewership:**
    - Analyze if there is a correlation between user ratings and viewership duration. Provide a summary table that shows the average viewership duration for movies grouped by their rating (e.g., 0-2, 2-4, 4-6, 6-8, 8-10).
5. **User Clustering by Viewing Habits:**
    - Identify clusters of users based on their most-viewed genres and average viewership duration. Provide a summary that includes the number of users in each cluster and the average number of movies watched.
6. **Subscription Upgrade Impact:**
    - Analyze the impact of upgrading “Basic” subscription users to “Standard.” Compare the average viewership duration and the number of movies viewed before and after the upgrade for these users.
/*
--Answer 1
SELECT m.title, SUM(v.duration) AS total_viewership_duration, AVG(m.rating) AS average_rating, COUNT(DISTINCT v.user_id) AS unique_viewers
FROM Movies m
JOIN Viewership v ON m.movie_id = v.movie_id
GROUP BY m.title
ORDER BY total_viewership_duration DESC
LIMIT 10;

--Answer 2
흑 너무 어려워용ㅠ
SELECT avg(m.movie_id), u.subscription_type
FROM Viewership v
Join Movies m on m.movie_id = v.movie_id
JOIN Users u on u.user_id=v.user_id
Group by m.movie_id;

--Answer 3






























