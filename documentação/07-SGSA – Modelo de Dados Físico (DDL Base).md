# 🗃️ SGSA – Modelo de Dados Físico (DDL Base)

**Versão:** 1.0 | **Atualizado em:** 21/05/2025

Este documento apresenta o script SQL inicial para a criação das estruturas de banco de dados do SGSA (Sistema de Gerenciamento de Sala de Aula), com base nas regras de negócio (RN01–RN46) e casos de uso consolidados até a versão 6.2.

------

## 🎯 Considerações Iniciais

- Banco de dados compatível com **MySQL 8+**
- Conjunto de caracteres: `utf8mb4`
- Collation: `utf8mb4_unicode_ci`
- Engine: `InnoDB`

------

## 🏗️ Script de Criação do Banco `sgsa`

```sql
CREATE DATABASE IF NOT EXISTS sgsa
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE sgsa;
```

------

## 👤 Tabela `usuario`

```sql
CREATE TABLE usuario (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  senha_criptografada VARCHAR(255) NOT NULL,
  cpf CHAR(11) UNIQUE,
  data_nascimento DATE,
  telefone VARCHAR(20),
  avatar_url TEXT,
  status ENUM('Ativo','Inativo') DEFAULT 'Ativo',
  ultimo_login DATETIME,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- RN01, RN02, RN21, RN22, RN45
```

------

## 🔐 Tabela `usuario_papel`

```sql
CREATE TABLE usuario_papel (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  papel ENUM('Professor','Coordenador','Secretaria','Administrador') NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
);
-- RN21
```

------

## 📚 Tabelas de Estrutura Escolar

```sql
CREATE TABLE ciclo (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL
);

CREATE TABLE serie (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(20) NOT NULL,
  ciclo_id INT,
  FOREIGN KEY (ciclo_id) REFERENCES ciclo(id)
);

CREATE TABLE ano_letivo (
  id INT PRIMARY KEY AUTO_INCREMENT,
  ano YEAR NOT NULL,
  data_inicio DATE,
  data_fim DATE
);

CREATE TABLE turma (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  turno ENUM('Matutino','Vespertino','Noturno') NOT NULL,
  ano_letivo_id INT,
  serie_id INT,
  FOREIGN KEY (ano_letivo_id) REFERENCES ano_letivo(id),
  FOREIGN KEY (serie_id) REFERENCES serie(id)
);
-- RN04, RN05, RN28, RN40
```

------

## 📖 Tabela `aula`

```sql
CREATE TABLE aula (
  id INT PRIMARY KEY AUTO_INCREMENT,
  data DATE NOT NULL,
  horario TIME NOT NULL,
  foi_realizada BOOLEAN DEFAULT TRUE,
  status ENUM('Prevista','Realizada','Cancelada') DEFAULT 'Realizada',
  conteudo TEXT NOT NULL,
  capitulo VARCHAR(100),
  paginas VARCHAR(100),
  turma_id INT,
  professor_id INT,
  FOREIGN KEY (turma_id) REFERENCES turma(id),
  FOREIGN KEY (professor_id) REFERENCES usuario(id)
);
-- RN06, RN07, RN08, RN23, RN34
```

------

## ✅ Tabelas de Frequência e Tarefas

```sql
CREATE TABLE chamada (
  id INT PRIMARY KEY AUTO_INCREMENT,
  aluno_id INT NOT NULL,
  aula_id INT NOT NULL,
  status ENUM('Presente','Ausente','Atrasado','Saiu Cedo','Parcial') NOT NULL,
  justificativa TEXT,
  FOREIGN KEY (aluno_id) REFERENCES usuario(id),
  FOREIGN KEY (aula_id) REFERENCES aula(id)
);
-- RN09, RN10, RN24

CREATE TABLE tarefa (
  id INT PRIMARY KEY AUTO_INCREMENT,
  descricao TEXT NOT NULL,
  capitulo VARCHAR(100),
  paginas VARCHAR(100),
  prazo DATE,
  tipo ENUM('Individual','Turma') DEFAULT 'Turma',
  status ENUM('Pendente','Entregue','Atrasada','Reentregue','Avaliadas') DEFAULT 'Pendente',
  aula_id INT,
  turma_id INT,
  aluno_id INT,
  FOREIGN KEY (aula_id) REFERENCES aula(id),
  FOREIGN KEY (turma_id) REFERENCES turma(id),
  FOREIGN KEY (aluno_id) REFERENCES usuario(id)
);
-- RN11, RN12, RN13, RN25, RN35, RN36
```

------

## ⚠️ Tabela `ocorrencia`

```sql
CREATE TABLE ocorrencia (
  id INT PRIMARY KEY AUTO_INCREMENT,
  tipo ENUM('Acadêmica','Comportamental','Saúde') NOT NULL,
  sigilo ENUM('Baixo','Médio','Alto') DEFAULT 'Baixo',
  descricao TEXT NOT NULL,
  justificativa TEXT,
  data DATE NOT NULL,
  disciplina VARCHAR(100),
  aluno_id INT,
  turma_id INT,
  aula_id INT,
  FOREIGN KEY (aluno_id) REFERENCES usuario(id),
  FOREIGN KEY (turma_id) REFERENCES turma(id),
  FOREIGN KEY (aula_id) REFERENCES aula(id)
);
-- RN14–RN20, RN26, RN27, RN37
```

------

## 📅 Tabelas `grade_horaria` e `intervalo_escolar`

```sql
CREATE TABLE grade_horaria (
  id INT PRIMARY KEY AUTO_INCREMENT,
  turno ENUM('Matutino','Vespertino','Noturno'),
  segmento VARCHAR(100),
  ordem_aula TINYINT,
  hora_inicio TIME,
  hora_fim TIME
);

CREATE TABLE intervalo_escolar (
  id INT PRIMARY KEY AUTO_INCREMENT,
  turno ENUM('Matutino','Vespertino','Noturno'),
  segmento VARCHAR(100),
  hora_inicio TIME,
  hora_fim TIME,
  observacao TEXT
);
-- RN29, RN30, RN38, RN46
```

------

## 🛡️ Tabelas de Logs e Acesso

```sql
CREATE TABLE log_acesso (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT,
  data_hora DATETIME,
  ip VARCHAR(50),
  user_agent TEXT,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);
-- RN22, RN32, RN44
```

------

## ✅ Considerações Finais

- Todas as `FKs` utilizam `ON DELETE CASCADE` onde apropriado.
- RNs referenciadas como comentários para facilitar rastreabilidade.
- Script pronto para execução incremental ou adaptação via MySQL Workbench ou CLI.

Se desejar, posso agora gerar o `.sql` puro ou arquivo compatível com `.mwb` do MySQL Workbench.