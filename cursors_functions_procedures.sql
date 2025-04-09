-- Create movies table
CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT,
    genre VARCHAR(50)
);

-- Create actors table
CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_year INT
);

-- Create junction table for many-to-many relationship
CREATE TABLE movie_actor (
    movie_id INT REFERENCES movies(movie_id),
    actor_id INT REFERENCES actors(actor_id),
    PRIMARY KEY (movie_id, actor_id)
);

-- Insert sample movies
INSERT INTO movies (title, release_year, genre) VALUES
('Inception', 2010, 'Sci-Fi'),
('The Dark Knight', 2008, 'Action'),
('Pulp Fiction', 1994, 'Crime'),
('Forrest Gump', 1994, 'Drama'),
('The Matrix', 1999, 'Sci-Fi');

-- Insert sample actors
INSERT INTO actors (name, birth_year) VALUES
('Leonardo DiCaprio', 1974),
('Christian Bale', 1974),
('John Travolta', 1954),
('Tom Hanks', 1956),
('Keanu Reeves', 1964);

-- Assign actors to movies (many-to-many)
INSERT INTO movie_actor (movie_id, actor_id) VALUES
(1, 1), -- Inception → DiCaprio
(2, 2), -- The Dark Knight → Bale
(3, 3), -- Pulp Fiction → Travolta
(4, 4), -- Forrest Gump → Hanks
(5, 5), -- The Matrix → Reeves
(1, 2); -- Inception → Bale (additional)


--task no. 1--
DO $$
DECLARE
    actor_record actors%ROWTYPE; -- Row type variable for actors table
    movie_record movies%ROWTYPE; -- Row type variable for movies table
    actor_cursor CURSOR FOR SELECT * FROM actors; -- Cursor for actors table
    movie_cursor CURSOR FOR SELECT * FROM movies; -- Cursor for movies table
BEGIN
    -- Open the actor cursor
    OPEN actor_cursor;

    LOOP
        -- Fetch each actor into the row type variable
        FETCH actor_cursor INTO actor_record;
        EXIT WHEN NOT FOUND; -- Exit loop when no more rows are found

        -- Open the movie cursor for each actor
        OPEN movie_cursor;

        LOOP
            -- Fetch each movie into the row type variable
            FETCH movie_cursor INTO movie_record;
            EXIT WHEN NOT FOUND; -- Exit loop when no more rows are found

            -- Display actor name and movie title
            RAISE NOTICE 'Actor: %, Movie: %', actor_record.name, movie_record.title;
        END LOOP;

        -- Close the movie cursor after processing all movies for the current actor
        CLOSE movie_cursor;
    END LOOP;

    -- Close the actor cursor after processing all actors
    CLOSE actor_cursor;
END $$;


--task no. 2--
--Create a function that returns the number of actors in a given movie--
CREATE OR REPLACE FUNCTION count_actors_in_movie(movie_name char)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    num_of_actors INT;
BEGIN
    SELECT COUNT(*) INTO num_of_actors
    FROM movie_actor
    WHERE movie_id IN (
        SELECT movie_id
        FROM movies
        WHERE title = movie_name
    );

    RETURN num_of_actors;
END;
$$;
select count_actors_in_movie ('Inception');
--task no.3--
CREATE OR REPLACE PROCEDURE update_date(select_movie INT, new_release INT)
LANGUAGE plpgsql
AS $$
BEGIN
 
    UPDATE movies
    SET release_year = new_release
    WHERE movie_id = select_movie;

    RAISE NOTICE 'Movie ID %: Release year updated to %', select_movie, new_release;
END;
$$;

CALL update_date(1, 2025);
