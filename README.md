# ☕ Cafeteria BomGosto – Modelagem e Consultas SQL

**Atividade 08 - Modelando, Construindo e Pesquisando**

Este projeto foi desenvolvido como parte da Atividade 08 do curso de Full Stack +PraTI, com o objetivo de modelar e implementar um sistema de controle de vendas de uma cafeteria fictícia chamada **BomGosto**.

---

## 🧱 Estrutura do Banco de Dados

O sistema foi modelado para representar a lógica de **comandas** de uma cafeteria.  
A estrutura conta com as seguintes tabelas:

- **cardapio** → informações dos cafés (nome, descrição, preço unitário)  
- **comanda** → registro das vendas (código, data, mesa e cliente)  
- **item_comanda** → relação entre comanda e cardápio, com as quantidades

---

## Funcionalidades Implementadas (Consultas SQL)

1️⃣ **Listagem do cardápio** ordenada por nome  
2️⃣ **Exibição das comandas com seus itens**, trazendo:
   - código, data, mesa e nome do cliente  
   - nome do café, descrição, quantidade, preço unitário e total  
3️⃣ **Cálculo do valor total da comanda**  
4️⃣ **Filtragem de comandas com mais de um tipo de café**  
5️⃣ **Faturamento total agrupado por data**

---

## 💻 Tecnologias Utilizadas

- **MySQL**
- **VS Code**
---

## 🚀 Execução do Projeto

Para testar as queries:

1. Crie o banco de dados:
   ```sql
   CREATE DATABASE bomgosto;
   USE bomgosto;
