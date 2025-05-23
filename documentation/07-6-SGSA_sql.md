# ⏰ SGSA – Parte 6: Horários e Intervalos Escolares

**Tema:** Tabelas `grade_horaria` e `intervalo_escolar`

------

## 🎯 Objetivo

Essas tabelas organizam a estrutura temporal da rotina escolar:

- A grade define os horários padrão de cada aula
- Os intervalos especificam os períodos de pausa por segmento e turno

Permite flexibilidade por faixa etária, nível escolar e períodos distintos (manhã, tarde, noite).

------

## 🗓️ Tabela `grade_horaria`

```sql
CREATE TABLE grade_horaria (
  id INT PRIMARY KEY AUTO_INCREMENT,
  turno ENUM('Matutino','Vespertino','Noturno'),     -- Período do dia
  segmento VARCHAR(100),                             -- Ex: Infantil, Fundamental II
  ordem_aula TINYINT,                                -- Posição da aula no turno (1 a 7)
  hora_inicio TIME,
  hora_fim TIME
);
-- RN29, RN30
```

------

## 🧃 Tabela `intervalo_escolar`

```sql
CREATE TABLE intervalo_escolar (
  id INT PRIMARY KEY AUTO_INCREMENT,
  turno ENUM('Matutino','Vespertino','Noturno'),
  segmento VARCHAR(100),                             -- Ex: Ensino Médio, 8º e 9º ano
  hora_inicio TIME,
  hora_fim TIME,
  observacao TEXT                                     -- Livre para anotações da escola
);
-- RN38, RN46
```

------

## 📘 Observações didáticas

- A `grade_horaria` pode ter de 1 a 7 aulas, com ou sem tempo igual entre elas.
- A `ordem_aula` ajuda a ordenar corretamente no frontend e em relatórios.
- A `intervalo_escolar` é segmentado, permitindo mais de um intervalo por turno.
- As duas tabelas **não possuem chaves estrangeiras**, pois são configurações institucionais.

Na próxima (e última) parte, trataremos da tabela de preferências de agenda e conflitos por múltiplos perfis.