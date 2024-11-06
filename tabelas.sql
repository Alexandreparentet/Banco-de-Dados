-- Cria a tabela usuário
CREATE TABLE usuario (
    -- campo        -- tipo         -- restrições 
    id_usuario      int             NOT NULL    AUTO_INCREMENT,
    nome            varchar(30)     NOT NULL,
    email           varchar(100)    NOT NULL    UNIQUE,
    senha           varchar(100)    NOT NULL,
    fone1           varchar(20)     NOT NULL,
    fone2           varchar(20)     NULL,
    foto            varchar(255)    NULL,
    PRIMARY KEY (id_usuario)
);

-- Cria a tabela produto
CREATE TABLE produto (
    -- campo        -- tipo         -- restrições 
    id_produto      int             NOT NULL    AUTO_INCREMENT,
    produto         varchar(30)     NOT NULL,
    descricao       text            NOT NULL,    
    valor           decimal(10,2)   NOT NULL,
    estoque         int(6)          NOT NULL,
    foto            varchar(255)    NULL,
    PRIMARY KEY (id_produto)
);

-- Cria a tabela venda
CREATE TABLE venda (
    -- campo        -- tipo         -- restrições 
    id_venda      int               NOT NULL    AUTO_INCREMENT,
    total         decimal(10,2)     NOT NULL,
    quantidade    int(6)            NOT NULL,    
    forma_pagto   varchar(50)       NOT NULL,
    data_venda    DATE              NOT NULL,
    endereco_entrega    varchar(255)    NULL,
    -- Chave Estrangeira (FK)
    id_usuario    int               NOT NULL,
    PRIMARY KEY (id_venda)
);

-- Cria a tabela pedido (TABELA JOIN)
-- Junção das tabelas Venda e Produtos (prod_venda)
CREATE TABLE pedido (
    -- campo        -- tipo         -- restrições 
    id_pedido      int               NOT NULL    AUTO_INCREMENT,
    
    -- Chave Estrangeira (FK)
    id_venda    int               NOT NULL,
    id_produto  int               NOT NULL,
    PRIMARY KEY (id_pedido)
);