DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS feedback;
CREATE TABLE IF NOT EXISTS users (
    id SERIAL NOT NULL,
    username VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR Not NULL,
    PRIMARY KEY (username)
);
CREATE TABLE IF NOT EXISTS feedback (
    id SERIAL NOT NULL,
    title VARCHAR(100) NOT NULL,
    content VARCHAR NOT NULL,
    username VARCHAR(20),
    PRIMARY KEY (id),
    FOREIGN KEY(username) REFERENCES users (username)
);