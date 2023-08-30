DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS genres;

CREATE TABLE IF NOT EXISTS genres (
    id   SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE IF NOT EXISTS authors (
    id   SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE IF NOT EXISTS books (
    id        SERIAL PRIMARY KEY,
    name      TEXT,
    author_id INT REFERENCES authors(id),
    genre_id  INT REFERENCES genres(id)
);

INSERT INTO genres (id, name)
    VALUES (1, 'memoir'),
           (2, 'Science Fiction'),
           (3, 'Romance'),
           (4, 'Fantasy');

INSERT INTO authors (id, name)
    VALUES (1, 'Maya Angelou'),
           (2, 'Liu Cixin'),
           (3, 'Jane Austin'),
           (4, 'Lee Yeongdo'),
           (5, 'JRR Tolkein');

INSERT INTO books (id, name, author_id, genre_id)
    VALUES (1, 'I Know Why the Caged Bird Sings', 1, 1),
           (2, 'The Three-Body Problem', 2, 2),
           (3, 'Wuthering Heights', 3, 3),
           (4, 'Dragon Raja', 4, 4),
           (5, 'Fellowship of the Rings', 4, 5);
