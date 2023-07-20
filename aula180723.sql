CREATE DATABASE companhias_db;

USE companhias_db;

CREATE TABLE companhia(
    idCompanhia INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    pais VARCHAR(2) NOT NULL,
    lucro DOUBLE NOT NULL,
    filiais INTEGER NOT NULL,
    ramo VARCHAR(30) NOT NULL
);

INSERT INTO companhia (nome, cidade, pais, lucro, filiais, ramo) VALUES
('Engenex', 'São Paulo', 'BR', 1000000.00, 3, 'Engenharia'),
('TechMed', 'Rio de Janeiro', 'BR', 500000.50, 2, 'Saúde'),
('InnoTech', 'Nova York', 'US', 2000000.75, 5, 'Tecnologia'),
('EvoEng', 'Londres', 'UK', 1500000.25, 4, 'Engenharia'),
('HealthWave', 'Berlim', 'DE', 800000.90, 1, 'Saúde'),
('InnovaHealth', 'Paris', 'FR', 1200000.60, 3, 'Saúde'),
('DigitalEng', 'Toronto', 'CA', 900000.40, 2, 'Engenharia'),
('TechCare', 'São Francisco', 'US', 3000000.80, 6, 'Saúde'),
('TechSolutions', 'Sydney', 'AU', 2500000.70, 4, 'Tecnologia'),
('EngiCore', 'Tóquio', 'JP', 1800000.45, 3, 'Engenharia'),
('MedInno', 'Madri', 'ES', 600000.30, 2, 'Saúde'),
('ElevateHealth', 'Cidade do México', 'MX', 700000.35, 2, 'Saúde'),
('EngiTech', 'Moscou', 'RU', 400000.20, 1, 'Engenharia'),
('TechWellness', 'Lisboa', 'PT', 1500000.55, 3, 'Saúde'),
('EngiSolutions', 'Chicago', 'US', 2800000.65, 5, 'Engenharia'),
('ApexHealth', 'Melbourne', 'AU', 1100000.50, 3, 'Saúde'),
('MindCare', 'Nova Delhi', 'IN', 500000.25, 2, 'Saúde'),
('TechMedic', 'Bangcoc', 'TH', 900000.60, 2, 'Saúde'),
('InnoTech', 'Amsterdã', 'NL', 1200000.75, 4, 'Tecnologia'),
('EngiPro', 'Seul', 'KR', 750000.40, 3, 'Engenharia'),
('HealthSolutions', 'Cidade do Cabo', 'ZA', 650000.35, 2, 'Saúde'),
('TechWell', 'Miami', 'US', 1400000.55, 4, 'Tecnologia'),
('AgileEng', 'São Petersburgo', 'RU', 950000.30, 2, 'Engenharia'),
('EngiCorp', 'Toronto', 'CA', 2200000.70, 5, 'Engenharia'),
('TechGen', 'Xangai', 'CN', 1800000.65, 4, 'Tecnologia'),
('FutureHealth', 'Sidney', 'AU', 400000.20, 1, 'Saúde'),
('MindTech', 'Cidade do México', 'MX', 1000000.40, 3, 'Tecnologia'),
('EngiSys', 'Mumbai', 'IN', 3000000.75, 6, 'Engenharia'),
('TechEng', 'Bangalore', 'IN', 700000.30, 2, 'Engenharia'),
('HealthTech', 'Pequim', 'CN', 2500000.60, 4, 'Saúde'),
('EvoMed', 'São Francisco', 'US', 600000.50, 2, 'Saúde'),
('InnoHealth', 'Cairo', 'EG', 350000.25, 1, 'Saúde'),
('DigitalEng', 'Hamburgo', 'DE', 1800000.70, 4, 'Engenharia'),
('TechMed', 'Cidade do Cabo', 'ZA', 1200000.35, 3, 'Saúde'),
('EngiCode', 'Los Angeles', 'US', 900000.45, 2, 'Engenharia'),
('TechMed', 'Vancouver', 'CA', 500000.20, 1, 'Saúde'),
('EngiWave', 'Pequim', 'CN', 700000.40, 2, 'Engenharia'),
('HealthSolutions', 'Munique', 'DE', 1500000.55, 3, 'Saúde'),
('AgileMed', 'Cidade do México', 'MX', 2800000.65, 5, 'Saúde'),
('FutureEng', 'Tóquio', 'JP', 1100000.50, 3, 'Engenharia'),
('TechHealth', 'Sydney', 'AU', 500000.25, 2, 'Saúde'),
('EngiCore Solutions', 'Bangalore', 'IN', 1000000.60, 3, 'Engenharia'),
('TechMax', 'Berlim', 'DE', 800000.75, 2, 'Tecnologia'),
('EvoTech Solutions', 'Nova York', 'US', 1200000.40, 3, 'Tecnologia'),
('DigitalSolutions', 'Londres', 'UK', 650000.35, 2, 'Tecnologia'),
('EngiWave', 'Toronto', 'CA', 1400000.55, 4, 'Engenharia'),
('HealthTech', 'Xangai', 'CN', 950000.30, 2, 'Saúde'),
('TechVortex', 'Amsterdã', 'NL', 2200000.70, 4, 'Tecnologia'),
('EngiByte', 'Los Angeles', 'US', 1800000.65, 3, 'Engenharia'),
('FuturaSolutions', 'Sidney', 'AU', 400000.20, 1, 'Tecnologia'),
('MindMed', 'Bangcoc', 'TH', 1000000.40, 2, 'Saúde'),
('InnovaTech Solutions', 'Paris', 'FR', 3000000.75, 5, 'Tecnologia'),
('TechFlex', 'Miami', 'US', 700000.30, 2, 'Tecnologia'),
('AgileCore', 'São Petersburgo', 'RU', 2500000.60, 4, 'Engenharia'),
('InnoSys Solutions', 'Lisboa', 'PT', 600000.50, 2, 'Tecnologia');

-- Aula 18.07
-- Função de agregação; agrupamento; junção
SELECT * FROM companhia;

SELECT *
FROM companhia
WHERE ramo = "Saúde";

-- Função de agregação
SELECT COUNT(*) AS total_companhias
FROM companhia; -- COUNT -> Conta quantos registros existem na consulta

SELECT AVG(lucro) AS media_lucro -- Média Average
FROM companhia;

SELECT SUM(lucro) AS total_lucro -- Soma tudo
FROM companhia;

SELECT MAX(lucro) AS maior_lucro -- Mostra o maior lucro
FROM companhia;

SELECT MIN(lucro) AS menor_lucro -- Mostra o menor lucro
FROM companhia;

SELECT COUNT(*) AS total_tecnologia
FROM companhia
WHERE ramo = "Tecnologia"; -- Seleciona o numero total de impresas de tecnologia

-- Agrupamento
SELECT pais, COUNT(*) AS total_empresas -- COUNT -> é aplicado em cada grupo gerado pelo GROUP BY
FROM companhia
GROUP BY pais;

SELECT *
FROM companhia
WHERE pais = "US";

SELECT pais, COUNT(*) AS total_empresas
FROM companhia
GROUP BY pais
ORDER BY total_empresas DESC
LIMIT 5;

SELECT ramo, COUNT(*) AS total_companhias
FROM companhia
GROUP BY ramo
ORDER BY total_companhias DESC;

SELECT pais, ramo, COUNT(*) AS total
FROM companhia
GROUP BY pais, ramo -- Montar grupos a partir de multiplas colunas
ORDER BY pais;

-- Mostrar os países e os lucros de cada país que tem lucro
SELECT pais, SUM(lucro) AS lucro_pais
FROM companhia
GROUP BY pais
HAVING lucro_pais > 4500000 -- Filtra o agrupamento apartir de uma coluna que não está na tabela
ORDER BY lucro_pais DESC;