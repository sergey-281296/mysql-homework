-- ЗАДАНИЕ 1

-- 1.2. Создание пользователя sys_temp
CREATE USER 'sys_temp'@'localhost' IDENTIFIED BY 'temp_password';

-- 1.3. Список пользователей
SELECT user, host FROM mysql.user;

-- 1.4. Выдача всех прав
GRANT ALL PRIVILEGES ON *.* TO 'sys_temp'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- 1.5. Просмотр прав пользователя
SHOW GRANTS FOR 'sys_temp'@'localhost';

-- 1.6. Смена типа аутентификации
ALTER USER 'sys_temp'@'localhost' IDENTIFIED WITH mysql_native_password BY 'temp_password';

-- Восстановление базы sakila
SOURCE sakila-db/sakila-schema.sql;
SOURCE sakila-db/sakila-data.sql;

-- 1.8. Список таблиц базы sakila
USE sakila;
SHOW TABLES;

-- ЗАДАНИЕ 2
SELECT 
    TABLE_NAME AS 'Название таблицы',
    COLUMN_NAME AS 'Название первичного ключа'
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE CONSTRAINT_NAME = 'PRIMARY'
    AND TABLE_SCHEMA = 'sakila'
ORDER BY TABLE_NAME;
