DROP DATABASE IF EXISTS bookdb2;
DROP USER IF EXISTS `bookadmin`@`%`;
DROP USER IF EXISTS `bookuser`@`%`;
CREATE DATABASE IF NOT EXISTS bookdb2 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
/* Below line is version from the course. mysql_native_password authentication plugin is deprecated in MySQL 8.4
and removed in MySQL 9 and higher. */
-- CREATE USER IF NOT EXISTS `bookadmin`@`%` IDENTIFIED WITH mysql_native_password BY 'password';
CREATE USER IF NOT EXISTS `bookadmin`@`%` IDENTIFIED WITH caching_sha2_password BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER, EXECUTE, CREATE VIEW, SHOW VIEW,
    CREATE ROUTINE, ALTER ROUTINE, EVENT, TRIGGER ON `bookdb2`.* TO `bookadmin`@`%`;
/* Below line is version from the course. mysql_native_password authentication plugin is deprecated in MySQL 8.4
and removed in MySQL 9 and higher. */
-- CREATE USER IF NOT EXISTS `bookuser`@`%` IDENTIFIED WITH mysql_native_password BY 'password';
CREATE USER IF NOT EXISTS `bookuser`@`%` IDENTIFIED WITH caching_sha2_password BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE, SHOW VIEW ON `bookdb2`.* TO `bookuser`@`%`;
FLUSH PRIVILEGES;