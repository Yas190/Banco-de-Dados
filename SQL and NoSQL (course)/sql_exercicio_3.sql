CREATE DATABASE exercicio_3;

USE exercicio_3;

CREATE TABLE tipos_produtos(
codigo INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(30) NOT NULL,
PRIMARY KEY (codigo)
);

CREATE TABLE produtos(
codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(30) NOT NULL,
preco DECIMAL(8,2) NOT NULL,
codigo_tipo INT NOT NULL,
FOREIGN KEY (codigo_tipo) REFERENCES tipos_produtos(codigo)
);

INSERT INTO tipos_produtos(descricao) VALUES ('Computadores');
INSERT INTO tipos_produtos(descricao) VALUES ('Impressoras');

INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Desktop', 1200, 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Laptop', 1800, 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impressora Jato de Tinta', 300, 2);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impressora Laser', 500, 2);

SELECT * FROM tipos_produtos;

SELECT * FROM produtos;

SELECT descricao, preco 
FROM produtos;

SELECT tp.codigo AS Código, tp.descricao AS Descrição
FROM tipos_produtos AS tp;

INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Notebook', 1200, 1);
INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Macbook Pro', 7500, 3);

INSERT INTO tipos_produtos(descricao) VALUES ('Apple');

INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Macbook Air', 5200, 3);

DELETE FROM produtos WHERE codigo = 7;
DELETE FROM produtos WHERE codigo = 6;

UPDATE produtos SET preco = 650 WHERE codigo = 4;

