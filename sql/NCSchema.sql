PRAGMA foreign_keys = ON;
CREATE TABLE author(
   id INTEGER PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);

CREATE TABLE post(
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content VARCHAR(255) NOT NULL,
    author_id INTEGER REFERENCES author(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO author(name) VALUES
('Momo');
INSERT INTO post(title, content, author_id) VALUES
('SICP', 'The Lisp Wizardry and Witchcraft', 1);
