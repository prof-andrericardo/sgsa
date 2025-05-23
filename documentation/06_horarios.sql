
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
