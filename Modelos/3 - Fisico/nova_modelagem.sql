-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE adm (
pk_adm INT(10) PRIMARY KEY,
nome VARCHAR(150),
email VARCHAR(150),
senha VARCHAR(150)
)

CREATE TABLE pagamento (
pk_pag INT(10) PRIMARY KEY,
forma_pag VARCHAR(7),
valor_pag DECIMAL(6,2),
fk_passagem INT(10)
)

CREATE TABLE cadastro (
pk_cadastro INT(10) PRIMARY KEY,
email VARCHAR(150),
senha VARCHAR(100),
cpf CHAR(11),
fk_cliente INT(10)
)

CREATE TABLE rg (
pk_rg INT(10) PRIMARY KEY,
rg CHAR(9),
emissao_rg DATETIME,
fk_cliente INT(10)
)

CREATE TABLE contato_cliente (
pk_contato INT(10) PRIMARY KEY,
telefone CHAR(10),
celular VARCHAR(11),
fk_cliente INT(10)
)

CREATE TABLE passagem (
pk_passagem INT(10) PRIMARY KEY,
sobrenome VARCHAR(150),
nome VARCHAR(150),
cpf_passagem CHAR(11),
poltrona CHAR(3),
classe CHAR(2),
fk_cliente INT(10)
)

CREATE TABLE aviao (
pk_aviao INT(10) PRIMARY KEY,
num_serie CHAR(5),
modelo VARCHAR(100),
num_assento CHAR(3),
fk_passagem INT(10),
FOREIGN KEY(fk_passagem) REFERENCES passagem (pk_passagem)
)

CREATE TABLE cliente (
pk_cliente INT(10) PRIMARY KEY,
sobrenome VARCHAR(150),
nome VARCHAR(150),
data_nasci DATETIME
)

CREATE TABLE msg_cliente (
pk_msg INT(10) PRIMARY KEY,
email VARCHAR(150),
msg VARCHAR(150)
)

CREATE TABLE endereco (
pk_endereco INT(10) PRIMARY KEY,
cep CHAR(8),
rua VARCHAR(150),
numero INT(10),
bairro VARCHAR(100),
cidade VARCHAR(100),
uf CHAR(2),
fk_cliente INT(10),
FOREIGN KEY(fk_cliente) REFERENCES cliente (pk_cliente)
)

CREATE TABLE aeroportos (
pk_aeroportos INT(10) PRIMARY KEY,
lista_aeroportos VARCHAR(100)
)

CREATE TABLE gestao_voo (
pk_voo INT(10) PRIMARY KEY,
local_voo VARCHAR(150),
local_pouso VARCHAR(150),
hora_partida DATETIME,
hora_chegada DATETIME,
fk_aviao INT(10)/*falha: chave estrangeira*/
)

ALTER TABLE pagamento ADD FOREIGN KEY(fk_passagem) REFERENCES passagem (pk_passagem)
ALTER TABLE cadastro ADD FOREIGN KEY(fk_cliente) REFERENCES cliente (pk_cliente)
ALTER TABLE rg ADD FOREIGN KEY(fk_cliente) REFERENCES cliente (pk_cliente)
ALTER TABLE contato_cliente ADD FOREIGN KEY(fk_cliente) REFERENCES cliente (pk_cliente)
ALTER TABLE passagem ADD FOREIGN KEY(fk_cliente) REFERENCES cliente (pk_cliente)
