
-- 🧠 Parte 7: Preferência de Agenda
CREATE TABLE preferencia_agenda (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  prioridade ENUM('Professor','Coordenador','Secretaria','Administrador') NOT NULL,
  data_definicao DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);
