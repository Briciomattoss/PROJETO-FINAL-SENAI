create database restaurante;
use restaurante;
-- drop database restaurante;

CREATE TABLE comanda (
id_comanda int not null primary key,
abertura datetime,
cliente varchar(100),
mesa int ,
fechamento datetime
);

create table cardapio (
id_cardapio int not null primary key,
nome varchar(100),
quantidade int,
preco decimal(7,2),
descricao varchar(250)
); 

alter table cardapio
drop column quantidade;

alter table cardapio 
add column estoque int;

CREATE TABLE pedido (
id_pedido int not null primary key,
data_hora datetime,
id_comanda int,
id_cardapio int,
quantidade int
);

alter table pedido 
add foreign key (id_comanda) references comanda (id_comanda);

alter table pedido
add foreign key (id_cardapio) references cardapio (id_cardapio);


insert into cardapio (id_cardapio, estoque, nome, preco, descricao) values
("1",137,"Picanha",8.99,"Espeto de picanha suculenta"),
("2",105,"Alcatra",8.99,"Espeto de Alcatra saborosa"),
("3",200,"Contra-Filé",8.99,"Espeto suculento de Contra-Filé"),
("4",121,"Carne-de-Sol",8.99,"Espeto delicioso da melhor carne de sol do Nordeste"),
("5",95,"Coração",8.99,"Espeto de coração delicioso preparado pelo chef"),
(6,82,"Frango",8.99,"Espeto de Frango na melhor brasa"),
(7,77,"Asinha de Frango",8.99,"Espeto de Asinha de Frango de uma galinha de ouro"),
(8,99,"Medalhão de Frango",8.99,"Espeto de Medalhão de Frango da melhor dupla frango e porco do mundo"),
(9,210,"Medalhão de Carne",8.99,"Espeto de Medalhão de Carne da melhor dupla carne e porco do mundo"),
(10,20,"Kafta com queijo",8.99,"Espeto de Kafta da meçhor dupla carne e queijo do mundo"),
(11,75,"Linguiça Toscana",8.99,"Espeto de Linguiça Toscana do porco mais delicioso do Nordeste "),
(12,95,"Linguiça Apimentada",8.99,"Espeto de Linguiça preparado com a pimenta mais voraz do Nordeste"),
(13,125,"Queijo coalho",8.99,"Espeto de Queijo Coalho preparado com o leite retirado diretamente das tetas das meelhores vacas Nordestinas"),
(14,30,"Pão de Alho",8.99,"Pão de alho do melhor alho já cultivado pelas mãos Nordestinas"),
(15,100,"Jantinha",19.99,"Arroz branco ou baião de dois, feijão tropeiro, mandioca e vinagrete preparado pelas majestosas mãos da rainha da culinaria Nordestina"),
(16,33,"Baguete",19.99,"A junção de tudo aquilo que há de melhor, uma mistura de sabores, uma inserção de amores, a junção de tudo aquilo que você pode amar, uma maravilhosa baguete espetacular"),
(17,290,"Refrigerante Lata",4.99,"Coca-cola normal e zero, Fanta Uva e Laranja, Guaraná, Sprite e Pepsi"),
(18,350,"Refrigerante 600ml",6.99,"Coca-cola normal e zero, Fanta Uva e Laranja, Guaraná, Sprite e Pepsi"),
(19,600,"Regrigerante 2L",9.99,"Coca-cola normal e zero, Fanta Uva e Laranja, Guaraná, Sprite e Pepsi"),
(20,111,"Suco 500ml",6.99,"Limão, Laranja, Maracujá, Acerola, Uva, Abacaxi, Abacaxi C/Hortelã");

insert into comanda (id_comanda, cliente, mesa, abertura) values 
(1,"Fabricio ",7,'2025-02-14 22:00:00'),
(2,"Maria",8,'2025-03-01 13:45:00'),
(3,"Eduarda",6,'2025-06-12 09:30:00'),
(4,"Lucas",2,'2025-04-18 17:20:00'),
(5,"Carlos",5,'2025-07-22 21:10:00'),
(6,"Deivid",4,'2025-11-05 06:55:00'),
(7,"João",9,'2025-02-25 14:35:00'),
(8,"Davi",1,'2025-09-30 03:15:00'),
(9,"Ricardo",3,'2025-05-08 11:50:00'),
(10,"Lucemar",10,'2025-10-21 19:05:00');

insert into pedido(id_pedido, data_hora, id_cardapio, id_comanda, quantidade) values
(1,'2025-02-14 22:05:00',15,1,2),
(2,'2025-02-14 22:05:00',2,1,2),
(3,'2025-02-14 22:05:00',20,1,2),
(4,'2025-03-01 13:50:00',15,2,2),
(5,'2025-03-01 13:50:00',7,2,2),
(6,'2025-03-01 13:45:00',17,2,2),
(7,'2025-09-30 03:15:00',1,8,2),
(8,'2025-09-30 03:15:00',15,8,2),
(9,'2025-09-30 03:15:00',17,8,2),
(10,'2025-10-21 19:07:00',14,10,2),
(11,'2025-10-21 19:15:00',20,10,2),
(12,'2025-03-01 13:50:00',15,3,2),
(13,'2025-03-01 13:50:00',3,3,2),
(14,'2025-03-01 13:50:00',17,3,2),
(15,'2025-07-22 21:25:00',20,5,2),
(16,'2025-07-22 21:27:00',15,5,2),
(17,'2025-07-22 21:27:00',4,5,2),
(18,'2025-05-08 11:55:00',12,9,2),
(19,'2025-05-08 12:00:00',17,9,2),
(20,'2025-03-01 13:50:00',2,2,2),
(21,'2025-03-01 13:50:00',15,2,2),
(22,'2025-03-01 13:50:00',20,2,2),
(23,'2025-03-01 13:50:00',17,2,2),
(24,'2025-03-01 13:45:00',17,2,2);