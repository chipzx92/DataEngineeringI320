DROP TABLE IF EXISTS objects;
DROP TABLE IF EXISTS functions;
DROP TABLE IF EXISTS colors;

CREATE TABLE IF NOT EXISTS objects (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE IF NOT EXISTS functions (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE IF NOT EXISTS colors (
    id SERIAL PRIMARY KEY,
    name TEXT,
    object_id INTEGER REFERENCES objects(id),
    function_id INTEGER REFERENCES functions(id)
);

INSERT INTO colors(id, name) VALUES (1,'red');
INSERT INTO colors(id, name) VALUES (2,'green');
INSERT INTO colors(id, name) VALUES (3,'silver');
INSERT INTO colors(id, name) VALUES (4,'pink');
INSERT INTO functions(id, name) VALUES (1,'writes');
INSERT INTO functions(id, name) VALUES (2,'holds');
INSERT INTO functions(id, name) VALUES (3,'eats');

INSERT INTO objects(id, name, color_id, function_id)
  VALUES (1, 'highlighter', 2, 1),
         (2, 'pen', 1, 1),
         (3, 'mug', 1, 2),
         (4, 'vase', 2, 2),
         (5, 'fork', 3, 3),
         (6, 'mug', 4, 2),
         (7, 'cup', 2, 2),
         (8, 'cup', 2, 2);