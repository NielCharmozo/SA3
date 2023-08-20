create database uc9_sa3;

use uc9_sa3;

create table user1(
idUser integer auto_increment primary key,
ativo tinyint (1),
userName varchar(150),
emailUser varchar(150),
cpfUser varchar(11) unique
);

insert into user1(ativo, userName, emailUser, cpfUser)
values(1, 'Daniel', 'egerdaniel72@gmail.com','12345678900');

select * from user1;

insert into user1(ativo, userName, emailUser, cpfUser)
values(0, 'VElho', 'ganiel72@gmail.com','12345678560');

insert into user1(ativo, userName, emailUser, cpfUser)
values(1, 'gang', 'ooola@gmail.com','55345678560');

update user1
set ativo = 1 
where idUser = 2;

delete from user1
where idUser = 3;

select * from user1
where cpfUser like '12345678900';

create table pedido(
idpedido integer not null auto_increment primary key,usuario
dataPedido date,
horaPedido time,
totalPedido numeric (7,2),
transportador varchar(50),
codUser integer not null,
foreign key (codUser) references user1(idUser));

insert into pedido(dataPedido, horaPedido, totalPedido, transportador, codUser)
values('2023-07-17', '12:32:00', '3000.99', 'ABC', 1 );

insert into pedido(dataPedido, horaPedido, totalPedido, transportador, codUser)
values('2023-07-17', '12:32:00', '24.00', 'ABC', 1 );


select * from pedido;

select idpedido, dataPedido, userName
from pedido, user1
where pedido.codUser = user1.idUser;

select idpedido, dataPedido, userName
from pedido LEFT JOIN user1 on pedido.codUser = user1.idUser;

create table produto(
idProduto integer not null auto_increment primary key,
descricao varchar(100),
valorunitario numeric (7,2),
unidade varchar (2));

insert into produto(descricao, valorunitario, unidade)
values('coca', 8.00, 'UN');

select * from produto;

create table item_produto(
idItem integer not null auto_increment primary key,
qtdItem integer,
totalItem numeric (9,2),
codPedido integer not null,
codProduto integer not null,
foreign key (codPedido) references pedido(idPedido),
foreign key (codProduto) references produto(idProduto)
);

insert into item_produto(qtdItem, totalItem, codPedido, codProduto)
values(3, 24.00, 2, 2);

select * from Item_produto;

select 	user1.userName, 
		pedido.dataPedido, 
		pedido.totalPedido, 
		produto.valorunitario, 
		produto.unidade,
		item_produto.qtdItem,
		item_produto.totalItem
from user1 inner join pedido on user1.idUser = pedido.codUser
inner join item_produto on pedido.idPedido = item_produto.codPedido
inner join produto on item_produto.codProduto = produto.idProduto;


