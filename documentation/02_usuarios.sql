
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
