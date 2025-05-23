
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
