-- Aula 11/07
-- COMANDOS BÁSICOS
-- REGRA SQL 1: MAIUSCULO NOS COMANDOS
-- REGRA SQL 2: MINÚSCULO EM OUTROS VALORES

SHOW DATABASES; -- listar os bancos disponíveis

CREATE DATABASE empresa_db; -- cria um banco de dados com o nome especificado

USE empresa_db; -- seleciona o banco para rodar os comandos

SHOW TABLES; -- mostra as tabelas do banco selecionado

DROP DATABASE empresa_db; -- apaga TUDO (tabelas, dados, etc)

CREATE TABLE departamento(
	-- <nome da coluna> <tipo> <constraints>
    idDepartamento INTEGER PRIMARY KEY AUTO_INCREMENT,  -- PRIMARY KEY = chave primária, AUTO_INCREMENT = id automático
    nome VARCHAR(150) NOT NULL, -- NOT NULL = torna a coluna obrigatória
    descricao VARCHAR(200)
);

-- TIPOS DE DADOS
	-- INT/INTEGER = até 2 bilhões
    -- BIGINT = até 9 quintilhões
    -- DECIMAL = valores decimais exatos
    -- FLOAT = até 7 casas de precisão
    -- DOUBLE = até 15 casas de precisão
    -- VARCHAR = string
    -- TEXT = textos muito longos
    -- DATE = formato YYYY-MM-DD
    -- TIME = formato hh:mm:ss
    -- DATETIME = formato YYYY-MM-DD hh:mm:ss
    -- BLOB = arquivos (binary large object)
    
-- Aula 12/07
-- CONSTRAINTS; CHAVE ESTRANGEIRA; INSERT; UPDATE; DELETE;

CREATE TABLE colaborador(
	idColaborador INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    salario DECIMAL(8, 2) NOT NULL, -- Oito dígitos e 2 de precisão
    telefone VARCHAR(20) UNIQUE NOT NULL,
    dataNascimento DATE NOT NULL,
    fkDepartamento INTEGER NOT NULL,
    FOREIGN KEY(fkDepartamento) -- Coluna que será a chave estrangeira
    REFERENCES departamento(idDepartamento) -- Chave primária da outra tabela
);

DROP TABLE colaborador; -- Apaga a tabela e todos os registros dela

SHOW TABLES;
DESCRIBE colaborador; -- Mostra a estrutura da tabela

CREATE TABLE endereco(
	idEndereco INTEGER PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(30) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    rua VARCHAR(40) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    -- Usa "Sem complemento" caso não definirmos um valor específico
    complemento VARCHAR(40) DEFAULT("Sem complemento"),
    fkColaborador INTEGER UNIQUE NOT NULL, -- Impede que o ID do colaborador seja repetido (1:1)
    FOREIGN KEY(fkColaborador)
    REFERENCES colaborador(idColaborador)
);

SHOW TABLES;
DESCRIBE endereco;

-- Listar dados de uma tabela
SELECT * FROM departamento;
SELECT * FROM colaborador;
SELECT * FROM endereco;

INSERT INTO departamento 
VALUES (NULL, "Recursos Humanos", NULL);

INSERT INTO departamento 
VALUES (NULL, "Marketing", "Faz marketing");

INSERT INTO colaborador
VALUES (NULL, "José Ferreira", "11111111111", 5500.0, "+5588972308020", "1980-01-28", 1);

INSERT INTO colaborador
VALUES (NULL, "João Pedro", "11111111113", 6000.0, "+5588972308022", "1980-01-28", 1);

INSERT INTO endereco 
VALUES (NULL, "Ubajara", "CE", "Rua X", "200", NULL, 1);

INSERT INTO endereco 
VALUES (NULL, "Tianguá", "CE", "Rua Y", "235", NULL, 3);

-- Aula 13/07/2023
UPDATE departamento 
SET descricao = "Faz o gerenciamento de recursos humanos"; -- Perigo faz a atualização de todas as variáveis da linha

UPDATE departamento 
SET descricao = "Faz o gerenciamento de recursos humanos"
WHERE idDepartamento = 1; -- WHERE indica uma condição para aplicar a atualização

DELETE FROM endereco; -- CUIDADO, apaga todas as linhas sem critério

DELETE FROM colaborador WHERE idColaborador = 9; -- Vai apagar somente o registro com id 3
DELETE FROM departamento WHERE idDepartamento = 1; -- Só podemos apagar registros que não tem vínculo com outros registros de outras tabelas

-- INSERT; UPDATE; SELECT; DELETE