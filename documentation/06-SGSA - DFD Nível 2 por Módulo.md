# 📈 Diagrama de Fluxo de Dados (DFD) – SGSA – Nível 2 por Módulo

Este documento apresenta os DFDs de Nível 2 detalhados para cada um dos 8 módulos principais do SGSA.

------

## 📘 Módulo A1 – Registro de Aula

```mermaid
flowchart TD
Professor --> P1["Preencher Conteúdo, Capítulo, Páginas"]
Professor --> P2["Marcar Aula como Realizada ou Prevista"]
P1 --> BD[(AULA)]
P2 --> BD
```

------

## 📘 Módulo A2 – Chamada e Frequência

```mermaid
flowchart TD
Professor --> C1["Selecionar Aula e Turma"]
Professor --> C2["Marcar Presenças, Atrasos, Justificativas"]
C2 --> BD[(CHAMADA)]
C3["Gerar Relatório Diário"] --> BD
Coordenador --> C3
```

------

## 📘 Módulo A3 – Tarefas e Avaliação

```mermaid
flowchart TD
Professor --> T1["Criar Nova Tarefa"]
Professor --> T2["Atribuir a Aluno/Turma"]
T2 --> T2a[Marcar se vinculada]
T2a --> BD
Aluno --> T3["Enviar Resposta"]
Professor --> T4["Avaliar e Atribuir Status"]
T1 --> BD[(TAREFA)]
T2 --> BD
T3 --> BD
T4 --> BD
```

------

## 📘 Módulo A4 – Ocorrências

```mermaid
flowchart TD
Professor --> O1["Selecionar Aula/Aluno"]
Professor --> O2["Preencher Tipo, Descrição, Sigilo"]
Professor --> O3["Relacionar à Disciplina (opcional)"]
O2 --> BD[(OCORRENCIA)]
Coordenador --> O4["Visualizar Ocorrência"]
O4 --> BD
```

------

## 📘 Módulo A5 – Gestão de Turmas e Estrutura

```mermaid
flowchart TD
Administrador --> G1["Cadastrar Ciclo"]
G1 --> G2["Definir Série por Ciclo"]
G2 --> G3["Criar Turmas por Ano Letivo"]
G3 --> G4["Definir Turno por Turma"]
G4 --> BD[(TURMA, CICLO, SERIE)]
```


```mermaid
flowchart TD
Administrador --> G1["Cadastrar Ciclo/Série"]
Administrador --> G2["Criar Turmas"]
Administrador --> G3["Atribuir Turno"]
Administrador --> G4["Definir Grade Horária"]
Secretaria --> G5["Consultar Estrutura"]
G1 --> BD
G2 --> BD
G3 --> BD
G4 --> BD[(TURMA, GRADE_HORARIA)]
G5 --> BD
```

------

## 📘 Módulo A6 – Controle de Acesso e Perfis

```mermaid
flowchart TD
Administrador --> A1["Criar Usuário"]
Administrador --> A2["Atribuir Perfil (Professor, Coordenação, etc.)"]
Administrador --> A3["Editar Permissões"]
Secretaria --> A4["Consultar Usuários"]
Usuario --> A5["Alternar Perfil em Tempo Real"]
A5 --> Sistema
A1 --> BD[(USUARIO)]
A2 --> BD[(USUARIO_PAPEL)]
A3 --> BD
A4 --> BD
```

------

## 📘 Módulo A7 – Agenda e Grade Horária

```mermaid
flowchart TD
Usuario["Com múltiplos perfis"] --> C1["Solicita agenda integrada"]
C1 --> C2{"Conflito de horário?"}
C2 -->|Sim| C3["Solicita resolução de prioridade"]
C3 --> BD
C2 -->|Não| C4["Exibe agenda consolidada"]
C4 --> BD
```


```mermaid
flowchart TD
Professor --> H1["Visualizar Horário por Turma"]
Coordenador --> H2["Consultar Agenda Integrada"]
Secretaria --> H3["Consultar Grade por Série"]
Administrador --> H4["Definir Intervalos por Segmento"]
H1 --> BD[(GRADE_HORARIA)]
H2 --> BD
H3 --> BD
H4 --> BD[(INTERVALO_ESCOLAR)]
```

------

## 📘 Módulo A8 – Logs e Auditoria

```mermaid
flowchart TD
Administrador --> L1["Acessar Logs de Sistema"]
Administrador --> L2["Consultar Alterações por Usuário"]
Coordenador --> L3["Auditar Registros Sensíveis"]
L1 --> BD[(LOG_ACESSO)]
L2 --> BD
L3 --> BD
```


---

## 📘 Módulo A9 – Gerenciamento de Perfil e Conflitos de Agenda

Este módulo representa as ações descritas nas **RN45** (Troca de Perfis em Tempo Real) e **RN46** (Conflitos de Agenda entre Múltiplos Perfis). Ele centraliza as decisões que antes estavam fragmentadas entre os módulos A6 e A7.

### 🔄 Fluxo – Troca de Perfil e Resolução de Conflitos

```mermaid
flowchart TD
Usuario --> P1["Selecionar Perfil Ativo (RN45)"]
Sistema --> P2["Detectar Conflito de Agenda (RN46)"]
P2 --> P3{"Conflito entre papéis?"}
P3 -->|Sim| P4["Solicitar Prioridade ao Usuário"]
P4 --> P5["Gravar Preferência"]
P5 --> BD[(PREFERENCIA_AGENDA)]
P3 -->|Não| P6["Mostrar Agenda Consolidada"]
P6 --> BD
```

**Entrada:** Perfil logado, múltiplas permissões atribuídas  
**Saída:** Preferência registrada ou agenda resolvida dinamicamente  
