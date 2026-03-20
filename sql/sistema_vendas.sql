-- CLIENTES
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    cidade VARCHAR(50)
);

-- PRODUTOS
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(50),
    preco DECIMAL(10,2)
);

-- PEDIDOS
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- ITENS DO PEDIDO
CREATE TABLE itens_pedido (
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),

    FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

----- Inserindo valores dentro das tabelas

INSERT INTO clientes (nome, email, cidade) VALUES
('João', 'joao@email.com', 'São Paulo'),
('Maria', 'maria@email.com', 'Rio de Janeiro'),
('Carlos', 'carlos@email.com', 'Belo Horizonte');

INSERT INTO produtos (nome, categoria, preco) VALUES
('Notebook', 'Eletrônicos', 3000.00),
('Mouse', 'Acessórios', 50.00),
('Teclado', 'Acessórios', 150.00),
('Monitor', 'Eletrônicos', 1200.00);

INSERT INTO pedidos (id_cliente, data_pedido) VALUES
(1, '2025-03-01'),
(2, '2025-03-02'),
(1, '2025-03-03');

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 3000.00),
(1, 2, 2, 50.00),
(2, 3, 1, 150.00),
(2, 4, 1, 1200.00),
(3, 2, 3, 50.00);


------- total gasto por cliente

SELECT c.nome, SUM(i.quantidade * i.preco_unitario) AS total_gasto
FROM clientes c
JOIN pedidos p ON c.id = p.id_cliente
JOIN itens_pedido i ON p.id = i.id_pedido
GROUP BY c.nome
ORDER BY total_gasto DESC;


------- produto mais vendido

SELECT pr.nome, SUM(i.quantidade) AS total_vendido
FROM produtos pr
JOIN itens_pedido i ON pr.id = i.id_produto
GROUP BY pr.nome
ORDER BY total_vendido DESC;

-------- Faturamento da loja 

SELECT SUM(quantidade * preco_unitario) AS faturamento_total
FROM itens_pedido;

------ Pedidos com detalhes 

SELECT 
    p.id AS pedido,
    c.nome AS cliente,
    pr.nome AS produto,
    i.quantidade,
    (i.quantidade * i.preco_unitario) AS total
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id
JOIN itens_pedido i ON p.id = i.id_pedido
JOIN produtos pr ON i.id_produto = pr.id;

----- Clientes que mais compraram 

SELECT c.nome, COUNT(p.id) AS total_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.id_cliente
GROUP BY c.nome
ORDER BY total_pedidos DESC;

