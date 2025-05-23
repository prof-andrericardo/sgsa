
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
