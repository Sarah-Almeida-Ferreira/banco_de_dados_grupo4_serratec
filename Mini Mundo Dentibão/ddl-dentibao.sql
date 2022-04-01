create table Paciente (
id_paciente INTEGER not null primary key,
nome_paciente VARCHAR(100),
cpf_ CHAR(11),
data_nascimento DATE,
endereco VARCHAR(200),
telefone INTEGER);

create table Atendente (
id_atendente INTEGER not null primary key,
id_paciente INTEGER not null,
id_senha INTEGER not null,
nome_atendente VARCHAR(100));

create table Senha(
id_senha INTEGER not null primary key,
num_senha INTEGER,
data_senha DATE,
hora_senha TIME);

insert into Senha (
id_senha, 
num_senha, 
data_senha, 
hora_senha) values(1, 1, '2022-04-01', '09:10:54');

create table Ficha_de_Atendimento(
id_ficha INTEGER not null primary key,
id_paciente INTEGER,
id_atendente INTEGER,
id_senha INTEGER,
id_dentista INTEGER,
data_atendimento DATE,
motivo_consulta VARCHAR(200),
diagnostico VARCHAR(200),
receita_remedios VARCHAR(200),
solicitacao_retorno VARCHAR(100));

create table Dentista (
id_dentista INTEGER not null primary key,
cro_dentista CHAR(11),
nome_dentista VARCHAR(100));


