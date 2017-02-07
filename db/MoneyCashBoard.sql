DROP TABLE merchants CASCADE;
DROP TABLE transactions CASCADE; 
DROP TABLE tags;

CREATE TABLE merchants (
id SERIAL8 primary key,
name VARCHAR(255)
);


CREATE TABLE transactions (
id SERIAL8 primary key, 
total INT8 
);

CREATE TABLE tags (
id SERIAL8 primary key,
user_id INT8 references users(id) ON DELETE CASCADE not null,
transactions_id INT8 references transactions(id) ON DELETE CASCADE not null,
name VARCHAR(255),
category VARCHAR(255)
);
 