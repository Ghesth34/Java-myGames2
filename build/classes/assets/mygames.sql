
-- Apaga e recria o banco de dados em "Momento de Desenvolvimento"
DROP DATABASE IF EXISTS myGames2;

-- Cria o banco de dados novamente
CREATE DATABASE myGames2 CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona o banco de dados
USE myGames2;

-- Tabela de usuários
CREATE TABLE users (
    u_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    u_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    u_name VARCHAR(128) NOT NULL COMMENT 'Nome que aparece no aplicativo',
    u_email VARCHAR(255) NOT NULL,
    u_password VARCHAR(30) NOT NULL,
    u_status ENUM('1', '0') DEFAULT '1'    
);

-- Tabela de plataformas
CREATE TABLE platforms (
    p_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    p_name VARCHAR(128) NOT NULL
);

-- Tabela de jogos
CREATE TABLE games (
    g_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    g_user INT,
    g_purchase DATE NOT NULL COMMENT 'Data da compra do título.',
    g_title VARCHAR (128) NOT NULL,
    g_description TEXT NOT NULL,
    g_media ENUM('F', 'D') NOT NULL DEFAULT 'F' COMMENT 'F = Física, D = Digital',
    g_platform INT NOT NULL,
    g_status ENUM('1', '0') DEFAULT '1',
    FOREIGN KEY (g_user) REFERENCES users(u_id),
    FOREIGN KEY (g_platform) REFERENCES platforms(p_id)
);

-- Populando a tabela users
INSERT INTO users 
    (u_name, u_email, u_password)
VALUE
    ('Joca da Silva', 'joca@silva.com', '12345');

-- Populando a tabela platforms
INSERT INTO platforms (p_name)
VALUES
    ('PC Windows'),
    ('PC Linux'),
    ('Playstation 4'),
    ('XBox One');