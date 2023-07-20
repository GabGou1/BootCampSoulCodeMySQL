CREATE DATABASE minha_empresa;

USE minha_empresa;

CREATE TABLE departamento(
    idDepartamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(200)
);

CREATE TABLE colaborador(
    idColaborador INT PRIMARY KEY AUTO_INCREMENT,
    nomeCompleto VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    dataNasc DATE NOT NULL,
    idDepartamento INT NOT NULL,
    FOREIGN KEY (idDepartamento) REFERENCES departamento(idDepartamento)
);

CREATE TABLE endereco(
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(30) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(25) NOT NULL,
    complemento VARCHAR(50) DEFAULT("Sem complemento"),
    idColaborador INT UNIQUE NOT NULL,
    FOREIGN KEY (idColaborador) REFERENCES colaborador(idColaborador)
);

CREATE TABLE dependente(
    idDependente INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    dataNasc DATE NOT NUll,
    idResponsavel INTEGER NOT NULL,
    FOREIGN KEY(idResponsavel) REFERENCES colaborador(idColaborador)
);

CREATE TABLE projeto(
    idProjeto INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    prazo DATE NOT NULL,
    orcamento DECIMAL(10, 2) NOT NULL,
    descricao VARCHAR(140) NOT NULL
);

CREATE TABLE rel_colaborador_projeto(
    idRelacionamento INTEGER PRIMARY KEY AUTO_INCREMENT,
    dataEntrada DATE DEFAULT(CURRENT_DATE()),
    idcolaborador INTEGER NOT NULL,
    idProjeto INTEGER NOT NULL,
    FOREIGN KEY(idColaborador) REFERENCES colaborador(idColaborador),
    FOREIGN KEY(idProjeto) REFERENCES projeto(idProjeto)
);

-- Populate
INSERT INTO departamento (nome, descricao) VALUES
    ('RH', 'Departamento de Recursos Humanos'),
    ('TI', 'Departamento de Tecnologia da Informação'),
    ('Vendas', 'Departamento de Vendas');

INSERT INTO colaborador (nomeCompleto, email, salario, dataNasc, idDepartamento) VALUES
    ('João Silva', 'joao.silva@example.com', 5000.00, '1990-05-10', 1),
    ('Maria Souza', 'maria.souza@example.com', 6000.00, '1988-12-15', 1),
    ('Pedro Santos', 'pedro.santos@example.com', 5500.00, '1992-09-25', 2),
    ('Ana Oliveira', 'ana.oliveira@example.com', 5200.00, '1995-03-18', 3),
    ('Carlos Rocha', 'carlos.rocha@example.com', 4800.00, '1991-07-20', 2),
    ('Larissa Mendes', 'larissa.mendes@example.com', 4200.00, '1993-02-05', 3),
    ('Rafael Costa', 'rafael.costa@example.com', 5300.00, '1989-11-12', 1),
    ('Juliana Almeida', 'juliana.almeida@example.com', 4600.00, '1994-09-30', 3);

INSERT INTO endereco (cidade, uf, rua, numero, complemento, idColaborador) VALUES
    ('São Paulo', 'SP', 'Av. Paulista', '1000', 'Apto 501', 1),
    ('Rio de Janeiro', 'RJ', 'Rua Copacabana', '500', '', 2),
    ('Porto Alegre', 'RS', 'Av. Ipiranga', '200', 'Sala 302', 3),
    ('Belo Horizonte', 'MG', 'Rua da Liberdade', '150', 'Casa 10', 4),
    ('São Paulo', 'SP', 'Rua Augusta', '300', 'Apto 1002', 5),
    ('Porto Alegre', 'RS', 'Av. Bento Gonçalves', '800', '', 6),
    ('Rio de Janeiro', 'RJ', 'Rua Ipanema', '700', 'Sala 101', 7),
    ('Belo Horizonte', 'MG', 'Av. Amazonas', '250', 'Casa 20', 8);

INSERT INTO dependente (nome, dataNasc, idResponsavel) VALUES
    ('Carlos Silva', '2010-03-12', 1),
    ('Camila Souza', '2012-08-25', 2),
    ('Paula Santos', '2015-11-05', 3),
    ('Pedro Rocha', '2013-09-18', 5),
    ('Isabella Mendes', '2017-04-03', 6),
    ('Gustavo Costa', '2019-11-25', 7),
    ('Sophia Almeida', '2021-03-08', 8);

INSERT INTO projeto (nome, prazo, orcamento, descricao) VALUES
    ('Projeto A', '2023-09-30', 100000.00, 'Desenvolvimento de um novo software'),
    ('Projeto B', '2023-08-15', 80000.00, 'Implementação de um sistema de gestão'),
    ('Projeto C', '2023-10-31', 120000.00, 'Construção de um aplicativo móvel'),
    ('Projeto D', '2023-12-31', 90000.00, 'Implementação de um sistema de segurança'),
    ('Projeto E', '2023-11-15', 70000.00, 'Desenvolvimento de um aplicativo web'),
    ('Projeto F', '2023-12-31', 110000.00, 'Melhoria da infraestrutura de rede');

INSERT INTO rel_colaborador_projeto (dataEntrada, idColaborador, idProjeto) VALUES
    ('2023-06-01', 1, 1),
    ('2023-06-01', 2, 1),
    ('2023-07-01', 3, 2),
    ('2023-07-01', 4, 3),
    ('2023-06-01', 5, 2),
    ('2023-06-01', 6, 2),
    ('2023-07-01', 7, 3),
    ('2023-07-01', 8, 1);
    
SELECT * FROM departamento;
SELECT * FROM colaborador;
SELECT * FROM dependente;
SELECT * FROM projeto;
SELECT * FROM rel_colaborador_projeto;
SELECT * FROM endereco;

-- Liste os nomes dos dependentes dos colaboradores que trabalham no departamento RH.
SELECT C.nomeCompleto, D.nome FROM departamento AS D
	JOIN colaborador AS C
    ON D.idDepartamento = C.idDepartamento
WHERE D.nome = "RH";

-- Liste os nomes dos colaboradores do estado do Rio de Janeiro.
SELECT C.nomeCompleto, E.cidade FROM colaborador AS C
	JOIN endereco AS E
    ON C.idColaborador = E.idColaborador
WHERE E.uf = "RJ";

-- Mostre a média do orçamento dos projetos.
SELECT AVG(orcamento) AS media_orcamento FROM projeto;

-- Mostre o maior orçamento e o menor orçamento.
SELECT MAX(orcamento) AS maior_orcamento, MIN(orcamento) AS menor_orcamento FROM projeto;

-- Mostre a soma total do orçamento de todos os projetos.
SELECT SUM(orcamento) AS soma_orcamento FROM projeto;

-- Liste os dependentes que nasceram antes de 2015.
SELECT nome, dataNasc FROM dependente WHERE YEAR(dataNasc) < 2015;

-- Liste os dependentes que fazem aniversário no mês atual.
SELECT nome, dataNasc FROM dependente WHERE MONTH(dataNasc) = MONTH(CURDATE());

-- Liste os nomes dos dependentes do colaborador de ID = 1.
SELECT * FROM dependente WHERE idResponsavel = 1;

-- Mostre quantas pessoas estão alocadas em cada projeto da empresa. 
SELECT R.idProjeto, COUNT(*) AS pessoas_projetos FROM rel_colaborador_projeto AS R
	JOIN projeto AS P
    ON R.idProjeto = P.idProjeto
    GROUP BY R.idProjeto;

-- Mostre os 2 projetos com prazo mais próximo.
SELECT nome, prazo FROM projeto WHERE prazo >= CURDATE() ORDER BY prazo LIMIT 2;

-- Liste os dependentes com responsável que mora em SP.
SELECT D.nome, E.uf FROM endereco AS E
	JOIN dependente AS D
    ON E.idColaborador = D.idResponsavel
WHERE E.uf = "SP";

-- Liste os colaboradores que ganham acima de 5000 e estão em um dos projetos a seguir (A, B ou C).
SELECT C.nomeCompleto, C.salario FROM colaborador AS C
	JOIN rel_colaborador_projeto AS R 
    ON C.idColaborador = R.idColaborador
	JOIN projeto AS P
    ON R.idProjeto = P.idProjeto
WHERE C.salario >= 5000 AND P.nome IN ('Projeto A', 'Projeto B', 'Projeto C');

-- Indique a média salarial dos colaboradores.
SELECT ROUND(AVG(salario), 2) AS media_salarial FROM colaborador;

-- Aumente o salario em 10% de quem nasceu antes de 1990.
SELECT salario, dataNasc, salario + (salario * 0.1) AS salario_atualizado FROM colaborador
WHERE YEAR(dataNasc) < 1990;

-- Liste quantos colaboradores existem em cada estado na tabela.
SELECT E.uf, COuNT(*) AS uf_colaboradores FROM colaborador AS C
	JOIN endereco AS E
    ON C.idColaborador = E.idColaborador
GROUP BY E.uf;