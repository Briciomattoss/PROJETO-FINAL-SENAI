use pizzaria;

SET autocommit = 0;
START TRANSACTION;

INSERT INTO pizza(sabor, ingredientes) VALUES('Frango','Teste Insert Fabrício');

SELECT * FROM pizza;

COMMIT;