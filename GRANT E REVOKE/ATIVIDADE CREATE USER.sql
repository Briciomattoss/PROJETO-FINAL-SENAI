-- Crie um usuário chamado luiz-maia e conceda a ele permissões apenas de insert, update e select no banco pizzaria:

CREATE USER 'Luiz-Maia'@'%' IDENTIFIED BY 'senai@123';

GRANT INSERT, UPDATE, SELECT ON PIZZARIA.* TO 'Luiz-Maia'@'%';

-- Informe o ip do seu computador para o instrutor:

-- 172.16.2.0

-- Monitore as operações realizadas na tabela de auditoria au_pizza:
USE pizzaria;
SELECT * FROM pizza;

-- Construa uma trigger para identificar os updates na tabela pizza e grave as antigas informações na tabela au_pizza:

DELIMITER $$
CREATE TRIGGER depois_insert_pizza
AFTER UPDATE ON pizza
FOR EACH ROW
BEGIN
	INSERT INTO au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    VALUES (OLD.id_pizza, OLD.sabor, OLD.ingredientes, user(), now(), 'update');
END$$


-- Construa uma trigger para identificar os deletes na tabela pizza e grave as antigas informações na tabela au_pizza:

DELIMITER $$
CREATE TRIGGER depois_delete_pizza
AFTER DELETE ON pizza
FOR EACH ROW
BEGIN
	INSERT INTO au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    VALUES (OLD.id_pizza, OLD.sabor, OLD.ingredientes, user(), now(), 'delete');
END$$

-- Conceda a permissão de delete para o usuário "luiz-maia"@"%":

GRANT DELETE ON PIZZARIA.pizza TO 'Luiz-Maia'@'%';

--  Conceda a permissão de select para o usuário "luiz-maia"@"%" na tabela au_pizza:

GRANT SELECT ON PIZZARIA.au_pizza TO 'Luiz-Maia'@'%';
