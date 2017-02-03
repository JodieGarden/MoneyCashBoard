DROP TABLE user;
DROP TABLE transactions; 
DROP TABLE tags;

CREATE TABLE user(
id SERIAL8 primary key,
name VARCHAR(255),
budget float
);

CREATE TABLE transactions(
id SERIAL8 primary key, 
original_total float, 
total float, 
);

CREATE TABLE tags(
id SERIAL8 primary key,
user_id INT8 references user(id)
transactions_id  INT8 references transactions(id),
name VARCHAR(255),
category VARCHAR(255)
)