# 📦 Projeto Conceitual de Banco de Dados — Oficina Mecânica

---

## 📌 Descrição do Projeto

O banco de dados desenvolvido neste projeto é voltado para um sistema de gerenciamento e controle de **Ordens de Serviço (OS)** em uma oficina mecânica, com o objetivo de gerenciar:

- **Clientes e seus Veículos**
- **Mecânicos e Equipes**
- **Serviços e Peças utilizadas em cada OS**
- **Execução e controle de Ordens de Serviço (OS)**
- **Relacionamentos entre serviços, peças e equipes responsáveis**

---

## 🔨 Funcionalidades Principais

### ✅ Clientes e Veículos
- **Clientes podem possuir múltiplos veículos.**
- **Os veículos são identificados por sua placa, modelo, marca e ano.**
- **Cada veículo pertence a um único cliente.**

### ✅ Mecânicos e Equipes
- **Mecânicos podem participar de múltiplas equipes.**
- **Cada mecânico é identificado por nome, endereço, especialidade e telefone.**
- **Equipes são compostas por vários mecânicos e são responsáveis por executar as OS.**

### ✅ Ordens de Serviço (OS)
- **Cada OS possui um número identificador, data de emissão, status, data prevista para conclusão e valor total.**
- **A OS é vinculada a um veículo e a uma equipe responsável.**
- **O status da OS pode ser: Aguardando Autorização, Em Execução, Concluído.**

### ✅ Serviços e Peças
- **Serviços são cadastrados com descrição, preço e tempo estimado.**
- **Peças são cadastradas com descrição, preço e quantidade disponível no estoque.**
- **Cada OS pode utilizar diversos serviços e peças.**
- **O valor total da OS é calculado com base nos serviços executados e peças utilizadas.**

---

## 📂 Tabelas do Banco de Dados

### **Cliente**
| Campo       | Tipo        | Descrição                               |
|-------------|-------------|-----------------------------------------|
| idCliente   | INT          | Identificador único do cliente.        |
| Nome        | VARCHAR(45)   | Nome do cliente.                      |
| Endereço    | VARCHAR(100)  | Endereço do cliente.                  |
| Telefone    | VARCHAR(20)   | Telefone do cliente.                  |
| Email       | VARCHAR(45)   | E-mail do cliente.                    |

---

### **Veiculo**
| Campo          | Tipo        | Descrição                            |
|----------------|-------------|-------------------------------------|
| idVeiculo      | INT          | Identificador único do veículo.    |
| Placa          | VARCHAR(10)  | Placa do veículo.                  |
| Modelo         | VARCHAR(45)  | Modelo do veículo.                 |
| Marca          | VARCHAR(45)  | Marca do veículo.                  |
| Ano            | INT          | Ano de fabricação do veículo.      |
| Cliente_idCliente | INT       | Referência ao `Cliente`.           |

---

### **Mecanico**
| Campo       | Tipo         | Descrição                             |
|-------------|--------------|---------------------------------------|
| idMecanico  | INT           | Identificador único do mecânico.     |
| Nome        | VARCHAR(45)    | Nome do mecânico.                   |
| Endereço    | VARCHAR(100)   | Endereço do mecânico.               |
| Especialidade | VARCHAR(45) | Especialidade do mecânico.          |
| Telefone    | VARCHAR(20)    | Telefone do mecânico.               |

---

### **Equipe**
| Campo        | Tipo          | Descrição                           |
|--------------|---------------|-------------------------------------|
| idEquipe     | INT            | Identificador único da equipe.     |
| Nome da Equipe | VARCHAR(45)  | Nome da equipe.                    |
| Descrição    | VARCHAR(100)   | Descrição da equipe.               |

---

### **Equipe_Mecanico**
| Campo        | Tipo         | Descrição                                        |
|--------------|--------------|------------------------------------------------|
| Mecanico_idMecanico | INT    | Referência ao `Mecanico`.                      |
| Equipe_idEquipe     | INT    | Referência ao `Equipe`.                        |

---

### **Ordem_de_servico (OS)**
| Campo               | Tipo         | Descrição                                |
|---------------------|--------------|-----------------------------------------|
| idOrdem_de_servico   | INT          | Identificador único da OS.              |
| Numero da OS         | INT          | Número da OS gerado.                    |
| Data de emissão      | DATE         | Data em que a OS foi emitida.           |
| Valor total          | DECIMAL      | Valor total da OS.                      |
| Status               | VARCHAR(45)  | Status da OS (Aguardando, Executando, Concluído). |
| Data conclusão prevista | DATE      | Data prevista para conclusão dos serviços. |
| Equipe_idEquipe      | INT          | Referência à `Equipe`.                  |
| Veiculo_idVeiculo    | INT          | Referência ao `Veiculo`.                |
| Cliente_idCliente    | INT          | Referência ao `Cliente`.                |

---

### **Servico**
| Campo          | Tipo         | Descrição                             |
|----------------|--------------|---------------------------------------|
| idServico      | INT           | Identificador único do serviço.     |
| Descrição      | VARCHAR(100)   | Descrição do serviço.               |
| Preço          | DECIMAL        | Preço do serviço (mão-de-obra).     |
| Tempo estimado | TIME           | Tempo estimado para execução.      |

---

### **OS_Servico**
| Campo            | Tipo         | Descrição                                    |
|------------------|--------------|--------------------------------------------|
| idOrdem_de_servico | INT         | Referência à `Ordem_de_servico`.           |
| idServico         | INT          | Referência ao `Servico`.                   |
| Quantidade        | INT          | Quantidade do serviço realizado.          |
| Valor Total       | DECIMAL       | Valor total do serviço realizado.        |

---

### **Peca**
| Campo          | Tipo         | Descrição                             |
|----------------|--------------|--------------------------------------|
| idPeca         | INT           | Identificador único da peça.       |
| Descrição      | VARCHAR(100)   | Descrição da peça.                 |
| Preço          | DECIMAL        | Preço unitário da peça.            |
| Estoque        | INT            | Quantidade disponível no estoque. |

---

### **OS_Peca**
| Campo               | Tipo      | Descrição                                        |
|---------------------|-----------|-------------------------------------------------|
| idPeca              | INT        | Referência à `Peca`.                            |
| idOrdem_de_servico   | INT        | Referência à `Ordem_de_servico`.                |
| Quantidade Utilizada | INT       | Quantidade da peça utilizada na OS.            |
| Valor Total         | DECIMAL    | Valor total da peça utilizada.                |

---

## 🔗 Relacionamentos

- **Cliente → Veiculo (1:N)**: Um cliente possui vários veículos.
- **Veiculo → Ordem_de_servico (1:N)**: Cada veículo pode ter múltiplas OS.
- **Mecanico → Equipe (N:M)**: Um mecânico pode estar em várias equipes ao longo do tempo.
- **Equipe → Ordem_de_servico (1:N)**: Uma equipe é responsável por várias OS.
- **Ordem_de_servico → Servico (N:M)**: Uma OS pode ter vários serviços associados.
- **Ordem_de_servico → Peca (N:M)**: Uma OS pode utilizar várias peças.
