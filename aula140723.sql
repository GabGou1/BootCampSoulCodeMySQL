CREATE DATABASE loja_db;

USE loja_db;

-- Schema => Estrutura de tabelas e colunas
CREATE TABLE vendedor(
	idVendedor INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    dataNascimento DATE
);

DROP TABLE vendedor; -- Apaga todos os registros e o Scheam da tabela

-- categoria - VARCHAR(30) NOT NULL

ALTER TABLE vendedor
ADD COLUMN cat VARCHAR(30) NOT NULL DEFAULT("Sem categoria");