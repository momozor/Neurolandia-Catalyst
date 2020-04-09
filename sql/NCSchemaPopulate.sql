-- Default data (MANDATORY TO CHANGE IN PRODUCTION USE TO AVOID
-- SECURITY BREACHES OF USING DEFAULT DATA)
INSERT INTO user(username, email_address, password, role) VALUES
('Momo', 'admin@email.com', 'whatever5', 'admin');
INSERT INTO user(username, email_address, password, role) VALUES
('Clover', 'user1@email.com', 'woof5', 'regular_user');

INSERT INTO post(title, content, create_date, user_id) VALUES
('SICP', 'The Lisp Wizardry and Witchcraft', datetime('now'), 1);
INSERT INTO post(title, content, create_date, user_id) VALUES
('The Greenpeace', 'Why Climate Change is now a Climate CRISIS?', datetime('now'), 2);
