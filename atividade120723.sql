-- Criação do banco de dados e das tabelas

CREATE DATABASE atividade;
use atividade;

CREATE TABLE departamento(
	idDepartamento INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL
);

CREATE TABLE colaborador(
	idColaborador INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    salario DECIMAL(8, 2) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    fkDepartamento INTEGER NOT NULL,
    FOREIGN KEY (fkDepartamento) REFERENCES departamento(idDepartamento)
);

CREATE TABLE dependente(
	idDependente INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    dataNascimento DATE NOT NULL,
    fkColaborador INTEGER NOT NULL,
    FOREIGN KEY (fkColaborador) REFERENCES colaborador(idColaborador)
);

CREATE TABLE projeto(
	idProjeto INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    prazo DATE NOT NULL,
    orcamento DECIMAL(8, 2) NOT NULL
);

-- Criação dos dados
INSERT INTO departamento VALUES (null, "Marketing");

INSERT INTO departamento 
VALUES (NULL, "Financeiro");

INSERT INTO departamento 
VALUES (NULL, "Marketing");

INSERT INTO colaborador (idColaborador, nome, cpf, salario, telefone, fkDepartamento)
VALUES (NULL, "José Ferreira", "11111111111", 5500.0, "+5588972308020", 1);

INSERT INTO colaborador (idColaborador, nome, cpf, salario, telefone, fkDepartamento)
VALUES (NULL, "João Pedro", "11111111112", 6000.0, "+5588972308021", 2);

INSERT INTO dependente (idDependente, nome, dataNascimento, fkColaborador)
VALUES (NULL, "João", "2010-05-17", 1);

INSERT INTO dependente (idDependente, nome, dataNascimento, fkColaborador)
VALUES (NULL, "Mariazinha", "2011-06-02", 2);

INSERT INTO dependente (idDependente, nome, dataNascimento, fkColaborador)
VALUES (NULL, "João", "2009-09-28", 1);

INSERT INTO projeto (idProjeto, nome, prazo, orcamento)
VALUES (NULL, "Landing Page", "2024-01-15", 4500.0);

INSERT INTO projeto (idProjeto, nome, prazo, orcamento)
VALUES (NULL, "Ticket System", "2023-09-30", 5500.0);

INSERT INTO projeto (idProjeto, nome, prazo, orcamento)
VALUES (NULL, "Plataforma Finanças", "2024-02-01", 2100.0);

-- Tabela Relacionamento Colaborador-Projeto
CREATE TABLE rel_colaborador_projeto(
	idRel_Col_Proj INTEGER PRIMARY KEY AUTO_INCREMENT,
    fkColaborador INTEGER NOT NULL,
    fkProjeto INTEGER NOT NULL,
    FOREIGN KEY (fkColaborador) REFERENCES colaborador(idColaborador),
    FOREIGN KEY (fkProjeto) REFERENCES Projeto(idProjeto)
);

INSERT INTO rel_colaborador_projeto(idRel_Col_Proj, fkColaborador, fkProjeto)
VALUES (NULL, 2, 1);

SHOW TABLES;
SELECT * FROM departamento;
SELECT * FROM colaborador;
SELECT * FROM dependente;
SELECT * FROM projeto;
SELECT * FROM rel_colaborador_projeto;