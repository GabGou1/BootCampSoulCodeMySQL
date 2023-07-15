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
SELECT * FROM vendedor;
DESCRIBE vendedor;

INSERT INTO vendedor(idVendedor, nome, sobrenome, email, dataNascimento)
VALUES (NULL, "José", "Almir", "jose.almir@geail.com", "1990-01-01");
INSERT INTO vendedor(idVendedor, nome, sobrenome, email, dataNascimento)
VALUES (NULL, "Maria", "Souza", "maria.souza@geail.com", "1992-06-08");

-- Nova coluna
ALTER TABLE vendedor
ADD COLUMN cat VARCHAR(30) NOT NULL DEFAULT("Sem categoria");

-- Renomear coluna
ALTER TABLE vendedor
CHANGE cat categoria VARCHAR(30) NOT NULL DEFAULT("Sem categoria");

-- Alterar constraints
ALTER TABLE vendedor
MODIFY nome VARCHAR(75) NOT NULL;

-- Remover coluna
ALTER TABLE vendedor
DROP COLUMN dataNascimento;

-- Renomear tabela
ALTER TABLE vendedor
RENAME vendedores;

SELECT * FROM vendedores;

-- Renomear coluna sem alterar constraints
ALTER TABLE vendedores
RENAME COLUMN categoria TO cat;

DELETE FROM vendedores WHERE idVendedor = 2;

UPDATE vendedores SET cat = "Tecnologia" WHERE idVendedor = 1;