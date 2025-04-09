-- =====================================================
-- 🎬 Movie Database: Schema + Sample Data
-- =====================================================

-- ===========================
-- 🏗️ Create Tables
-- ===========================

-- Create Directors table
CREATE TABLE directors (
  director_id VARCHAR(15) PRIMARY KEY,
  director_name VARCHAR(30),
  nationality VARCHAR(20)
);

-- Create Movies table
CREATE TABLE movies (
  movie_id VARCHAR(15) PRIMARY KEY,
  title VARCHAR(100),
  release_year INT,
  director_id VARCHAR(15),
  FOREIGN KEY (director_id) REFERENCES directors(director_id) ON DELETE SET NULL
);

-- Create Actors table
CREATE TABLE actors (
  actor_id VARCHAR(15) PRIMARY KEY,
  actor_name VARCHAR(50),
  birth_date DATE
);

-- Create Genres table
CREATE TABLE genres (
  genre_id VARCHAR(15) PRIMARY KEY,
  genre_name VARCHAR(50)
);

-- Create MovieActors table (Many-to-Many)
CREATE TABLE movie_actors (
  movie_id VARCHAR(15),
  actor_id VARCHAR(15),
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE SET NULL,
  FOREIGN KEY (actor_id) REFERENCES actors(actor_id) ON DELETE SET NULL
);

-- Create MovieGenres table (Many-to-Many)
CREATE TABLE movie_genres (
  movie_id VARCHAR(15),
  genre_id VARCHAR(15),
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE SET NULL,
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id) ON DELETE SET NULL
);

-- ===========================
-- 📥 Insert Data
-- ===========================

-- Insert Directors
INSERT INTO directors VALUES ('0001', 'Josh Whedon', 'Caucasian');
INSERT INTO directors VALUES ('0002', 'Catherine Hardwicke', 'Caucasian');
INSERT INTO directors VALUES ('0003', 'Kasi Lemmons', 'African American');

-- Insert Movies
INSERT INTO movies VALUES ('101', 'Avengers', 2012, '0001');
INSERT INTO movies VALUES ('102', 'Twilight', 2008, '0002');
INSERT INTO movies VALUES ('103', 'Harriet', 2019, '0003');

-- Insert Actors
INSERT INTO actors VALUES ('A001', 'Robert Downey Jr', '1965-04-04');
INSERT INTO actors VALUES ('A002', 'Kristen Stewart', '1990-04-09');
INSERT INTO actors VALUES ('A003', 'Robert Pattinson', '1986-05-13');
INSERT INTO actors VALUES ('A004', 'Cynthia Erivo', '1987-01-08');

-- Insert Movie Actors
INSERT INTO movie_actors VALUES ('101', 'A001');
INSERT INTO movie_actors VALUES ('102', 'A002');
INSERT INTO movie_actors VALUES ('102', 'A003');
INSERT INTO movie_actors VALUES ('103', 'A004');

-- Insert Genres
INSERT INTO genres VALUES ('G001', 'Action');
INSERT INTO genres VALUES ('G002', 'Romance');
INSERT INTO genres VALUES ('G003', 'Historical Drama');

-- Insert Movie Genres
INSERT INTO movie_genres VALUES ('101', 'G001');
INSERT INTO movie_genres VALUES ('102', 'G002');
INSERT INTO movie_genres VALUES ('103', 'G003');
