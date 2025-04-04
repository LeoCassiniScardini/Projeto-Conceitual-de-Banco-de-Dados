## 📦 Estrutura do Banco

- `Produto`
- `Estoque`
- `Fornecedor`
- `Cliente` (com PF e PJ)
- `Pedido`
- `Entrega`
- `Pagamento`
- `Terceiros` e `Produtos_Vendidos_por_Terceiros`

Tabelas de associação:

- `Estoque_Produto`
- `Disponibilizam_um_produto`
- `Relação_de_produto_pedido`
- `Pedido_pagamento`




## 📁 Estrutura das Consultas

### 🔹 1. Consulta de Dados do Cliente
```sql
SELECT Fnome, Sobrenome, Data_de_Nascimento
FROM Cliente;
```
Descrição:
Retorna os nomes, sobrenomes e datas de nascimento dos clientes cadastrados.

### 🔹 2. Produtos Eletrônicos com Valor Acima de R$100
```sql
SELECT idProduto, Descrição, Valor
FROM Produto
WHERE Categoria = 'Eletrônicos' AND Valor > 100;
```
Descrição:
Filtra e exibe produtos da categoria Eletrônicos cujo valor seja superior a R$100.

### 🔹 3. Relação de Produtos em Pedidos
```sql
SELECT 
    r.Pedido_idPedido,
    r.Produto_idProduto,
    r.Quantidade,
    p.Valor,
    (r.Quantidade * p.Valor) AS Valor_Total
FROM Relação_de_produto_pedido r
JOIN Produto p ON r.Produto_idProduto = p.idProduto;
```
Descrição:
Mostra os produtos incluídos em cada pedido, junto com a quantidade e o valor total calculado.

### 🔹 4. Pedidos Ordenados por Frete (Descendente)
```sql
SELECT idPedido, descrição, Frete
FROM Pedido
ORDER BY Frete DESC;
```
Descrição:
Lista os pedidos em ordem decrescente de valor de frete.

### 🔹 5. Produtos com Mais de Um Pedido
```sql
SELECT Produto_idProduto, COUNT(*) AS TotalPedidos
FROM Relação_de_produto_pedido
GROUP BY Produto_idProduto
HAVING COUNT(*) > 1;
```
Descrição:
Retorna os produtos que aparecem em mais de um pedido, com a contagem total de ocorrências.

### 🔹 6. Detalhes de Pedidos com Produtos e Quantidades
```sql
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
```
Descrição:
Exibe os pedidos realizados por cada cliente, detalhando os produtos envolvidos e as quantidades solicitadas.