create database restaurante;
use restaurante;
-- drop database restaurante;

CREATE TABLE comanda (
id_comanda int not null primary key,
cliente varchar(100),
mesa int ,
abertura datetime,
fechamento datetime
);

create table cardapio (
id_cardapio int not null primary key,
nome varchar(100),
quantidade int,
preco decimal(7,2),
descricao varchar(250)
); 

CREATE TABLE pedido (
id_pedido int not null primary key,
quantidade int,
data_hora datetime,
id_comanda int,
id_cardapio int
);

alter table pedido 
add foreign key (id_comanda) references comanda (id_comanda);

alter table pedido
add foreign key (id_cardapio) references cardapio (id_cardapio);

insert into cardapio (id_cardapio, nome, quantidade, preco, descricao) values
("1","Picanha",1,8,99,"Espeto de picanha suculenta"),
("2","Alcatra",1,8,99,"Espeto de Alcatra saborosa"),
("3","Contra-Filé",1,8,99,"Espeto suculento de Contra-Filé"),
("4","Carne-de-Sol",1,8,99,"Espeto delicioso da melhor carne de sol do Nordeste"),
("5","Coração",1,8,99,"Espeto de coração delicioso preparado pelo chef"),
(6,"Frango",1,8,99,"Espeto de Frango na melhor brasa"),
(7,"Asinha de Frango",1,8,99,"Espeto de Asinha de Frango de uma galinha de ouro"),
(8,"Medalhão de Frango",1,8.99,"Espeto de Medalhão de Frango da melhor dupla frango e porco do mundo"),
(9,"Medalhão de Carne",1,8.99,"Espeto de Medalhão de Carne da melhor dupla carne e porco do mundo"),
(10,"Kafta com queijo",1,8.99,"Espeto de Kafta da meçhor dupla carne e queijo do mundo"),
(11,"Linguiça Toscana",1,8.99,"Espeto de Linguiça Toscana do porco mais delicioso do Nordeste "),
(12,"Linguiça Apimentada",1,8.99,""),
(13,"Queijo coalho",1,8.99,""),
(14,"Pão de Alho",1,8.99,""),
(15,"Jantinha",1,19.99,""),
(16,"Baguete",1,19.99,""),
(17,"Refrigerante Lata",1,4.99,""),
(18,"",,"",""),
(19,"",,"",""),
(20,"",,"","");h