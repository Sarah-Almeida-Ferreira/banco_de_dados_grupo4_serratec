-- Criação da base de dados:

--create database lojas_amazonas_final;

-- Com a base de dados criada podemos criar o esquema

--create schema trabalho_amazonas_final;

/*Criação de tables*/

CREATE TABLE if not exists "funcionario" (
  "id" serial Not Null,
  "nome" varchar(50) Not Null,
  "cpf" varchar(11) not null,
  "salario" decimal(10,2),
  PRIMARY KEY ("id")
);

CREATE TABLE if not exists "categoria" (
  "id" serial Not Null,
  "nome" varchar(20) Not Null,
  PRIMARY KEY ("id")
);

CREATE TABLE if not exists "produto" (
  "id" serial Not Null,
  "id_funcionario" integer Not Null,
  "id_categoria" integer Not Null,
  "nome_produto" varchar(50) Not Null,
  "qtd_estoque" integer Not Null,
  "valor_unitario" decimal(10,2) Not Null,
  "data_cadastro" date not null default current_date,
  "data_fabricacao" date,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_produto.id_funcionario"
    FOREIGN KEY ("id_funcionario")
      REFERENCES "funcionario"("id") on delete cascade,
  CONSTRAINT "FK_produto.id_categoria"
    FOREIGN KEY ("id_categoria")
      REFERENCES "categoria"("id") on delete cascade
);

CREATE table if not exists "cliente" (
  "id" serial Not Null,
  "nome" varchar(50) Not Null,
  "login" varchar(50) Not Null,
  "senha" varchar(50) Not Null,
  "email" varchar(50) Not Null,
  "cpf" varchar(11) Not Null,
  "data_nascimento" date Not Null,
  PRIMARY KEY ("id")
);

CREATE TABLE if not exists "endereco" (
  "id_cliente" integer not null,
  "uf" char(2) Not Null,
  "cidade" varchar(50) Not Null,
  CONSTRAINT "FK_endereco.id_cliente"
    FOREIGN KEY ("id_cliente")
      REFERENCES "cliente"("id") on delete cascade
);

CREATE table if not exists "pedido" (
  "id" serial Not Null,
  "id_cliente" integer Not Null,
  "data_pedido" date not null default current_date ,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_pedido.id_cliente"
    FOREIGN KEY ("id_cliente")
      REFERENCES "cliente"("id") on delete cascade
);

CREATE TABLE if not exists"telefone" (
  "id_cliente" integer not null,
  "ddd" varchar(3) Not Null,
  "num_telefone" varchar(9) not null,
  CONSTRAINT "FK_telefone.id_cliente"
    FOREIGN KEY ("id_cliente")
      REFERENCES "cliente"("id") on delete cascade
);

CREATE TABLE if not exists "itens_pedido" (
  "id_pedido" integer Not Null,
  "id_produto" integer Not Null,
  "quantidade" integer Not Null,
  CONSTRAINT "FK_itens_pedido.id_pedido"
    FOREIGN KEY ("id_pedido")
      REFERENCES "pedido"("id") on delete cascade,
  CONSTRAINT "FK_itens_pedido.id_produto"
    FOREIGN KEY ("id_produto")
      REFERENCES "produto"("id") on delete cascade
);

/* Updates e inserts do banco: */

insert into categoria(nome) values
	  ('vestuário')
	, ('alimentos')
	, ('eletrônicos')
	;

select id, nome from categoria;

insert into funcionario(nome, cpf, salario) values
	  ('André', '12345678912', '900')
	, ('Sarah', '09876543210', '1000')
	, ('Pereira', '67584930211', '1.99')
	, ('Patrick', '12345612345', '900')
	, ('Aline', '54632187960', '900')
	, ('Theo', '43521657892', '900')
	, ('Wanderson', '32578906754', '900')
	;

select id, nome, cpf, salario from funcionario;

insert into cliente(nome, login, senha, email, cpf, data_nascimento) values
	('Amazonilvenson Pereira da Silva', 'amazon', '1234', 'amazo@hotmail.com', '12345678985', '1980/05/12')
	,('Jhonatans Bittencourt', 'joninha', '4321', 'joninhasrd@hotmail.com', '98765432125', '1990/05/12')
	,('Zoroastro Santana', 'zonzon', '7894', 'zoroastro@gmail.com', '65498732145', '1992/06/22')
	,('Zatana Dornelas', 'zaza', '45678912356', 'zaza@bol.com.br', '32145698785', '1995/12/08')
	,('Sidney Magal da Costa', 'cigana20', '6548', 'sandrarosamadalena@outlook.com', '36925814765', '1968/04/03')
	,('Rilson André Magalhães','rilsim22', '4002', 'rilsimmaga@yahoo.com', '82738893872', '1974/12/07')
	;


select * from cliente;

insert into telefone(id_cliente, ddd, num_telefone) values
	('1','22','988564857')
	,('2','21','988652354')
	,('3','21','992568754')
	,('4','64','940028922')
	,('5','22','981459865')
	,('6','21','994349405')
	;



select * from telefone;

alter table endereco
	add cep varchar(8);

insert into endereco(id_cliente, uf, cidade, cep) values
	('1','RJ','Nova Friburgo','28600000')
	,('2','RJ','Teresópolis','25956170')
	,('3','RJ','Teresópolis','25975783')
	,('4','GO','Água Limpa','75665000')
	,('5','RJ','Nova Friburgo','28600000')
	,('6','ES','Guaçuí','29560000')
	;
	
select * from endereco;

update categoria
	set nome = 'doces'
		where id = '1';
	
update categoria
	set nome ='eletrônicos'
		where id = '2';
	
update categoria
	set nome ='vestuário'
		where id = '3';
	
select * from categoria;

insert into produto(id_funcionario, id_categoria, nome_produto, qtd_estoque, valor_unitario, data_fabricacao) values
	('1', '1', 'kit kat', 5, 4.99, '2022/04/03')
	,('2', '1', 'M&Ms', 5, 8.99, '2022/04/03')
	,('3', '1', 'kinder ovo', 5, 12.99, '2022/04/03')
	,('4', '1', 'amandita', 5, 11.99, '2022/04/03')
	,('5', '1', 'tortuguita', 5, 9.99, '2022/04/03')
	,('6', '1', 'maria mole', 5, 0.25, '2022/04/03')
;

insert into categoria(nome) values
('jogos')
,('ferramentas')
,('livros')
;
select * from categoria;

insert into pedido (id_cliente) values
 ('1')
,('2')
,('3')
,('4')
,('5')
,('6')
,('1')
;
select * from pedido;

insert into itens_pedido (id_pedido, id_produto, quantidade) values 
 ('1', '1', '1' )
,('2', '2', '1')
,('3', '3', '1')
,('4', '4', '2')
,('5', '5', '1')
,('5', '1', '1')
;
select * from itens_pedido; 

/*Consultas SQL
 * Letra A:*/

select
	 p.*
	,f.nome as nome_funcionario
	,c.nome as nome_categoria
from
	produto as p 
    ,funcionario as f 
    ,categoria as c 
where 
	p.id_categoria = c.id 
	and
	p.id_funcionario = f.id 
;

/*
 * Letra B:*/
select
	 p.*
	,c.nome as nome_cliente 
	,t.num_telefone   
from
    pedido as p 
    ,cliente as c
    ,telefone as t 
where 
	p.id  = c.id  
	and
	p.id  = t.id_cliente
;

/*Letra C: */

select
	 pe.id as numero_pedido
    ,c.nome as nome_cliente 
	,pe.data_pedido    
    ,pr.nome_produto
    ,i.quantidade
from
    pedido as pe 
    ,cliente as c
    ,itens_pedido as i
    ,produto as pr
where 
    c.id = pe.id_cliente
	and
	pe.id  = i.id_pedido
	and
	pr.id  = i.id_produto
;

/*Letra D:
 * Uma consulta mostrando a quantidade de pedidos por cliente, com resultado ordenado 
 * por nome do cliente, de modo crescente. (2 pontos)
*/
select
	 c.nome as nome_cliente
	 ,count (pe.id) as pedidos	
from
    pedido as pe 
    ,cliente as c
where 
    c.id = pe.id_cliente
group by 
	c.id
order by 
	c.nome asc 
;

/*Letra E:
 * Utilize o inner join para uma consulta coerente em 3 tabelas. (2 pontos)
 */

select 
	f.nome as nome_funcionario
	,p.nome_produto 
	,c.nome as nome_categoria
from
	produto as p 
	inner join funcionario as f on f.id = p.id_funcionario
	inner join categoria as c on c.id = p.id_categoria 
order by 
	f.nome asc
;

/* Letra F:
 * Faça uso de outro join para consultar os dados, mesmo que nulos, da tabela funcionario.
 * (2 pontos)
*/
select 
	f.nome as nome_funcionario
	,p.nome_produto 
from
	produto as p 
	right join funcionario as f on f.id = p.id_funcionario
order by 
	f.nome asc
;

/* SQL Updates.:
  5;A)
2 SQLs de atualização:
Um SQL que mude o salário de todos os funcionários: eles passarão a ganhar R$ 500,00 a mais;
 (3 pontos)
*/

select * from funcionario;

update funcionario 
set salario = salario + 500.00
;
/* 5;B)
Um SQL que altere o e-mail e o telefone de um cliente qualquer cadastrado. 
(2 pontos)
***/
select 
	c.id 
    ,c.nome
	,t.num_telefone
	,c.email
from
	cliente as c
	inner join telefone as t on c.id = t.id_cliente
order by 
	c.nome asc
;
update cliente 
set email = 'zatanaboladona@gmail.com' where id = 4
;
update telefone
set num_telefone = '999998881'  where id_cliente = 4
;

/* Numero 6
 * SQL de exclusão, dos clientes que foram cadastrados contendo o caractere ‘e’ no 
 * nome ou que possuem uma senha com menos de 4 caracteres. 
 * (3 pontos)
 */

select 
	 c.nome
	,c.senha
from cliente as c
--where
--c.nome --like --'%e%' --or
--length(c.senha) < 4 
;





	



    


