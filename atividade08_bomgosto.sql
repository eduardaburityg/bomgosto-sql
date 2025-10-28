CREATE DATABASE IF NOT EXISTS bomgosto;
USE bomgosto;

CREATE TABLE cardapio (
    cod_cardapio INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) UNIQUE NOT NULL,
    descricao TEXT,
    preco_unitario DECIMAL(10,2) NOT NULL
);

CREATE TABLE comanda (
    cod_comanda INT PRIMARY KEY AUTO_INCREMENT,
    data_comanda DATE NOT NULL,
    mesa INT NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL
);

CREATE TABLE item_comanda (
    cod_comanda INT,
    cod_cardapio INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (cod_comanda, cod_cardapio),
    FOREIGN KEY (cod_comanda) REFERENCES comanda(cod_comanda),
    FOREIGN KEY (cod_cardapio) REFERENCES cardapio(cod_cardapio)
);

INSERT INTO cardapio (nome, descricao, preco_unitario)
VALUES
('Expresso', 'Café forte e curto', 5.00),
('Cappuccino', 'Café com leite e espuma', 8.50),
('Latte', 'Café com bastante leite vaporizado', 9.00),
('Mocha', 'Café com chocolate e leite', 10.00);

INSERT INTO comanda (data_comanda, mesa, nome_cliente)
VALUES
('2025-10-27', 1, 'Eduarda Gonçalves'),
('2025-10-27', 2, 'Matheus Oliveira'),
('2025-10-28', 3, 'João Silva');

INSERT INTO item_comanda (cod_comanda, cod_cardapio, quantidade)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 2, 2),
(3, 4, 1);


-- 1) Listagem do cardápio ordenada por nome
SELECT * FROM cardapio ORDER BY nome;

-- 2) Comandas e itens detalhados
SELECT 
    c.cod_comanda,
    c.data_comanda,
    c.mesa,
    c.nome_cliente,
    i.cod_comanda AS cod_item,
    ca.nome AS nome_cafe,
    ca.descricao,
    i.quantidade,
    ca.preco_unitario,
    (i.quantidade * ca.preco_unitario) AS preco_total
FROM comanda c
JOIN item_comanda i ON c.cod_comanda = i.cod_comanda
JOIN cardapio ca ON i.cod_cardapio = ca.cod_cardapio
ORDER BY c.data_comanda, c.cod_comanda, ca.nome;

-- 3) Valor total de cada comanda
SELECT 
    c.cod_comanda,
    c.data_comanda,
    c.mesa,
    c.nome_cliente,
    SUM(i.quantidade * ca.preco_unitario) AS valor_total_comanda
FROM comanda c
JOIN item_comanda i ON c.cod_comanda = i.cod_comanda
JOIN cardapio ca ON i.cod_cardapio = ca.cod_cardapio
GROUP BY c.cod_comanda, c.data_comanda, c.mesa, c.nome_cliente
ORDER BY c.data_comanda;

-- 4) Comandas com mais de um tipo de café
SELECT 
    c.cod_comanda,
    c.data_comanda,
    c.mesa,
    c.nome_cliente,
    SUM(i.quantidade * ca.preco_unitario) AS valor_total_comanda
FROM comanda c
JOIN item_comanda i ON c.cod_comanda = i.cod_comanda
JOIN cardapio ca ON i.cod_cardapio = ca.cod_cardapio
GROUP BY c.cod_comanda, c.data_comanda, c.mesa, c.nome_cliente
HAVING COUNT(i.cod_cardapio) > 1
ORDER BY c.data_comanda;

-- 5) Total de faturamento por data
SELECT 
    c.data_comanda,
    SUM(i.quantidade * ca.preco_unitario) AS total_faturamento
FROM comanda c
JOIN item_comanda i ON c.cod_comanda = i.cod_comanda
JOIN cardapio ca ON i.cod_cardapio = ca.cod_cardapio
GROUP BY c.data_comanda
ORDER BY c.data_comanda;
