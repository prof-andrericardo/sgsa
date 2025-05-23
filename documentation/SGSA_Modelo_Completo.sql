
-- 🧱 Parte 1: Estrutura Inicial do Banco de Dados
CREATE DATABASE IF NOT EXISTS sgsa
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE sgsa;



-- 👤 Parte 2: Usuários e Controle de Acesso
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

CREATE TABLE usuario_papel (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  papel ENUM('Professor','Coordenador','Secretaria','Administrador') NOT NULL,
  ativo BOOLEAN DEFAULT TRUE,
  atribuido_em DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
);

CREATE TABLE log_acesso (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT,
  data_hora DATETIME,
  ip VARCHAR(50),
  user_agent TEXT,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);



-- 🏫 Parte 3: Estrutura Acadêmica
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



-- 📚 Parte 4: Aula, Chamada e Tarefa
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

CREATE TABLE chamada (
  id INT PRIMARY KEY AUTO_INCREMENT,
  aluno_id INT NOT NULL,
  aula_id INT NOT NULL,
  status ENUM('Presente','Ausente','Atrasado','Saiu Cedo','Parcial') NOT NULL,
  justificativa TEXT,
  FOREIGN KEY (aluno_id) REFERENCES usuario(id),
  FOREIGN KEY (aula_id) REFERENCES aula(id)
);

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



-- 🚨 Parte 5: Ocorrências
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



-- ⏰ Parte 6: Horários e Intervalos
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



-- 🧠 Parte 7: Preferência de Agenda
CREATE TABLE preferencia_agenda (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  prioridade ENUM('Professor','Coordenador','Secretaria','Administrador') NOT NULL,
  data_definicao DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);


