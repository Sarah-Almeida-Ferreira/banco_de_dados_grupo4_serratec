CREATE TABLE "funcionario" (
  "id_funcionario" integer,
  "id_departamento" integer,
  "id_projeto" integer,
  "telefone" integer,
  "salario" real,
  PRIMARY KEY ("id_funcionario")
);

CREATE TABLE "pecas" (
  "id_pecas" integer,
  "id_deposito" integer,
  "id_fornecedor" integer,
  "peso_peca" real,
  "cor_peca" varchar(40),
  PRIMARY KEY ("id_pecas")
);

CREATE TABLE "fornecedor" (
  "id_fornecedor" integer,
  "endereco" varchar(200),
  PRIMARY KEY ("id_fornecedor")
);

CREATE TABLE "departamento" (
  "id_departamento" integer,
  "setor" varchar(40),
  PRIMARY KEY ("id_departamento")
);

CREATE TABLE "deposito" (
  "id_deposito" integer,
  "endereco" varchar(200),
  PRIMARY KEY ("id_deposito")
);

CREATE TABLE "projeto" (
  "id_projeto" integer,
  "id_pecas" integer,
  "orcamento" real,
  "data_inicio" date,
  "horas_trabalhadas" time,
  PRIMARY KEY ("id_projeto")
);