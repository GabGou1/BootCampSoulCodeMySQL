CREATE DATABASE atividade140723;
USE atividade140723;

SELECT * FROM vendedor;
SELECT * FROM endereco;
SELECT * FROM categoria;
SELECT * FROM produto;

CREATE TABLE vendedor(
	idVendedor INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    dataNascimento DATE
);

CREATE TABLE endereco(
	idEndereco INTEGER PRIMARY KEY AUTO_INCREMENT,
    uf VARCHAR(2) NOT NULL,
    rua VARCHAR(200) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cidade VARCHAR(60) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    complemento VARCHAR(60),
    idVendedor INTEGER UNIQUE NOT NULL,
    FOREIGN KEY (idEndereco)
    REFERENCES vendedor(idVendedor)
);

CREATE TABLE categoria(
	idCategoria INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL
);

CREATE TABLE produto(
	idProduto INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    percentualDesconto DECIMAL(3,2) DEFAULT("0.0"),
    validadeDesconto DATE,
    estoque INTEGER NOT NULL,
    descricao VARCHAR(100) NOT NULL,
	idVendedor INTEGER NOT NULL,
    idCategoria INTEGER NOT NULL,
    FOREIGN KEY (idVendedor)
    REFERENCES vendedor(idVendedor),
    FOREIGN KEY (idCategoria)
    REFERENCES categoria(idCategoria)   
);

INSERT INTO vendedor (nome, sobrenome, email, dataNascimento)
VALUES 
    ('João', 'Silva', 'joao.silva@gmail.com', '1990-01-01'),
    ('Maria', 'Santos', 'maria.santos@hotmail.com', '1991-02-02'),
    ('Pedro', 'Ferreira', 'pedro.ferreira@yahoo.com', '1992-03-03'),
    ('Ana', 'Gomes', 'ana.gomes@outlook.com', '1993-04-04'),
    ('Lucas', 'Rodrigues', 'lucas.rodrigues@domain.com', '1994-05-05'),
    ('Laura', 'Almeida', 'laura.almeida@gmail.com', NULL),
    ('Carlos', 'Mendes', 'carlos.mendes@outlook.com', '1996-07-07'),
    ('Mariana', 'Fernandes', 'mariana.fernandes@yahoo.com', '1997-08-08'),
    ('Rafael', 'Pereira', 'rafael.pereira@domain.com', '1998-09-09'),
    ('Juliana', 'Lima', 'juliana.lima@gmail.com', NULL);

INSERT INTO endereco (uf, cidade, rua, cep, numero, idVendedor)
VALUES 
    ('SP', 'São Paulo', 'Avenida Paulista', '01310100', '1000', 1),
    ('RJ', 'Rio de Janeiro', 'Rua Copacabana', '22020001', '500', 2),
    ('MG', 'Belo Horizonte', 'Avenida Afonso Pena', '30130001', '200', 3),
    ('RS', 'Porto Alegre', 'Rua da Praia', '90010001', '300', 4),
    ('BA', 'Salvador', 'Avenida Oceânica', '40140130', '400', 5),
    ('SC', 'Florianópolis', 'Rua das Flores', '88010000', '100', 6),
    ('CE', 'Fortaleza', 'Avenida Beira Mar', '60170001', '200', 7),
    ('PR', 'Curitiba', 'Rua das Araucárias', '80010001', '300', 8),
    ('PE', 'Recife', 'Avenida Boa Viagem', '51011000', '400', 9),
    ('DF', 'Brasília', 'Rua das Palmeiras', '70070001', '500', 10);
    
INSERT INTO categoria (nome)
VALUES 
    ('Eletrônicos'),
    ('Roupas'),
    ('Alimentos'),
    ('Acessórios'),
    ('Móveis'),
    ('Beleza'),
    ('Livros'),
    ('Esportes'),
    ('Jogos'),
    ('Brinquedos');
    
INSERT INTO produto (nome, preco, descricao, percentualDesconto, validadeDesconto, estoque, idVendedor, idCategoria)
VALUES 
    ('Celular', 1500.00, 'Smartphone avançado', 0.0, NULL, 100, 1, 1),
    ('Camiseta', 29.99, 'Camiseta estampada', 0.2, '2023-07-13', 200, 2, 2),
    ('Arroz', 5.99, 'Arroz integral, pacote de 1kg', 0.1, '2023-07-12', 150, 3, 3),
    ('Colar', 49.99, 'Colar de pérolas', 0.3, '2023-07-08', 50, 4, 4),
    ('Sofá', 999.99, 'Sofá reclinável de couro', 0.4, '2023-07-11', 300, 5, 5),
    ('Perfume', 79.99, 'Perfume masculino', 0.1, '2023-07-09', 250, 6, 6),
    ('Livro', 19.99, 'Livro de fantasia', 0.2, '2023-07-07', 75, 7, 7),
    ('Bola', 9.99, 'Bola de basquete', 0.0, NULL, 125, 8, 8),
    ('PlayStation', 1999.99, 'Console de videogame', 0.4, '2023-07-06', 175, 9, 9),
    ('Quebra-Cabeça', 14.99, 'Quebra-Cabeça 1000 peças', 0.5, '2023-07-05', 225, 10, 10),
    ('Headphone', 99.99, 'Fone de ouvido sem fio', 0.3, '2023-07-15', 100, 1, 1),
    ('Vestido', 49.99, 'Vestido de festa longo', 0.2, '2023-07-15', 150, 2, 2),
    ('Chocolate', 4.99, 'Chocolate ao leite, barra de 100g', 0.1, '2023-07-15', 200, 3, 3),
    ('Relógio', 89.99, 'Relógio de pulso masculino', 0.0, NULL, 50, 4, 4),
    ('Cama', 799.99, 'Cama de casal com colchão', 0.4, '2023-07-15', 300, 5, 5),
    ('Maquiagem', 59.99, 'Kit de maquiagem profissional', 0.1, '2023-07-15', 250, 6, 6),
    ('Romance', 14.99, 'Livro de romance', 0.2, '2023-07-15', 75, 7, 7),
    ('Bicicleta', 149.99, 'Bicicleta urbana', 0.3, '2023-07-15', 125, 8, 8),
    ('Xbox', 1799.99, 'Console de videogame', 0.4, '2023-07-15', 175, 9, 9),
    ('Lego', 24.99, 'Kit de montar Lego', 0.5, '2023-07-15', 225, 10, 10);

-- Filtrar os produtos com preço maior que 500;
SELECT * FROM produto WHERE preco > 500;

-- Filtrar os produtos com preço entre 500 e 1000;
SELECT * FROM produto WHERE preco BETWEEN 500 AND 1000;

-- Filtrar os produtos do vendedor com ID = 7;
SELECT * FROM produto WHERE idVendedor = '7';

-- Filtrar os vendedores com email (@hotmail);
SELECT * FROM vendedor WHERE email LIKE '%@hotmail%';

-- Filtrar os produtos do vendedor com ID = 1 e calcular o preço do produto com desconto;
SELECT nome, descricao, percentualDesconto, preco - (preco * percentualDesconto) AS 'preco com desconto', idVendedor FROM produto WHERE idVendedor = '1'; 

-- Filtrar os produtos das categorias Roupas, Alimentos e Acessórios;
SELECT * FROM produto WHERE idCategoria IN (2,3,4);

-- Filtrar os vendedores que nasceram entre 1980 e 1990;
SELECT nome, year(dataNascimento) AS 'ano' FROM vendedor WHERE year(dataNascimento) > "1980" AND year(dataNascimento) <= "1990";

-- Filtrar os produtos que o desconto venceu mês passado;
SELECT * FROM produto WHERE month(validadeDesconto) < month(CURDATE());

-- Filtrar venda de eletrônicos de SP
SELECT produto.nome, produto.preco, produto.descricao, categoria.nome, vendedor.nome, endereco.uf FROM produto, categoria, vendedor, endereco WHERE produto.idVendedor = vendedor.idVendedor AND produto.idCategoria = categoria.idCategoria AND vendedor.idVendedor = endereco.idVendedor AND endereco.uf = 'SP' AND categoria.nome = 'Eletrônicos';