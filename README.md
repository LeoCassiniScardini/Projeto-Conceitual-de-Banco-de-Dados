# 📦 Projeto Conceitual de Banco de Dados — E-Commerce

Este projeto visa criar um modelo conceitual de banco de dados para um sistema de **E-Commerce**, contemplando aspectos como clientes, pedidos, pagamentos e entregas. A proposta busca aprimorar o modelo inicial, implementando novas funcionalidades e garantindo um sistema relacional robusto e coerente.

---

## 📌 Descrição do Projeto

O banco de dados desenvolvido neste projeto é voltado para um sistema de E-Commerce, com o objetivo de gerenciar:

- **Clientes (PJ e PF)**
- **Pedidos**
- **Pagamentos (múltiplas formas por pedido)**
- **Entregas (com status e código de rastreio)**

---

## 🔨 Funcionalidades Implementadas

### ✅ Clientes
- **Clientes podem ser Pessoas Físicas (PF) ou Pessoas Jurídicas (PJ).**
- **Cada conta é exclusivamente PF ou PJ, nunca ambas.**
- **A estrutura de dados garante integridade e consistência na identificação do tipo de cliente.**

### ✅ Pedidos
- **Pedidos podem ter múltiplas formas de pagamento associadas.**
- **Pedidos possuem um vínculo direto com o processo de entrega.**

### ✅ Pagamentos
- **Possibilidade de cadastrar várias formas de pagamento (ex.: Cartão de Crédito, Boleto, Pix, etc.).**
- **Implementação de uma tabela associativa `Pedido_Pagamento` para armazenar múltiplas formas de pagamento por pedido.**

### ✅ Entregas
- **Cada pedido possui detalhes da entrega, incluindo:**
  - **Status do Pedido (ex.: Processando, Enviado, Entregue, Cancelado, etc.).**
  - **Código de Rastreamento para acompanhamento da entrega.**

---

## 📂 Tabelas do Banco de Dados

### 1. **Cliente (Genérico)**
| Campo         | Tipo        | Descrição                          |
|---------------|-------------|------------------------------------|
| id            | INT         | Identificador único do cliente.   |
| tipo_cliente  | VARCHAR(2)   | Indica se é `PF` ou `PJ`.         |
| nome          | VARCHAR(100) | Nome do cliente.                  |
| email         | VARCHAR(100) | E-mail do cliente.                |
| telefone      | VARCHAR(20)  | Telefone para contato.            |

### 2. **Cliente_PF (Pessoas Físicas)**
| Campo         | Tipo        | Descrição                          |
|---------------|-------------|------------------------------------|
| id_cliente    | INT         | Identificador único (FK de Cliente).|
| cpf           | VARCHAR(11)  | CPF do cliente.                   |
| data_nascimento | DATE       | Data de nascimento.               |

### 3. **Cliente_PJ (Pessoas Jurídicas)**
| Campo         | Tipo        | Descrição                          |
|---------------|-------------|------------------------------------|
| id_cliente    | INT         | Identificador único (FK de Cliente).|
| cnpj          | VARCHAR(14)  | CNPJ da empresa.                  |
| razao_social  | VARCHAR(100) | Razão social da empresa.          |

### 4. **Pedido**
| Campo         | Tipo        | Descrição                          |
|---------------|-------------|------------------------------------|
| id            | INT         | Identificador único do pedido.    |
| id_cliente    | INT         | Identificador do cliente (FK).    |
| data_pedido   | DATETIME     | Data e hora do pedido.            |
| valor_total   | DECIMAL(10,2)| Valor total do pedido.            |

### 5. **Pagamento**
| Campo         | Tipo        | Descrição                           |
|---------------|-------------|-------------------------------------|
| id            | INT         | Identificador único do pagamento.  |
| tipo          | VARCHAR(50)  | Tipo de pagamento (Cartão, Pix, etc.).|
| valor         | DECIMAL(10,2)| Valor do pagamento.                |

### 6. **Pedido_Pagamento (Tabela Associativa)**
| Campo         | Tipo        | Descrição                          |
|---------------|-------------|------------------------------------|
| id_pedido     | INT         | Identificador do pedido (FK).     |
| id_pagamento  | INT         | Identificador do pagamento (FK).  |
| valor_parcial | DECIMAL(10,2)| Parte do valor do pedido coberta por esse pagamento.|

### 7. **Entrega**
| Campo            | Tipo        | Descrição                         |
|------------------|-------------|-----------------------------------|
| id               | INT         | Identificador único da entrega.  |
| id_pedido        | INT         | Identificador do pedido (FK).    |
| status           | VARCHAR(20)  | Status da entrega (Ex.: Enviado, Entregue, etc.).|
| codigo_rastreamento | VARCHAR(50) | Código de rastreamento da entrega. |

---

## 🔗 Relacionamentos

- A tabela **Cliente** possui relacionamento de 1:1 com as tabelas **Cliente_PF** e **Cliente_PJ**, de acordo com o tipo de cliente.
- A tabela **Pedido** se relaciona com **Cliente** (1:N), indicando que um cliente pode ter múltiplos pedidos.
- A tabela **Pedido_Pagamento** serve como ponte entre **Pedido** e **Pagamento**, garantindo a possibilidade de múltiplas formas de pagamento para um único pedido (N:N).
- A tabela **Entrega** se relaciona com **Pedido** (1:1), indicando que cada pedido possui uma entrega única.

---

## 📌 Considerações Finais

O modelo conceitual desenvolvido fornece uma base sólida para um sistema de E-Commerce, considerando as especificidades dos clientes (PF e PJ), a flexibilidade dos pagamentos, e o controle detalhado sobre o processo de entrega.  

---

Quer que eu ajude a criar o **diagrama relacional (ERD)** deste banco de dados para complementar o README.md? 😊
