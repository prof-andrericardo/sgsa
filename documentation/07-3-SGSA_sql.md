# 🏫 SGSA – Parte 3: Estrutura Acadêmica

**Tema:** Tabelas `ciclo`, `serie`, `ano_letivo`, `turma`

------

## 🎯 Objetivo

Modelar a estrutura organizacional da instituição de ensino, representando:

- Divisão por ciclos (ex: Fundamental, Médio)
- Séries vinculadas aos ciclos
- Ano letivo e turmas por série e turno

Essas tabelas fornecem o alicerce para o registro de aulas, tarefas e frequência.

------

## 🧱 Tabela `ciclo`

Define grandes agrupamentos organizacionais.

```sql
CREATE TABLE ciclo (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL
);
-- RN04
```

------

## 🧱 Tabela `serie`

Cada série pertence a um ciclo (ex: 6º ano do Fundamental II).

```sql
CREATE TABLE serie (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(20) NOT NULL,
  ciclo_id INT,
  FOREIGN KEY (ciclo_id) REFERENCES ciclo(id)
);
-- RN04
```

------

## 📅 Tabela `ano_letivo`

Representa o período vigente da escola (ex: 2024).

```sql
CREATE TABLE ano_letivo (
  id INT PRIMARY KEY AUTO_INCREMENT,
  ano YEAR NOT NULL,
  data_inicio DATE,
  data_fim DATE
);
-- RN05
```

------

## 👥 Tabela `turma`

Turmas associadas a séries, turnos e anos letivos.

```sql
CREATE TABLE turma (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  turno ENUM('Matutino','Vespertino','Noturno') NOT NULL,
  ano_letivo_id INT,
  serie_id INT,
  FOREIGN KEY (ano_letivo_id) REFERENCES ano_letivo(id),
  FOREIGN KEY (serie_id) REFERENCES serie(id)
);
-- RN28, RN40
```

------

## 📘 Observações didáticas

- `ciclo` e `serie` garantem flexibilidade para currículos distintos.
- `turma` permite vincular aulas, ocorrências, tarefas e chamadas a contextos específicos.
- `ano_letivo` separa cronologicamente os registros de cada período acadêmico.

Na próxima parte, abordaremos o registro de aulas, frequência e tarefas.