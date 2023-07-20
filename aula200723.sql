USE lojadb;

-- JOIN: Unir duas tabelas e juntar os registros que possuem relacionamentos.

SELECT *
FROM produto
    JOIN categoria
    ON fkCategoria = idCategoria;
    
SELECT produto.nome AS produto, preco, estoque, categoria.nome AS categoria
FROM produto
    JOIN categoria
    ON fkCategoria = idCategoria;
    
SELECT P.nome AS produto, C.nome AS categoria
FROM produto AS P
    JOIN categoria AS C
    ON P.fkCategoria = C.idCategoria
WHERE C.nome = "Livros";

SELECT V.nome, V.email, E.uf, E.cidade
FROM vendedor AS V
    JOIN endereco AS E
    ON E.fkVendedor = V.idVendedor
WHERE E.uf = "SP";

SELECT E.uf, COUNT(*) AS total
FROM vendedor AS V
    JOIN endereco AS E
    ON E.fkVendedor = V.idVendedor
GROUP BY E.uf;

SELECT *
FROM produto AS P
    JOIN vendedor AS V
    ON P.fkVendedor = V.idVendedor
    JOIN endereco AS E
    ON E.fkVendedor = V.idVendedor;

SELECT *
FROM produto AS P
    JOIN endereco AS E
    ON E.fkVendedor = P.fkVendedor; -- Junta as linhas onde o vendedor é o mesmo.

-- Q1: Quero filtrar os produtos dos estados CE, SP e MG E que estão acima de 10% de desconto.
SELECT P.nome AS produto, P.preco, P.percentualDesconto, E.uf
FROM produto AS P
    JOIN endereco AS E
    ON E.fkVendedor = P.fkVendedor
WHERE E.uf IN("CE", "SP", "MG") AND P.percentualDesconto > 0.10;

-- Q2: Conte quantos produtos cada vendedor possui
SELECT V.nome, V.sobrenome, COUNT(*) AS total_produtos
FROM produto AS P
    JOIN vendedor AS V
    ON P.fkVendedor = V.idVendedor
GROUP BY V.idVendedor;