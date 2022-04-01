create table Cliente(
cod_cliente INTEGER not null primary key,
nome_cliente VARCHAR(100));

create table Apolice (
cod_apolice INTEGER not null primary key,
cod_cliente INTEGER,
valor_contratual INTEGER);

create table Carro (
cod_carro INTEGER not null primary key,
marca VARCHAR(50));

create table Sinistro (
cod_sinistro INTEGER not null primary key,
data_acidente DATE,
hora_acidente TIME);

create table Endereco (
cod_endereco_cliente INTEGER not null primary key,
lograd_cliente VARCHAR(200),
num_cliente INTEGER,
bairro_cliente VARCHAR(50),
cep_cliente VARCHAR(30),
complemento VARCHAR(100));

create table Endereco_sinistro (
cod_endereco_sinistro INTEGER not null primary key,
lograd_sinistro VARCHAR(200),
num_sinistro INTEGER,
bairro_sinistro VARCHAR(50),
cep_sinistro VARCHAR(30));
