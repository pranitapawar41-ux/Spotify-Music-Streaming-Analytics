create  database SpotifyDb;
use SpotifyDB;
CREATE TABLE spotify_songs (
    genre VARCHAR(100),
    artist_name VARCHAR(255),
    track_name VARCHAR(255),
    track_id VARCHAR(100),
    popularity INT,
    acousticness FLOAT,
    danceability FLOAT,
    energy FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    tempo FLOAT,
    valence FLOAT);
-- 1 Most Popular Genre
SELECT
    genre,
    ROUND(AVG(popularity),2) AS avg_popularity
FROM spotify_songs
GROUP BY genre
ORDER BY avg_popularity DESC;

-- A) Number of Songs per Genre
SELECT
    genre,
    COUNT(*) AS total_songs
FROM spotify_songs
GROUP BY genre
ORDER BY total_songs DESC;

-- B) Top 10 Genres
SELECT
    genre,
    AVG(popularity) AS popularity
FROM spotify_songs
GROUP BY genre
ORDER BY popularity DESC
LIMIT 10;

-- 2 Artist Performance Analysis
-- A) Top Artists by Average Popularity
SELECT
    artist_name,
    ROUND(AVG(popularity),2) AS avg_popularity
FROM spotify_songs
GROUP BY artist_name
ORDER BY avg_popularity DESC
LIMIT 20;

-- B) Artists with Most Songs
SELECT
    artist_name,
    COUNT(*) AS total_tracks
FROM spotify_songs
GROUP BY artist_name
ORDER BY total_tracks DESC
LIMIT 20;

-- 3 Listener Trend Anlaysis
-- A) Average Popularity Level
SELECT
    ROUND(AVG(popularity),2) AS avg_popularity
FROM spotify_songs;

-- B) Popularity Distribution
SELECT
CASE
    WHEN popularity >= 80 THEN 'Highly Popular'
    WHEN popularity >= 60 THEN 'Popular'
    WHEN popularity >= 40 THEN 'Moderate'
    ELSE 'Low'
END AS popularity_group,
COUNT(*) AS songs
FROM spotify_songs
GROUP BY popularity_group;
