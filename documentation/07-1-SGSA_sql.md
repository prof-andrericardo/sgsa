# 🧱 SGSA – Parte 1: Estrutura Inicial do Banco de Dados

**Tema:** Criação do banco de dados, charset, engine e uso

------

## 🎯 Objetivo

Nesta primeira parte do modelo físico, definiremos a **estrutura base do banco de dados SGSA**, incluindo:

- Criação do banco (`CREATE DATABASE`)
- Definição de charset e collation recomendados para 2025
- Escolha da engine (com suporte a integridade referencial)
- Direcionamento (`USE`) para selecionar o banco

Esses comandos são executados **uma única vez** no início da modelagem física.

------

## 🛠️ Código SQL comentado

```sql
-- 🎯 Criação do banco SGSA com suporte total a multilinguagem e emojis
CREATE DATABASE IF NOT EXISTS sgsa
DEFAULT CHARACTER SET utf8mb4         -- Suporte completo a caracteres Unicode e emojis
COLLATE utf8mb4_unicode_ci;           -- Ordenação e comparação compatível com múltiplos idiomas

-- 🔽 Seleciona o banco criado para uso nas próximas operações
USE sgsa;

-- 💡 OBS: 'IF NOT EXISTS' evita erro se o banco já existir
-- 💡 'utf8mb4' é essencial para compatibilidade futura (MySQL 8+)
-- 💡 'InnoDB' será a engine padrão das tabelas (não precisa ser declarado no banco, mas sim nas tabelas)
```

------

## 📝 Observações didáticas

- 🎯 O nome `sgsa` pode ser alterado para atender ao ambiente da escola ou instituição.
- 🔒 Charset `utf8mb4` evita problemas com nomes acentuados, emojis e ordenações incorretas.
- ✅ `utf8mb4_unicode_ci` assegura comparações **consistentes entre maiúsculas/minúsculas e acentuação**.
- 🧱 A criação do banco **não cria nenhuma tabela ainda** — apenas o contêiner lógico.

------

Na próxima parte, abordaremos a estrutura de usuários e controle de acesso, incluindo autenticação e papéis de usuários.