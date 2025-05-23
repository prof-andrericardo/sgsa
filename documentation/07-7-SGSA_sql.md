# 🧠 SGSA – Parte 7: Preferência de Agenda e Múltiplos Perfis

**Tema:** Tabela `preferencia_agenda`

------

## 🎯 Objetivo

Esta tabela é responsável por armazenar a **preferência do usuário** quanto ao perfil ativo para visualização e priorização de agenda, caso ele tenha múltiplos papéis (professor, coordenador, etc.).

Está associada à **RN46 – Conflito de Agenda por Múltiplos Perfis**, e complementa a `usuario_papel`.

------

## 📋 Tabela `preferencia_agenda`

```sql
CREATE TABLE preferencia_agenda (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,                              -- Qual usuário fez a escolha
  prioridade ENUM('Professor','Coordenador','Secretaria','Administrador') NOT NULL,
  data_definicao DATETIME DEFAULT CURRENT_TIMESTAMP,    -- Quando a preferência foi definida
  FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);
-- RN46
```

------

## 📘 Observações didáticas

- O campo `prioridade` define **qual papel o sistema deve priorizar** em caso de conflito de horários.
- A tabela é opcional e populada **dinamicamente quando o conflito ocorre pela primeira vez**.
- Pode ser expandida futuramente com critérios adicionais como tipo de evento, disciplina ou contexto.

------

Com isso, finalizamos a separação didática e comentada de todas as partes do DDL base do SGSA!
 Se desejar, posso gerar o `.sql` unificado, ou scripts separados para execução incremental.