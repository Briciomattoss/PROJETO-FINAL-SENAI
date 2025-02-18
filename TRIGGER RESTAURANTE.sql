select count(*)  from comanda where id_comanda = 1 and fechamento is null;
DELIMITER $$
CREATE TRIGGER antes_insert_comanda
BEFORE INSERT ON comanda
FOR EACH ROW
BEGIN
	DECLARE stComanda int;
	select count(*) into stComanda  from comanda where id_comanda = NEW.id_comanda and fechamento is null;
    IF stComanda > 0 THEN 
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é permitido, comanda ainda em aberto';
    END IF;
END$$
DELIMITER ;


insert into comanda (id_comanda, cliente, mesa, abertura) values (1,"Luiz",7,now());

update comanda set fechamento = now() where id_comanda = 1;

select *  from comanda ;