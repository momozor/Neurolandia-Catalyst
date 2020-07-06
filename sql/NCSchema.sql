PRAGMA foreign_keys = ON;
CREATE TABLE author(
   id INTEGER PRIMARY KEY,
   username VARCHAR(255) NOT NULL,
   email_address VARCHAR(255) NOT NULL,
   password VARCHAR(255) NOT NULL
);

CREATE TABLE post(
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content VARCHAR(255) NOT NULL,
    author_id INTEGER REFERENCES author(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Default data (MANDATORY TO CHANGE IN PRODUCTION USE TO AVOID
-- SECURITY BREACHES OF USING DEFAULT DATA)
INSERT INTO author(username, email_address, password) VALUES
('Momo', 'skelic3@gmail.com', 'whatever5');
INSERT INTO author(username, email_address, password) VALUES
('Clover', 'clover864221_glove@gmail.com', 'woof5');

INSERT INTO post(title, content, author_id) VALUES
('SICP', 'The Lisp Wizardry and Witchcraft', 1);
INSERT INTO post(title, content, author_id) VALUES
('The Greenpeace', 'Why Climate Change is now a Climate CRISIS?', 2);
