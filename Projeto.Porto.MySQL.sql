CREATE DATABASE spotify;
USE spotify;

SHOW TABLES;
SELECT * FROM usuarios;
SELECT * FROM artistas;
SELECT * FROM usuarios_artistas;
SELECT * FROM albuns;
SELECT * FROM musicas;
SELECT * FROM playlist;
SELECT * FROM playlist_musicas;

CREATE TABLE usuarios(
	idUsuarios INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(10) NOT NULL
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
    genero VARCHAR(50) NOT NULL,
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