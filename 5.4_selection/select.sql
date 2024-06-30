-- Задание 2

-- 2.1 Название и продолжительность самого длительного трека.

  SELECT name, duration
    FROM track
ORDER BY duration DESC
   LIMIT 1;

-- 2.2 Название треков, продолжительность которых не менее 3,5 минут.
	  
SELECT name, duration
  FROM track
 WHERE duration / 60 >= 3.5;

-- 2.3 Названия сборников, вышедших в период с 2018 по 2020 год включительно.

SELECT name
  FROM collection
 WHERE release BETWEEN 2018 AND 2020;

-- 2.4 Исполнители, чьё имя состоит из одного слова.

SELECT name
  FROM singer
 WHERE name NOT LIKE '% %';

-- 2.5 Название треков, которые содержат слово «мой» или «my».

SELECT name
  FROM track
 WHERE LOWER(name) LIKE '%мой%' OR LOWER(name) LIKE '%my%';

-- Задание 3

-- 3.1 Количество исполнителей в каждом жанре.

  SELECT g.name, COUNT(gs.singer_id) 
    FROM genre g
    JOIN genre_singer gs ON g.id = gs.genre_id
GROUP BY g.name;

-- 3.2 Количество треков, вошедших в альбомы 2019–2020 годов.

SELECT COUNT(t.album_id)
  FROM album a
  JOIN track t ON a.id = t.album_id
 WHERE a.release BETWEEN 2019 AND 2020;

-- 3.3 Средняя продолжительность треков по каждому альбому.

  SELECT a.name, ROUND(AVG(t.duration) / 60, 2)
    FROM album a
    JOIN track t ON a.id = t.album_id
GROUP BY a.name;

-- 3.4 Все исполнители, которые не выпустили альбомы в 2020 году.

SELECT name
  FROM singer
 WHERE id NOT IN
	(SELECT s.id
	FROM singer		AS s
	JOIN singer_album	AS sa	ON sa.singer_id = s.id
  	JOIN album		AS a	ON sa.album_id = a.id
	WHERE a.release = 2020);
/*
SELECT DISTINCT s.name
  FROM singer 		AS s
  JOIN singer_album 	AS sa	ON sa.singer_id = s.id
  JOIN album 		AS a 	ON sa.album_id = a.id
EXCEPT SELECT DISTINCT s.name
  FROM singer 		AS s
  JOIN singer_album 	AS sa	ON sa.singer_id = s.id
  JOIN album 		AS a 	ON sa.album_id = a.id
 WHERE a.release IN (2020);
*/

-- 3.5 Названия сборников, в которых присутствует конкретный исполнитель.

SELECT DISTINCT c.name
  FROM collection c
  JOIN track_collection	AS tc	ON c.id = tc.collection_id
  JOIN track		AS t	ON tc.track_id = t.id
  JOIN album		AS a	ON t.album_id = a.id
  JOIN singer_album	AS sa	ON a.id = sa.album_id
  JOIN singer 		AS s	ON sa.singer_id = s.id
 WHERE s.name = 'Singer 4';
