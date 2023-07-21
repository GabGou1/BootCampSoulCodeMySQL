-- Criação das tabelas
CREATE DATABASE spotify;
USE spotify;

CREATE TABLE usuarios(
	idUsuarios INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(50) NOT NULL
);

CREATE TABLE artistas(
	idArtistas INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    nMusicas INTEGER NOT NULL,
    nSeguidores INTEGER
);

CREATE TABLE usuarios_artistas(
	idUsAt INTEGER PRIMARY KEY AUTO_INCREMENT,
    fkUsuarios INTEGER,
    fkArtistas INTEGER,
    FOREIGN KEY (fkUsuarios) REFERENCES usuarios(idUsuarios) ON DELETE CASCADE,
    FOREIGN KEY (fkArtistas) REFERENCES artistas(idArtistas) ON DELETE CASCADE
);

CREATE TABLE albuns(
	idAlbuns INTEGER PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    dataLancamento DATE NOT NULL,
    fkArtistas INTEGER,
    FOREIGN KEY (fkArtistas) REFERENCES artistas(idArtistas)
);

CREATE TABLE musicas(
	idMusicas INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    nDownloads INTEGER,
    genero VARCHAR(100) NOT NULL,
    dataLancamento DATE NOT NULL,
    fkAlbuns INTEGER,
    FOREIGN KEY (fkAlbuns) REFERENCES albuns(idAlbuns)
);

CREATE TABLE playlist(
	idPlaylist INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(500),
    dataCriacao DATE NOT NULL,
    fkUsuarios INTEGER,
    FOREIGN KEY (fkUsuarios) REFERENCES usuarios(idUsuarios)
);

CREATE TABLE playlist_musicas(
	idPlayMusic INTEGER PRIMARY KEY AUTO_INCREMENT,
    fkMusicas INTEGER,
    fkPlaylist INTEGER,
    FOREIGN KEY (fkMusicas) REFERENCES musicas(idMusicas) ON DELETE CASCADE,
    FOREIGN KEY (fkPlaylist) REFERENCES playlist(idPlaylist) ON DELETE CASCADE
);

-- Populate
INSERT INTO usuarios (nome, email, senha)
VALUES ('João da Silva', 'joao.silva@example.com', 'senha123'),
       ('Maria Oliveira', 'maria.oliveira@example.com', 'minhasenha'),
       ('Carlos Santos', 'carlos.santos@example.com', 'senhasegura');
INSERT INTO artistas (nome, nMusicas, nSeguidores)
VALUES ('Artista A', 10, 5000),
       ('Artista B', 5, 2000),
       ('Artista C', 15, 10000);
INSERT INTO usuarios_artistas (fkUsuarios, fkArtistas)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (3, 3);
INSERT INTO albuns (titulo, dataLancamento, fkArtistas)
VALUES ('Álbum X', '2023-01-15', 1),
       ('Álbum Y', '2022-08-22', 2),
       ('Álbum Z', '2023-03-10', 3);
INSERT INTO musicas (nome, nDownloads, genero, dataLancamento, fkAlbuns)
VALUES ('Música 1', 1000, 'Pop', '2023-01-15', 1),
       ('Música 2', 800, 'Rock', '2022-08-22', 2),
       ('Música 3', 500, 'Eletrônica', '2023-03-10', 3),
       ('Música 4', 1200, 'Pop', '2023-01-15', 1);
INSERT INTO playlist (nome, descricao, dataCriacao, fkUsuarios)
VALUES ('Minha Playlist', 'Uma playlist legal', '2023-05-10', 1),
       ('Músicas Favoritas', 'Minhas músicas preferidas', '2023-07-01', 2),
       ('Playlist de Verão', 'Músicas para curtir o verão', '2023-06-15', 3);
INSERT INTO playlist_musicas (fkMusicas, fkPlaylist)
VALUES (1, 1),
       (2, 1),
       (3, 2),
       (4, 3);

SHOW TABLES;
SELECT * FROM usuarios;
SELECT * FROM artistas;
SELECT * FROM usuarios_artistas;
SELECT * FROM albuns;
SELECT * FROM musicas;
SELECT * FROM playlist;
SELECT * FROM playlist_musicas;

-- Comandos DML e DQL
-- Inserir dados
INSERT INTO artistas (idArtistas, nome, nMusicas, nSeguidores)
VALUES (NULL, "Artista D", 25, 3000);

-- Atualizar de acordo com o WHERE
UPDATE musicas
SET nome = "Hantengu"
WHERE idMusicas = 1;

-- Deletar uma tabela, ou coluna de acordo com WHERE
DELETE FROM artistas
WHERE idArtistas = 4;

-- Quem cada usuário segue
SELECT U.nome AS Usuario, A.nome AS Artista FROM usuarios AS U
	JOIN usuarios_artistas AS UA
    ON U.idUsuarios = UA.fkUsuarios
    JOIN artistas AS A
    ON A.idArtistas = UA.fkArtistas
GROUP BY U.nome, A.nome;

-- Quantas musicas cada playlist tem
SELECT P.nome AS Playlist, COUNT(M.idMusicas) AS Quantidade_Musica FROM playlist AS P
	JOIN  playlist_musicas AS PM
    ON P.idPlaylist = PM.fkPlaylist
    JOIN musicas AS M
    ON M.idMusicas = PM.fkMusicas
GROUP BY P.nome;

-- Ordena as musicas por ordem de lançamento
SELECT nome, dataLancamento FROM musicas ORDER BY dataLancamento;

-- Menor e maior quantidade de seguidores dos artistas
SELECT MIN(nSeguidores) AS Menor_Quantidade_Seguidores, MAX(nSeguidores) AS Maior_Quantidade_Seguidores FROM artistas;

-- Soma de todos os seguidores dos artistas
SELECT SUM(nSeguidores) AS Seguidores_Somados FROM artistas;

-- Mostra os albuns com a quantidade igual ou maior de dez músicas
SELECT Al.titulo, A.nome FROM albuns AS Al
	JOIN artistas AS A
    ON Al.fkArtistas = A.idArtistas
WHERE A.nMusicas >= 10;

-- Mostra todas as playlists com nomes diferentes
SELECT DISTINCT nome FROM playlist;

-- Comandos que eu não irei utilizar para não apagar os dados
-- TRUNCATE TABLE "nome"; apagar somente os elementos dentro da tabela
-- DROP TABLE/DATABASE "nome"; derruba todo o objeto referenciado
