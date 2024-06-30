INSERT INTO genre (name)
VALUES ('Genre 1'), ('Genre 2'), ('Genre 3');

INSERT INTO singer (name)
VALUES ('Singer_1'), ('Singer 2'), ('Singer 3'), ('Singer 4');

INSERT INTO genre_singer (genre_id, singer_id)
VALUES	(1, 1), (1, 2), (1, 3),
	(2, 2), (2, 3),
	(3, 4);

INSERT INTO album (name,release)
VALUES	('Album 1', 2018),
	('Album 2', 2019),
	('Album 3', 2020);

INSERT INTO singer_album (singer_id, album_id)
VALUES	(1, 1), (1, 2), (1, 3),
	(2, 1), (2, 2),
	(3, 2), (3, 3),
	(4, 3);

INSERT INTO track (album_id, name, duration)
VALUES	(1, 'Track 1', 180), (1, 'Track 2', 240),
	(2, 'Track 3', 300), (2, 'Track 4', 360),
	(3, 'Мой Track 5', 240), (3, 'My Track 6', 300);

INSERT INTO collection (name, release)
VALUES	('Collection 1', 2018),
	('Collection 2', 2019),
	('Collection 3', 2020),
	('Collection 4', 2021);

INSERT INTO track_collection (track_id, collection_id)
VALUES	(1, 1), (2, 1),
	(2, 2), (3, 2), (4, 2),
	(3, 3), (4, 3), (5, 3), (6, 3),
	(2, 4), (3, 4), (4, 4), (5, 4), (6, 4);
