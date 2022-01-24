CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE SCHEMA users;

CREATE TABLE IF NOT EXISTS users.user_information(
    id SERIAL NOT NULL,	
    user_uuid VARCHAR(36) NOT NULL UNIQUE,
    username VARCHAR(60) NOT NULL UNIQUE,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL, 
    email VARCHAR(60) NOT NULL UNIQUE,
    salt TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    edited_tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX IF NOT EXISTS user_uuid_index ON users.user_information(user_uuid);
