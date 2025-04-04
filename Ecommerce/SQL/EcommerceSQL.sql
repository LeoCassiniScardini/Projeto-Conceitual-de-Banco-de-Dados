show databases;
create database Ecommerce;
use Ecommerce;

DROP TABLE IF EXISTS Pedido_pagamento;
DROP TABLE IF EXISTS Entrega;
DROP TABLE IF EXISTS Relação_de_produto_pedido;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Cliente_PF;
DROP TABLE IF EXISTS Cliente_PJ;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Produtos_Vendidos_por_Terceiros;
DROP TABLE IF EXISTS Terceiro;
DROP TABLE IF EXISTS Estoque_Produto;
DROP TABLE IF EXISTS Disponibilizam_um_produto;
DROP TABLE IF EXISTS Pagamento;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS Fornecedor;
DROP TABLE IF EXISTS Estoque;

CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY,
    Local VARCHAR(45)
);

CREATE TABLE Produto (
    idProduto INT PRIMARY KEY,
    Categoria VARCHAR(45),
    Descrição VARCHAR(45),
    Valor DECIMAL
);

CREATE TABLE Estoque_Produto (
    Estoque_idEstoque INT,
    Produto_idProduto INT,
    Quantidade INT,
    PRIMARY KEY (Estoque_idEstoque, Produto_idProduto),
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY,
    Razão_Social VARCHAR(45),
    CNPJ VARCHAR(45)
);

CREATE TABLE Disponibilizam_um_produto (
    Produto_idProduto INT,
    Fornecedor_idFornecedor INT,
    PRIMARY KEY (Produto_idProduto, Fornecedor_idFornecedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor)
);

CREATE TABLE Terceiro (
    idTerceiro INT PRIMARY KEY,
    Razão_social VARCHAR(45),
    Local VARCHAR(45),
    Nome_Fantasia VARCHAR(45)
);

CREATE TABLE Produtos_Vendidos_por_Terceiros (
    Terceiro_idTerceiro INT,
    Produto_idProduto INT,
    Quantidade INT,
    PRIMARY KEY (Terceiro_idTerceiro, Produto_idProduto),
    FOREIGN KEY (Terceiro_idTerceiro) REFERENCES Terceiro(idTerceiro),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    Fnome VARCHAR(10),
    NmeioInicial VARCHAR(3),
    Sobrenome VARCHAR(20),
    CPF CHAR(11),
    endereco VARCHAR(45),
    Data_de_Nascimento DATE
);

CREATE TABLE Cliente_PJ (
    idCliente_PJ INT PRIMARY KEY,
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Cliente_PF (
    idCliente_PF INT PRIMARY KEY,
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    Status_do_pedido ENUM('Pendente','Processando','Enviado','Entregue','Cancelado'),
    descrição VARCHAR(45),
    Cliente_idCliente INT,
    Frete FLOAT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Relação_de_produto_pedido (
    Pedido_idPedido INT,
    Produto_idProduto INT,
    Quantidade FLOAT,
    Status ENUM('Disponível','Indisponível','Cancelado'),
    PRIMARY KEY (Pedido_idPedido, Produto_idProduto),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY,
    Status VARCHAR(45),
    Codigo_Rastreio VARCHAR(45),
    Pedido_idPedido INT,
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY,
    Tipo VARCHAR(45)
);

CREATE TABLE Pedido_pagamento (
    Pagamento_idPagamento INT,
    Valor DECIMAL,
    Pedido_idPedido INT,
    PRIMARY KEY (Pagamento_idPagamento, Pedido_idPedido),
    FOREIGN KEY (Pagamento_idPagamento) REFERENCES Pagamento(idPagamento),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

INSERT INTO Estoque (idEstoque, Local) VALUES 
(1, 'São Paulo'),
(2, 'Rio de Janeiro'),
(3, 'Pernambuco'),
(4, 'Minas Gerais'),
(5, 'Bahia');

INSERT INTO Produto (idProduto, Categoria, Descrição, Valor) VALUES 
(101, 'Eletrônicos', 'Fone de ouvido Bluetooth', 199.90),
(102, 'Livros', 'Livro: SQL para Iniciantes', 59.90),
(103, 'Informática', 'Mouse Gamer RGB', 129.90),
(104, 'Casa', 'Liquidificador 500W', 220.00),
(105, 'Moda', 'Camisa Polo Masculina', 89.90);

INSERT INTO Fornecedor (idFornecedor, Razão_Social, CNPJ) VALUES 
(1, 'Tech Fornece Ltda', '12345678000199'),
(2, 'Editora Saber', '98765432000155'),
(3, 'Mouse Mania Ltda', '23456789000188'),
(4, 'Utilidades Domésticas SA', '34567890000177'),
(5, 'Roupas Brasil Eireli', '45678900000166');

INSERT INTO Disponibilizam_um_produto (Produto_idProduto, Fornecedor_idFornecedor) VALUES 
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 5);

INSERT INTO Estoque_Produto (Estoque_idEstoque, Produto_idProduto, Quantidade) VALUES 
(1, 101, 50),
(2, 102, 200),
(3, 103, 120),
(4, 104, 70),
(5, 105, 150);

INSERT INTO Terceiro (idTerceiro, Razão_social, Local, Nome_Fantasia) VALUES 
(1, 'Loja XYZ LTDA', 'Curitiba', 'Loja XYZ'),
(2, 'Eletro Store', 'São Paulo', 'EletroSP'),
(3, 'Livraria Alpha', 'Recife', 'AlphaBooks'),
(4, 'Moda e Estilo', 'Salvador', 'ModasBA'),
(5, 'Utilimais LTDA', 'Belo Horizonte', 'Utilimais');

INSERT INTO Produtos_Vendidos_por_Terceiros (Terceiro_idTerceiro, Produto_idProduto, Quantidade) VALUES 
(1, 101, 10),
(2, 103, 20),
(3, 102, 30),
(4, 105, 15),
(5, 104, 25);

INSERT INTO Cliente (idCliente, Fnome, NmeioInicial, Sobrenome, CPF, endereco, Data_de_Nascimento) VALUES 
(1, 'João', 'M', 'Silva', '12345678901', 'Rua das Flores, 123', '1990-05-10'),
(2, 'Ana', 'L', 'Souza', '98765432100', 'Av. Paulista, 987', '1988-08-22'),
(3, 'Carlos', 'R', 'Oliveira', '11122233344', 'Rua das Palmeiras, 456', '1995-01-15'),
(4, 'Marina', 'B', 'Santos', '22233344455', 'Rua Central, 888', '1992-03-30'),
(5, 'Pedro', 'A', 'Lima', '33344455566', 'Rua Nova, 12', '1993-09-12');

INSERT INTO Cliente_PJ (idCliente_PJ, Cliente_idCliente) VALUES 
(10, 1),
(11, 2),
(12, 3),
(13, 4),
(14, 5);

INSERT INTO Cliente_PF (idCliente_PF, Cliente_idCliente) VALUES 
(20, 1),
(21, 2),
(22, 3),
(23, 4),
(24, 5);

INSERT INTO Pedido (idPedido, Status_do_pedido, descrição, Cliente_idCliente, Frete) VALUES 
(500, 'Pendente', 'Compra de eletrônicos', 1, 25.50),
(501, 'Processando', 'Livros e Camisa', 2, 15.00),
(502, 'Enviado', 'Mouse Gamer', 3, 20.00),
(503, 'Entregue', 'Liquidificador', 4, 30.00),
(504, 'Cancelado', 'Pedido cancelado', 5, 0.00);

INSERT INTO Relação_de_produto_pedido (Pedido_idPedido, Produto_idProduto, Quantidade, Status) VALUES 
(500, 101, 1, 'Disponível'),
(501, 102, 2, 'Disponível'),
(501, 105, 1, 'Disponível'),
(502, 103, 1, 'Disponível'),
(503, 104, 1, 'Disponível'),
(504, 101, 2, 'Disponível');

INSERT INTO Entrega (idEntrega, Status, Codigo_Rastreio, Pedido_idPedido) VALUES 
(300, 'Enviado', 'BR123456789', 500),
(301, 'Em trânsito', 'BR987654321', 501),
(302, 'Entregue', 'BR111222333', 502),
(303, 'Entregue', 'BR444555666', 503),
(304, 'Cancelado', 'BR000000000', 504);

INSERT INTO Pagamento (idPagamento, Tipo) VALUES 
(900, 'Cartão de Crédito'),
(901, 'Pix'),
(902, 'Boleto Bancário'),
(903, 'Débito'),
(904, 'Cartão de Débito');

INSERT INTO Pedido_pagamento (Pagamento_idPagamento, Valor, Pedido_idPedido) VALUES 
(900, 225.40, 500),
(901, 204.80, 501),
(902, 149.90, 502),
(903, 250.00, 503),
(904, 0.00, 504);

SELECT Fnome, Sobrenome, Data_de_Nascimento
FROM Cliente;

SELECT idProduto, Descrição, Valor
FROM Produto
WHERE Categoria = 'Eletrônicos' AND Valor > 100;

SELECT 
    r.Pedido_idPedido,
    r.Produto_idProduto,
    r.Quantidade,
    p.Valor,
    (r.Quantidade * p.Valor) AS Valor_Total
FROM Relação_de_produto_pedido r
JOIN Produto p ON r.Produto_idProduto = p.idProduto;

SELECT idPedido, descrição, Frete
FROM Pedido
ORDER BY Frete DESC;

SELECT Produto_idProduto, COUNT(*) AS TotalPedidos
FROM Relação_de_produto_pedido
GROUP BY Produto_idProduto
HAVING COUNT(*) > 1;

SELECT 
    c.Fnome,
    c.Sobrenome,
    p.descrição AS Pedido,
    pr.Descrição AS Produto,
    r.Quantidade
FROM Pedido p
JOIN Cliente c ON p.Cliente_idCliente = c.idCliente
JOIN Relação_de_produto_pedido r ON p.idPedido = r.Pedido_idPedido
JOIN Produto pr ON r.Produto_idProduto = pr.idProduto;
