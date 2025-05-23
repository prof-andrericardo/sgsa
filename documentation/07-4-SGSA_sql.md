# 📚 SGSA – Parte 4: Módulo de Aula, Chamada e Tarefa

**Tema:** Tabelas `aula`, `chamada`, `tarefa`

------

## 🎯 Objetivo

Modelar o núcleo acadêmico da rotina escolar:

- Registro de aulas realizadas e planejadas
- Controle de presença dos alunos
- Atribuição, entrega e avaliação de tarefas

Essas tabelas integram-se diretamente com `usuario`, `turma` e `ano_letivo`.

------

## 🧾 Tabela `aula`

Armazena dados sobre cada aula ministrada.

```sql
CREATE TABLE aula (
  id INT PRIMARY KEY AUTO_INCREMENT,
  data DATE NOT NULL,                                -- Data da aula
  horario TIME NOT NULL,                             -- Horário específico (vinculado à grade)
  foi_realizada BOOLEAN DEFAULT TRUE,                -- Aula foi dada ou cancelada
  status ENUM('Prevista','Realizada','Cancelada') DEFAULT 'Realizada',
  conteudo TEXT NOT NULL,                            -- Conteúdo abordado
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

## 📋 Tabela `chamada`

Registra a presença de alunos em cada aula.

```sql
CREATE TABLE chamada (
  id INT PRIMARY KEY AUTO_INCREMENT,
  aluno_id INT NOT NULL,                             -- FK para usuário
  aula_id INT NOT NULL,
  status ENUM('Presente','Ausente','Atrasado','Saiu Cedo','Parcial') NOT NULL,
  justificativa TEXT,                                -- Justificativa opcional para ausência
  FOREIGN KEY (aluno_id) REFERENCES usuario(id),
  FOREIGN KEY (aula_id) REFERENCES aula(id)
);
-- RN09, RN10, RN24
```

------

## 📝 Tabela `tarefa`

Define uma atividade para turma ou aluno, com status de entrega.

```sql
CREATE TABLE tarefa (
  id INT PRIMARY KEY AUTO_INCREMENT,
  descricao TEXT NOT NULL,                           -- Descrição da atividade
  capitulo VARCHAR(100),
  paginas VARCHAR(100),
  prazo DATE,                                        -- Data limite
  tipo ENUM('Individual','Turma') DEFAULT 'Turma',
  status ENUM('Pendente','Entregue','Atrasada','Reentregue','Avaliadas') DEFAULT 'Pendente',
  aula_id INT,                                       -- FK opcional para vínculo com aula
  turma_id INT,
  aluno_id INT,
  FOREIGN KEY (aula_id) REFERENCES aula(id),
  FOREIGN KEY (turma_id) REFERENCES turma(id),
  FOREIGN KEY (aluno_id) REFERENCES usuario(id)
);
-- RN11, RN12, RN13, RN25, RN35, RN36
```

------

## 📘 Observações didáticas

- `aula` serve como **âncora para tarefas e presença**.
- `tarefa` pode ser vinculada a uma `aula` (ou não, se for independente).
- `status` da tarefa cobre o ciclo completo: pendente → entregue → avaliada.

Na próxima parte, abordaremos a tabela de ocorrências disciplinares e comunicacionais.