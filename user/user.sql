CREATE SCHEMA users;

CREATE TABLE IF NOT EXISTS users.user_information(
    id SERIAL NOT NULL,
    user_uuid VARCHAR(36) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL, 
    psw_hash VARCHAR(260) NOT NULL,
    salt varchar(32) NOT NULL,
    created_tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    edited_tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX IF NOT EXISTS user_uuid_index ON users.user_information(user_uuid);

CREATE TABLE IF NOT EXISTS users.permission(
    id SERIAL NOT NULL,
    name VARCHAR(20) NOT NULL,
    description VARCHAR(100),
    created_tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    edited_tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE UNIQUE INDEX IF NOT EXISTS permission_id_index ON users.permission(id);

CREATE TABLE IF NOT EXISTS users.user_permission(
    id SERIAL NOT NULL,
    user_uuid VARCHAR(36) NOT NULL,
    permission_id INT NOT NULL,
    created_tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    edited_tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX permision_user_uuid ON users.user_permission(user_uuid);
