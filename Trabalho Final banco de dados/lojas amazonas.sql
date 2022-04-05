CREATE TABLE "funcionario" (
  "id" serial Not Null,
  "nome" varchar(50) Not Null,
  "cpf" varchar(11) Not Null,
  "salario" decimal(10,2) Not Null,
  PRIMARY KEY ("id")
);

CREATE TABLE "categoria" (
  "id" serial Not Null,
  "nome" varchar(20) Not Null,
  PRIMARY KEY ("id")
);

CREATE TABLE "produto" (
  "id" serial Not Null,
  "id_funcionario" integer Not Null,
  "id_categoria" integer Not Null,
  "nome_produto" varchar(50) Not Null,
  "qtd_estoque" bigint Not Null,
  "valor_unitario" decimal(10,2) Not Null,
  "data_cadastro" date,
  "data_fabricacao" date,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_produto.id_funcionario"
    FOREIGN KEY ("id_funcionario")
      REFERENCES "funcionario"("id"),
  CONSTRAINT "FK_produto.id_categoria"
    FOREIGN KEY ("id_categoria")
      REFERENCES "categoria"("id")
);

CREATE TABLE "cliente" (
  "id" serial Not Null,
  "nome" varchar(50) Not Null,
  "login" varchar(50) Not Null,
  "senha" varchar(50) Not Null,
  "email" varchar(50) Not Null,
  "cpf" varchar(14) Not Null,
  "data_nascimento" date Not Null,
  PRIMARY KEY ("id")
);

CREATE TABLE "endereco" (
  "id_cliente" integer not null,
  "uf" char(2) Not Null,
  "cidade" varchar(50) Not Null,
  CONSTRAINT "FK_endereco.id_cliente"
    FOREIGN KEY ("id_cliente")
      REFERENCES "cliente"("id")
);

CREATE TABLE "pedido" (
  "id" serial Not Null,
  "codigo_cliente" integer Not Null,
  "data_pedido" date Not Null,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_pedido.codigo_cliente"
    FOREIGN KEY ("codigo_cliente")
      REFERENCES "cliente"("id")
);

CREATE TABLE "telefone" (
  "id_cliente" integer not null,
  "ddd" varchar(3) Not Null,
  "num_telefone" varchar,
  CONSTRAINT "FK_telefone.id_cliente"
    FOREIGN KEY ("id_cliente")
      REFERENCES "cliente"("id")
);

CREATE TABLE "itens_pedido" (
  "id_pedido" integer Not Null,
  "id_produto" integer Not Null,
  "quantidade" integer Not Null,
  CONSTRAINT "FK_itens_pedido.id_pedido"
    FOREIGN KEY ("id_pedido")
      REFERENCES "pedido"("id"),
  CONSTRAINT "FK_itens_pedido.id_produto"
    FOREIGN KEY ("id_produto")
      REFERENCES "produto"("id")
);

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
	('Amazonilson Pereira da Silva', 'amazon', '1234', 'amazonilson@hotmail.com', '12345678985', '1980/05/12')
	,('Jhonatans Bittencourt', 'joninha', '4321', 'joninhasrd@hotmail.com', '98765432125', '1990/05/12')
	,('Zoroastro Santana', 'zonzon', '7894', 'zoroastro@gmail.com', '65498732145', '1992/06/22')
	,('Zatana Dornelas', 'zaza', '45678912356', 'zaza@bol.com.br', '32145698785', '1995/12/08')
	,('Sidney Magal da Costa', 'cigana20', '6548', 'sandrarosamadalena@outlook.com', '36925814765', '1968/04/03')
	;

select * from cliente

insert into telefone(id_cliente, ddd, num_telefone) values
	('1','22','988564857')
	,('2','21','988652354')
	,('3','21','992568754')
	,('4','64','940028922')
	,('5','22','981459865')
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

insert into produto(id_funcionario, id_categoria, nome_produto, qtd_estoque, valor_unitario, data_cadastro, data_fabricacao) values
	('1', '1', 'kit kat', 5, 4.99, '2022/04/04', '2022/04/03')
	,('2', '1', 'M&Ms', 5, 8.99, '2022/04/04', '2022/04/03')
	,('3', '1', 'kinder ovo', 5, 12.99, '2022/04/04', '2022/04/03')
	,('4', '1', 'amandita', 5, 11.99, '2022/04/04', '2022/04/03')
	,('5', '1', 'tortuguita', 5, 9.99, '2022/04/04', '2022/04/03')
	,('6', '1', 'maria mole', 5, 0.25, '2022/04/04', '2022/04/03')
;

select * from produto;

--alter table endereco
	--rename column mariola to cep;