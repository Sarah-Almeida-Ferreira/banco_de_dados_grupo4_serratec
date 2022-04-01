CREATE TABLE "vendedor" (
  "id_vendedor" integer,
  "id_endereco" integer,
  "nome" varchar(50),
  "comissao" integer,
  PRIMARY KEY ("id_vendedor")
);

CREATE TABLE "cliente" (
  "id_cliente" integer,
  "id_vendedor" integer,
  "id_endereco" integer,
  "nome" varchar(50),
  "faturamento_acumulado" integer,
  "limite_credito" integer,
  PRIMARY KEY ("id_cliente"),
  CONSTRAINT "FK_cliente.id_vendedor"
    FOREIGN KEY ("id_vendedor")
      REFERENCES "vendedor"("id_vendedor")
);

CREATE TABLE "pedido" (
  "id_pedido" integer,
  "id_cliente" integer,
  "id_item" integer,
  "data_pedido" date,
  PRIMARY KEY ("id_pedido"),
  CONSTRAINT "FK_pedido.id_cliente"
    FOREIGN KEY ("id_cliente")
      REFERENCES "cliente"("id_cliente")
);

CREATE TABLE "armazem" (
  "id_armazem" integer,
  "id_endereco" integer,
  PRIMARY KEY ("id_armazem")
);

CREATE TABLE "peca" (
  "id_peca" integer,
  "id_armazem" integer,
  "descricao" varchar(50),
  "preco" integer,
  "quant_estoque" integer,
  PRIMARY KEY ("id_peca"),
  CONSTRAINT "FK_peca.id_armazem"
    FOREIGN KEY ("id_armazem")
      REFERENCES "armazem"("id_armazem")
);

CREATE TABLE "item_pedido" (
  "id_item" integer,
  "id_peca" integer,
  "quantidade" integer,
  "preco_cotado" integer,
  PRIMARY KEY ("id_item")
  
);

CREATE TABLE "endereco" (
  "id_endereco" integer,
  "logradouro" varchar(20),
  "numero" integer,
  "bairro" varchar(20),
  "cidade" varchar(20),
  "uf" varchar(2),
  "cep" varchar(9),
  PRIMARY KEY ("id_endereco")
  
);

