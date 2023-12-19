--
CREATE TABLE IF NOT EXISTS authorities (
    authority_id serial PRIMARY KEY,
    authority_name varchar(100) NOT NULL,
    authority_description varchar(400) NOT NULL,
    authority_created_datetime timestamp NOT NULL DEFAULT current_timestamp
);
CREATE TABLE IF NOT EXISTS roles (
    role_id serial PRIMARY KEY,
    role_name varchar(100) NOT NULL,
    role_description varchar(400) NOT NULL,
    role_created_datetime timestamp NOT NULL DEFAULT current_timestamp
);
CREATE TABLE IF NOT EXISTS users (
    user_id serial PRIMARY KEY,
    user_email varchar(200) NOT NULL,
    user_login varchar(100) NOT NULL,
    user_password_hash varchar(200) NOT NULL,
    user_first_name varchar(100) NOT NULL,
    user_second_name varchar(100) NOT NULL,
    user_birthday_date date NOT NULL,
    user_created_datetime timestamp NOT NULL DEFAULT current_timestamp,
    user_status varchar(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS role_authorities (
    role_authority_id serial PRIMARY KEY,
    role_id integer NOT NULL REFERENCES roles ON DELETE CASCADE,
    authority_id integer NOT NULL REFERENCES authorities ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS  user_roles (
    user_role_id serial PRIMARY KEY,
    user_id integer NOT NULL REFERENCES users ON DELETE CASCADE,
    role_id integer NOT NULL REFERENCES roles ON DELETE CASCADE
);
--