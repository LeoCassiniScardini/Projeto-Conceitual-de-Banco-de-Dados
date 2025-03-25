# 📦 Projeto Conceitual de Banco de Dados — E-Commerce

---

## 📌 Descrição do Projeto

O banco de dados desenvolvido neste projeto é voltado para um sistema de E-Commerce, com o objetivo de gerenciar:

- **Clientes (PJ e PF)**
- **Produtos e Estoque**
- **Pedidos e Pagamentos**
- **Entregas (com status e código de rastreio)**
- **Fornecedores e Terceiros**

---

## 🔨 Funcionalidades Alteradas

### ✅ Clientes
- **Clientes podem ser Pessoas Físicas (PF) ou Pessoas Jurídicas (PJ).**
- **Cada conta é exclusivamente PF ou PJ, nunca ambas.**
- **Os clientes podem realizar pedidos e os dados de entrega são vinculados a cada pedido.**

### ✅ Pedidos
- **Pedidos possuem um cliente associado e podem conter múltiplos produtos.**
- **A descrição do pedido e o status do pedido são rastreados.**
- **A entrega de cada pedido é detalhada na tabela `Entrega`.**

### ✅ Pagamentos
- **Pedidos podem ter múltiplas formas de pagamento associadas.**
- **A tabela `Pedido_pagamento` é uma ponte entre `Pedido` e `Pagamento`, permitindo pagamento misto.**
- **Tipos de pagamento incluem: Cartão, Pix, Boleto, etc.**

### ✅ Entregas
- **Cada pedido possui detalhes da entrega, incluindo:**
  - **Status da Entrega (Ex.: Enviado, Entregue, Cancelado).**
  - **Código de Rastreamento para acompanhamento.**

---

## 📂 Tabelas alteradas/adicionada

### **Cliente**
| Campo         | Tipo        | Descrição                          |
|---------------|-------------|------------------------------------|
| idCliente     | INT         | Identificador único do cliente.   |
| Nome          | VARCHAR(45)  | Nome do cliente.                  |
| Identificacao | VARCHAR(45)  | CPF ou CNPJ.                      |
| endereco      | VARCHAR(100) | Endereço do cliente.              |

### **Cliente_PJ**
| Campo         | Tipo        | Descrição                          |
|---------------|-------------|------------------------------------|
| idCliente_PJ  | INT         | Identificador único do cliente PJ. |
| Cliente_idCliente | INT     | Referência ao `Cliente`.           |
| Razão Social  | VARCHAR(45)  | Razão Social do Cliente PJ.       |

### **Cliente_PF**
| Campo         | Tipo        | Descrição                          |
|---------------|-------------|------------------------------------|
| idCliente_PF  | INT         | Identificador único do cliente PF. |
| Cliente_idCliente | INT     | Referência ao `Cliente`.           |
| CPF           | VARCHAR(11)  | CPF do cliente PF.                |

### **Pedido**
| Campo         | Tipo        | Descrição                          |
|---------------|-------------|------------------------------------|
| idPedido      | INT         | Identificador único do pedido.    |
| Status do pedido | VARCHAR(45) | Status atual do pedido.         |
| descrição     | VARCHAR(45)  | Descrição detalhada do pedido.    |
| Frete         | FLOAT        | Valor do frete.                   |
| Cliente_idCliente | INT     | Identificador do cliente.         |

### **Pagamento**
| Campo         | Tipo        | Descrição                          |
|---------------|-------------|------------------------------------|
| idPagamento   | INT         | Identificador único do pagamento. |
| Tipo          | VARCHAR(45)  | Tipo de pagamento utilizado.      |
| Valor         | DECIMAL      | Valor do pagamento.               |

### **Pedido_pagamento**
| Campo         | Tipo        | Descrição                          |
|---------------|-------------|------------------------------------|
| Pagamento_idPagamento | INT | Referência ao `Pagamento`.         |
| Pedido_idPedido      | INT  | Referência ao `Pedido`.            |

### **Entrega**
| Campo         | Tipo        | Descrição                          |
|---------------|-------------|------------------------------------|
| idEntrega     | INT         | Identificador único da entrega.   |
| Status        | VARCHAR(45)  | Status atual da entrega.          |
| Codigo_Rastreamento | VARCHAR(45) | Código de rastreamento.     |
| Pedido_idPedido | INT       | Referência ao `Pedido`.            |

---

## 🔗 Relacionamentos

- **Cliente → Cliente_PJ e Cliente_PF**: Relacionamento 1:1 com chave estrangeira em ambas as tabelas.
- **Pedido → Pagamento**: Relacionamento N:N com tabela associativa `Pedido_pagamento`.
- **Pedido → Entrega**: Relacionamento 1:1.
