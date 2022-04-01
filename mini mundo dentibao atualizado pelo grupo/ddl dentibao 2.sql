CREATE TABLE "paciente" (
  "id_paciente" integer,
  "cpf" char(11),
  "nome_paciente" varchar(50),
  "data_nascimento" date,
  "endereco" varchar(200),
  "telefone" integer,
  PRIMARY KEY ("id_paciente")
);

CREATE TABLE "dentista" (
  "id_dentista" integer,
  "cro" integer,
  "nome_dentista" varchar(50),
  PRIMARY KEY ("id_dentista")
);

CREATE TABLE "senha" (
  "id_senha" integer,
  "id_paciente" integer,
  "id_atendente" integer,
  "numero" integer,
  "data_senha" date,
  "hora_senha" time,
  PRIMARY KEY ("id_senha")
);

CREATE TABLE "ficha de atendimento" (
  "id_atendimento" serial,
  "id_senha" integer,
  "data_atendimento" date,
  "motivo_consulta" varchar(200),
  "diagnostico" varchar(200),
  "receita_remedio" varchar(100),
  "solicita_retorno" varchar(50),
  PRIMARY KEY ("id_atendimento"),
  constraint fk_atendimento foreign key(id_senha) references senha(id_senha));

CREATE TABLE "atendente" (
  "id_atendente" integer,
  "nome_atendente" varchar(50),
  PRIMARY KEY ("id_atendente")
);