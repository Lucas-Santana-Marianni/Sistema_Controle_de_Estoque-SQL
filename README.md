# Sistema de Controle de Estoque — SQL

Este projeto consiste em um banco de dados relacional para gerenciar **fornecedores, produtos e pedidos de reposição**, permitindo operações essenciais de controle de estoque.

## 📦 Estrutura do Banco de Dados

O sistema contém três tabelas principais:

### 1. **fornecedores**
- fornecedorid (PK)
- nomefornecedor
- contatoFornecedor
- telefonefornecedor

### 2. **produtos**
- produtoid (PK)
- nomeproduto
- quantidadeestoque
- precounitario
- fornecedorid (FK → fornecedores)

### 3. **pedidosreposicao**
- pedidoid (PK)
- produtoid (FK → produtos)
- quantidadereposicao
- datapedido

## 🗃 Relacionamentos

- **Fornecedores → Produtos** : 1:N  
- **Produtos → Pedidos de Reposição** : 1:N  
- Chaves estrangeiras configuradas com **ON DELETE CASCADE**.

## 🧪 Funcionalidades

O script SQL permite:

✔ Criar o banco de dados  
✔ Criar tabelas com relacionamentos  
✔ Inserir dados de exemplo  
✔ Consultar informações com JOIN  
✔ Atualizar quantidade em estoque  
✔ Configurar comportamento de cascata  
✔ Deletar registros mantendo integridade referencial

## ▶ Como executar

1. Abra o **MySQL Workbench**, **XAMPP**, **Laragon** ou outro ambiente MySQL.
2. Crie um novo script.
3. Cole o conteúdo do arquivo `.sql`.
4. Execute tudo (Ctrl + Shift + Enter).

## 📄 Consultas disponíveis

### Listar todos os produtos:
```sql
select * from produtos;
```

### Ver reposições realizadas:
```sql
select p.nomeproduto, pr.quantidadereposicao, pr.datapedido
from pedidosreposicao pr
join produtos p on pr.produtoid = p.produtoid;
```

### Produtos e seus fornecedores:
```sql
select p.nomeproduto, f.nomefornecedor
from produtos p
join fornecedores f on p.fornecedorid = f.fornecedorid;
```

## 👨‍💻 Autor

Projeto criado por **Lucas Santana Marianni** — 2025.  
Qualquer dúvida, estou por aqui! 🚀
