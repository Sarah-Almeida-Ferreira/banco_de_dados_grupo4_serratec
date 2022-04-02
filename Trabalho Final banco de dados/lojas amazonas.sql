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

