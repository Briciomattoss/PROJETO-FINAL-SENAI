-- Crie um usuário chamado luiz-maia e conceda a ele permissões apenas de insert, update e select no banco pizzaria:

CREATE USER 'Luiz-Maia'@'%' IDENTIFIED BY 'senai@123';

GRANT INSERT, UPDATE, SELECT ON PIZZARIA.* TO 'Luiz-Maia'@'%';

-- Informe o ip do seu computador para o instrutor:

-- 192.168.56.1;

-- Monitore as operações realizadas na tabela de auditoria au_pizza:
USE pizzaria;
SELECT * FROM au_pizza;

-- Construa uma trigger para identificar os updates na tabela pizza e grave as antigas informações na tabela au_pizza:

DELIMITER $$
CREATE TRIGGER depois_insert_pizza
AFTER UPDATE ON pizza
FOR EACH ROW
BEGIN
	INSERT INTO au_pizza(id_pizza, sabor, ingredientes, usario, data_hora, operacao)
    VALUES (OLD.id_pizza, OLD.sabor, OLD.ingredientes, user(), now(), 'update');
END$$