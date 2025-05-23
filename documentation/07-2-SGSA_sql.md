# 👤 SGSA – Parte 2: Usuários, Perfis e Controle de Acesso

**Tema:** Tabelas `usuario`, `usuario_papel`, `log_acesso`

------

## 🎯 Objetivo

Definir a base de autenticação, perfis e rastreamento de acesso dos usuários do sistema.
 Essas tabelas são fundamentais para garantir:

- 🔐 Segurança
- 🛂 Controle de permissões
- 🧾 Rastreabilidade (logs)

------

## 👥 Tabela `usuario`

Representa todos os usuários do sistema (professores, coordenadores, etc.).

```sql
CREATE TABLE usuario (
  id INT PRIMARY KEY AUTO_INCREMENT,                         -- Identificador único do usuário
  nome VARCHAR(100) NOT NULL,                               -- Nome completo
  email VARCHAR(150) UNIQUE NOT NULL,                       -- Email institucional ou pessoal
  senha_criptografada VARCHAR(255) NOT NULL,                -- Senha segura (hash)
  cpf CHAR(11) UNIQUE,                                      -- CPF (opcional, mas único)
  data_nascimento DATE,
  telefone VARCHAR(20),
  avatar_url TEXT,                                          -- Foto de perfil ou link
  status ENUM('Ativo','Inativo') DEFAULT 'Ativo',           -- Estado da conta
  ultimo_login DATETIME,                                    -- Último login registrado
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP             -- Data de criação automática
);
-- RN01, RN02, RN21, RN22
```

------

## 🧾 Tabela `usuario_papel`

Relaciona o usuário com múltiplos perfis no sistema.

```sql
CREATE TABLE usuario_papel (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  papel ENUM('Professor','Coordenador','Secretaria','Administrador') NOT NULL,
  ativo BOOLEAN DEFAULT TRUE,                               -- Se é o perfil ativo (RN45)
  atribuido_em DATETIME DEFAULT CURRENT_TIMESTAMP,          -- Data da vinculação
  FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
);
-- RN21, RN45
```

------

## 📋 Tabela `log_acesso`

Registra cada acesso de usuários ao sistema (para auditoria e segurança).

```sql
CREATE TABLE log_acesso (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT,
  data_hora DATETIME,
  ip VARCHAR(50),
  user_agent TEXT,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);
-- RN22, RN43
```

------

## 📘 Observações didáticas

- Um mesmo usuário pode ter vários perfis, **mas apenas um pode estar ativo por vez**.
- A tabela `log_acesso` é fundamental para identificar acessos indevidos e comprovar auditoria.
- `senha_criptografada` deve ser protegida com algoritmo seguro (ex: bcrypt ou Argon2).

Na próxima parte, trataremos da estrutura acadêmica: turmas, séries, ciclos e ano letivo.