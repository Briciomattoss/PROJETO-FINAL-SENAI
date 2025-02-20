CREATE USER 'novo-usuario'@'localhost' IDENTIFIED BY 'senha123';

SELECT User, Host FROM mysql.user;

create database pizzaria;

GRANT ALL PRIVILEGES ON pizzaria. * TO 'novo-usuario'@'localhost';

REVOKE CREATE ON pizzaria.* FROM 'novo-usuario'@'localhost';

use pizzaria;
CREATE TABLE pizza(
id_pizza int auto_increment primary key,
sabor varchar(250),
ingredientes varchar(250));

CREATE TABLE au_pizza(
id_aupizza int auto_increment primary key,
id_pizza int,
sabor varchar(250),
ingredientes varchar(250),
usuario varchar(100),
data_hora datetime,
operacao varchar(10));

DELIMITER $$
CREATE TRIGGER depois_insert_pizza
AFTER INSERT ON pizza
FOR EACH ROW
BEGIN
	INSERT INTO au_pizza(id_pizza, sabor, ingredientes, usario, data_hora, operacao)
    VALUES (NEW.id_pizza, NEW.sabor, NEW.ingredientes, user(), now(), 'inser');
END$$

drop trigger depois_insert_pizza;

SELECT * FROM au_pizza;