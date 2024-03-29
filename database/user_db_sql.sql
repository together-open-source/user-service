CREATE DATABASE USER_DB;

USE USER_DB;

CREATE TABLE IF NOT EXISTS USERS (
    USER_ID INT AUTO_INCREMENT PRIMARY KEY,
    USERNAME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL,
    PASSWORD_HASH VARCHAR(255) NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FIRST_NAME VARCHAR(255) NOT NULL,
    LAST_NAME VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS ROLES (
    ROLE_ID INT AUTO_INCREMENT PRIMARY KEY,
    ROLE_NAME VARCHAR(255) NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS USER_ROLES (
    USER_ROLE_ID INT AUTO_INCREMENT PRIMARY KEY,
    USER_ID INT NOT NULL,
    ROLE_ID INT NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (USER_ID)
        REFERENCES USERS (USER_ID)
        ON UPDATE RESTRICT ON DELETE CASCADE,
    FOREIGN KEY (ROLE_ID)
        REFERENCES ROLES (ROLE_ID)
        ON UPDATE RESTRICT ON DELETE CASCADE
);

INSERT INTO USERS (USERNAME, EMAIL, PASSWORD_HASH, FIRST_NAME, LAST_NAME)
VALUES ("StarterAdmin", "admin@gus.os", "221...B", "Admin", "User");


INSERT INTO ROLES (ROLE_NAME)
VALUES ("SYSTEM_ADMIN");