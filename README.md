# SQL_MoviesDB
# Movie Database Project

This project showcases a small SQL database for managing a collection of movies, their directors, actors, and genres. The database models many-to-many relationships and is built using MySQL.

---

SQL Script is uploaded above.

# Project Report Instructions
## In your report:
1. You must describe your database application.  
2. You must submit the conceptual and logical design of your database as specified in section *Design and Implementation*, which include the E-R diagram and relational database schema of your database.

    - **In the E-R diagram**
   
   a. there must be at least 4 entities  
   b. there must be at least 2 one-to-many/one-to-one relationships  
   c. there must be at least 1 many-to-many relationship.  

   - **For each table:** 

   a. Describe all the attributes (including attribute names, data types, etc.)
   b. Specify the primary keys and foreign keys (if they exist)  
   c. Discuss which Normal Form it is in  
   d. Provide the SQL DDL statement you used to create the table, or the screen snapshots if you used a GUI  
   e. Output all the records in the table using `SELECT * FROM example_table;`  
4. For each query:  
   a. Describe the query  
   b. Provide the SQL statement for it, or if you used GUI, provide the screen snapshots and the equivalent SQL statement  
   c. Include the results returned by the query in your final report

---

# Project Report

## 1. Description of the Database Application
**The Movie Database Management System is designed to store and manage data related to movies, actors, directors, and genres. The system allows users to:**
- Store information about movies, including title, release year, and genre.
- Manage actor and director details, such as names and birthdates.
- Track which actors starred in which movies and which directors directed which movies.
- Perform queries to retrieve meaningful insights, such as the number of movies in each genre, movies directed by a specific director, or actors who have not been assigned to any
movie.

---

## 2. Design and Implementation

### Relationships in the E-R Diagram
**1. One-to-Many Relationship:**
- Directors → Movies:
  - A director can direct many movies, but a movie is directed by only one
director.
  - This is represented by a foreign key DirectorID in the Movies table
referencing the Directors table.

**2. Many-to-Many Relationships:**
- Movies → Actors:
  - A movie can have many actors, and an actor can act in many movies.
  - This is represented by a junction table MovieActors with composite primary key (MovieID, ActorID).
- Movies → Genres:
  - A movie can belong to many genres, and a genre can be associated with
many movies.
  - This is represented by a junction table MovieGenres with composite
primary key (MovieID, GenreID).

<img width="633" alt="Screenshot 2025-04-09 at 7 15 29 PM" src="https://github.com/user-attachments/assets/e636786b-70c3-4384-9cf4-d05f2c688d69" />

## E-R Diagram:

**1. Movies:**
- This entity represents the movies that are stored in the database. The components of this entity
are the MovieID, Title, Release Year, and Director ID. The MovieID serves as a primary key and
the DirectorID serves as a foreign key.

**2. Directors:**
- This entity represents the information of the directors stored in the database. The components
of this entity are the DirectorID, Directors name, and their nationality. The DirectorID serves as
a primary key.

**3. Actor:**
- This entity represents the information of the actors stored in the database. The
components of this entity are the ActorID, Actor name, and their date of birth. The ActorID
serves as a primary key.

**4. Genres:**
- This entity represents the information of the genres stored in the database. The components of
this entity are the GenreID, and genre name. The GenreID serves as a primary key.

**5. Movie Actors:**
- This entity represents the information of the movie actors in the database. The components of
this entity are the MovieID, and the Actor. The MovieID serves as a primary key, and the actor
serves as a foreign key.

**6. Movie Genres:**
- This entity represents the information of the movie genres in the database. The components of
this entity are the MovieID, and the GenreID. The MovieID and the GenreID both serve as
foreign keys.

## Statements used to create tables:
```
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

```
## Statements used to insert values into tables:

```
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


