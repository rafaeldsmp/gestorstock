DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS categoria;
DROP TABLE IF EXISTS fornecedor;
DROP TABLE IF EXISTS usuario;

CREATE TABLE categoria (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    descricao VARCHAR(255),
    categoria_foto VARCHAR(255)
);

CREATE TABLE fornecedor (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    cnpj VARCHAR(20),
    telefone VARCHAR(20),
    email VARCHAR(255)
);

CREATE TABLE produto (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    descricao VARCHAR(255),
    categoria_foto VARCHAR(255),
    preco DECIMAL(10,2),
    estoque_minimo INT,
    categoria_id BIGINT,
    fornecedor_id BIGINT,
    CONSTRAINT fk_produto_categoria FOREIGN KEY (categoria_id) REFERENCES categoria(id),
    CONSTRAINT fk_produto_fornecedor FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id)
);

CREATE TABLE usuario (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    senha VARCHAR(255),
    usuario_foto VARCHAR(255),
    email VARCHAR(255),
    data_aniversario DATE,
    roles VARCHAR(50)
);
