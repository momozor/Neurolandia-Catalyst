-- Default data (MANDATORY TO CHANGE IN PRODUCTION USE TO AVOID
-- SECURITY BREACHES OF USING DEFAULT DATA)
INSERT INTO user(username, email_address, password, role) VALUES
('Momo', 'skelic3@gmail.com', 'whatever5', 'admin');
INSERT INTO user(username, email_address, password, role) VALUES
('Clover', 'clover864221_glove@gmail.com', 'woof5', 'regular_user');

INSERT INTO post(title, content, user_id) VALUES
('SICP', 'The Lisp Wizardry and Witchcraft', 1);
INSERT INTO post(title, content, user_id) VALUES
('The Greenpeace', 'Why Climate Change is now a Climate CRISIS?', 2);
