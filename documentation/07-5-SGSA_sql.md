# 🚨 SGSA – Parte 5: Ocorrências Disciplinares e Comunicacionais

**Tema:** Tabela `ocorrencia`

------

## 🎯 Objetivo

A tabela `ocorrencia` permite registrar eventos relacionados ao comportamento, saúde ou desempenho dos alunos, com distintos níveis de sigilo e impacto.

Esse módulo é fundamental para:

- 🧠 Acompanhamento disciplinar
- 📋 Emissão de relatórios pedagógicos e administrativos
- 🔔 Comunicação entre escola, coordenação e responsáveis

------

## ⚠️ Tabela `ocorrencia`

```sql
CREATE TABLE ocorrencia (
  id INT PRIMARY KEY AUTO_INCREMENT,
  tipo ENUM('Acadêmica','Comportamental','Saúde') NOT NULL,   -- Natureza da ocorrência
  sigilo ENUM('Baixo','Médio','Alto') DEFAULT 'Baixo',         -- Nível de acesso restrito
  descricao TEXT NOT NULL,                                     -- Relato principal
  justificativa TEXT,                                          -- Comentário da coordenação (se houver)
  data DATE NOT NULL,                                          -- Quando ocorreu
  disciplina VARCHAR(100),                                     -- Opcional (caso vinculada a uma matéria)
  aluno_id INT,                                                -- Quem está envolvido
  turma_id INT,
  aula_id INT,
  FOREIGN KEY (aluno_id) REFERENCES usuario(id),
  FOREIGN KEY (turma_id) REFERENCES turma(id),
  FOREIGN KEY (aula_id) REFERENCES aula(id)
);
-- RN14 a RN20, RN26, RN27, RN37
```

------

## 📘 Observações didáticas

- O campo `sigilo` define **quem pode visualizar** a ocorrência:
  - `Baixo`: todos os perfis com acesso pedagógico
  - `Médio`: apenas coordenação e secretaria
  - `Alto`: somente coordenação ou direção
- A associação com `aula` ou `disciplina` é opcional, permitindo registros fora do contexto de sala.
- Justificativas podem ser preenchidas posteriormente pela gestão pedagógica.

Na próxima parte, trataremos da gestão de horários e intervalos escolares.