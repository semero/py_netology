-- Database: music_service

-- DROP DATABASE music_service;

-- CREATE DATABASE music_service;

CREATE TABLE genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE singer (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE genre_singer (
	genre_id INTEGER NOT NULL REFERENCES genre(id),
	singer_id INTEGER NOT NULL REFERENCES singer(id),
	CONSTRAINT genre_singer_pk PRIMARY KEY (genre_id, singer_id)
);

CREATE TABLE album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	release INTEGER
	
	CHECK (
		release > 0 AND
		release <= EXTRACT('Year' FROM CURRENT_DATE)
	)
);

CREATE TABLE singer_album (
	singer_id INTEGER NOT NULL REFERENCES singer(id),
	album_id INTEGER NOT NULL REFERENCES album(id),
	CONSTRAINT singer_album_pk PRIMARY KEY (singer_id, album_id)
);

CREATE TABLE track (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES album(id),
	name VARCHAR(30) NOT NULL,
	duration INTEGER CHECK (duration > 0)
);

CREATE TABLE collection (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	release INTEGER

	CHECK (
		release > 0 AND
		release <= EXTRACT('Year' FROM CURRENT_DATE)
	)
);

CREATE TABLE track_collection (
	id SERIAL PRIMARY KEY,
	track_id INTEGER NOT NULL REFERENCES track(id),
	collection_id INTEGER NOT NULL REFERENCES collection(id)
);