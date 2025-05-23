
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
