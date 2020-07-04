CREATE TABLE Post(
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL
);

INSERT INTO Post (title, content, author) VALUES
('first', 'first content', 'Momo');
