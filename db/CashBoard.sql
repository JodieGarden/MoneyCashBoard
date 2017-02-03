DROP TABLE users CASCADE;
DROP TABLE transactions CASCADE; 
DROP TABLE tags;

CREATE TABLE users (
id SERIAL8 primary key,
name VARCHAR(255) not null,
budget INT8
);


CREATE TABLE transactions (
id SERIAL8 primary key, 
original_total INT8, 
total INT8 
);

CREATE TABLE tags (
id SERIAL8 primary key,
user_id INT8 references users(id) ON DELETE CASCADE,
transactions_id INT8 references transactions(id) ON DELETE CASCADE,
name VARCHAR(255),
category VARCHAR(255)
);
