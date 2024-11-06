-- 1. O produto de menor valor.
SELECT * FROM produto
WHERE preco = (SELECT MIN(preco) FROM produto);


-- 2. O produto de maior valor.
SELECT * FROM produto
WHERE preco = (SELECT MAX(preco) FROM produto);

-- 3. O produto com maior quantidade em estoque.
SELECT * FROM produto
WHERE estoque = (SELECT MAX(estoque) FROM produto);

-- 4. Todas as vendas do usuário 1.
SELECT * FROM venda
WHERE id_usuario = 3;

SELECT * FROM usuario
WHERE id_usuario = 3;

-- Não é recomendado utilizar Where para junção de tabelas, Where é filtro
-- SELECT
--     *
-- FROM
--     usuario,
--     venda
-- WHERE
--     usuario.id_usuario = 3 AND
--     usuario.id_usuario = venda.id_usuario;

-- Buscando o Usuário e a Venda
SELECT
    usuario.nome,
    usuario.sobrenome,
    usuario.idade,
    venda.total,
    venda.forma_pagto
FROM
    usuario
    INNER JOIN venda ON venda.id_usuario = usuario.id_usuario
WHERE
    usuario.id_usuario = 3;


-- Buscando o Usuário, a Venda e o Produto
SELECT
    usuario.nome AS "Nome",
    usuario.sobrenome AS "Sobrenome",
    usuario.idade AS "Idade",
    produto.nome AS "Produto",
    produto.descricao AS "Descrição",
    venda.total AS "Total",
    venda.forma_pagto AS "Forma pagto",
    venda.data_venda AS "Data venda"
FROM
    usuario
    INNER JOIN venda ON venda.id_usuario = usuario.id_usuario
    INNER JOIN pedido ON pedido.id_venda = venda.id_venda
    INNER JOIN produto ON produto.id_produto = pedido.id_produto
WHERE
    usuario.id_usuario = 1;