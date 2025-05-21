# 📈 Diagrama de Fluxo de Dados (DFD) – SGSA – Nível 1

Abaixo está o Diagrama de Fluxo de Dados de nível 1 do sistema SGSA (Sistema de Gerenciamento de Sala de Aula), descrevendo os principais processos e como os dados fluem entre usuários, módulos e banco de dados.

```mermaid
flowchart TD

subgraph EXTERNOS
  Professor["👩‍🏫 Professor"]
  Coordenador["👨‍💼 Coordenação"]
  Secretaria["👩‍💼 Secretaria"]
  Administrador["🧑‍💻 Administrador"]
end

subgraph SGSA
  A1["1. Registro de Aula"]
  A2["2. Chamada e Frequência"]
  A3["3. Tarefas e Avaliação"]
  A4["4. Ocorrências"]
  A5["5. Gestão de Turmas e Estrutura"]
  A6["6. Controle de Acesso e Perfis"]
  A7["7. Agenda e Grade Horária"]
  A8["8. Logs e Auditoria"]
end

subgraph BASE DE DADOS
  BD[(SGSA - MySQL)]
end

%% Conexões com usuários
Professor --> A1
Professor --> A2
Professor --> A3
Professor --> A4
Professor --> A7

Coordenador --> A4
Coordenador --> A5
Coordenador --> A7
Coordenador --> A8

Secretaria --> A5
Secretaria --> A7
Secretaria --> A6

Administrador --> A5
Administrador --> A6
Administrador --> A7
Administrador --> A8

%% Processos com banco de dados
A1 --> BD
A2 --> BD
A3 --> BD
A4 --> BD
A5 --> BD
A6 --> BD
A7 --> BD
A8 --> BD
```

------

## 📌 Legenda dos Módulos

| Código | Módulo                       | Descrição resumida                                       |
| ------ | ---------------------------- | -------------------------------------------------------- |
| A1     | Registro de Aula             | Registro de conteúdo, capítulo, status da aula           |
| A2     | Chamada e Frequência         | Presenças, atrasos, saídas, relatório diário e bimestral |
| A3     | Tarefas e Avaliação          | Criação, status e avaliação de tarefas                   |
| A4     | Ocorrências                  | Registro por tipo, sigilo, disciplina e notificação      |
| A5     | Gestão de Turmas e Estrutura | Séries, turmas, ciclos, intervalos e horários            |
| A6     | Controle de Acesso e Perfis  | Criação de usuários, atribuição de papéis                |
| A7     | Agenda e Grade Horária       | Consulta de horários por perfil e turno                  |
| A8     | Logs e Auditoria             | Registro de alterações e acessos (logs e 2FA)            |
