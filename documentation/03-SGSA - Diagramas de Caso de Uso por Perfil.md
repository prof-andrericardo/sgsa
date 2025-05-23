# 📊 Diagramas de Caso de Uso por Perfil – SGSA

A seguir estão os esboços dos **casos de uso** representando as funcionalidades principais de cada perfil do sistema SGSA.

------

## 👩‍🏫 Caso de Uso – Professor

```mermaid
flowchart TB
    Professor["👤 Professor"]

    subgraph SGSA [SGSA - Sistema]
        A1["Registrar Aula"]
        A2["Editar Aula em até 72h"]
        A3["Planejar Aula Futura"]
        A4["Realizar Chamada"]
        A5["Justificar Ausência de Aluno"]
        A6["Gerenciar Tarefas e Avaliações"]
                A8["Registrar Ocorrência"]
        A9["Visualizar Agenda"]
        A10["Alternar Perfis de Acesso (RN45)"]
    end

    Professor --> A1
    Professor --> A2
    Professor --> A3
    Professor --> A4
    Professor --> A5
    Professor --> A6
        Professor --> A10["Alternar Perfis (RN45)"]
        Professor --> A8
    Professor --> A9
    Professor --> A10["Alternar Perfis de Acesso (RN45)"]
```

------

## 👨‍💼 Caso de Uso – Coordenação

```mermaid
flowchart TB
    Coordenador["👤 Coordenador"]

    subgraph SGSA [SGSA - Sistema]
        B1["Visualizar Registros de Aula"]
        B2["Gerar Relatórios de Frequência"]
        B3["Visualizar e Classificar Ocorrências"]
        B4["Receber Notificações Graves"]
        B5["Auditar Alterações de Dados"]
        B6["Gerenciar Grade Horária"]
        B7["Gerenciar Turnos e Intervalos"]
        B8["Visualizar Agenda Consolidada"]
        B9["Gerenciar Conflitos de Agenda (RN46)"]
    end

    Coordenador --> B1
    Coordenador --> B2
    Coordenador --> B3
    Coordenador --> B4
    Coordenador --> B5
    Coordenador --> B6
    Coordenador --> B7
    Coordenador --> B8
    Coordenador --> B9
```

------

## 👩‍💼 Caso de Uso – Secretaria

```mermaid
flowchart TB
    Secretaria["👤 Secretaria"]

    subgraph SGSA [SGSA - Sistema]
        C1["Cadastrar Alunos"]
        C2["Gerar Declarações e Documentos"]
        C3["Consultar Grade de Turmas"]
        C4["Consultar Professores"]
        C5["Emitir Histórico de Turmas"]
        C6["Visualizar Agenda por Série"]
        C7["Consultar Dados Sensíveis conforme Permissão"]
    end

    Secretaria --> C1
    Secretaria --> C2
    Secretaria --> C3
    Secretaria --> C4
    Secretaria --> C5
    Secretaria --> C6
    Secretaria --> C7
```

------

## 🧑‍💻 Caso de Uso – Administrador

```mermaid
flowchart TB
    Administrador["👤 Administrador"]

    subgraph SGSA [SGSA - Sistema]
        D1["Cadastrar Usuários"]
        D2["Atribuir Perfis"]
        D3["Editar Permissões"]
        D4["Gerenciar Ciclos, Séries e Turmas"]
        D5["Configurar Grade Horária Global"]
        D6["Configurar Intervalos por Segmento"]
        D7["Auditar Logs do Sistema"]
        D8["Configurar Parâmetros do Sistema"]
        D9["Ativar 2FA Global"]
        D10["Gerenciar Estrutura Institucional (RN40)"]
        D11["Gerenciar Conflitos de Agenda (RN46)"]
        D12["Trocar de Perfil em Tempo Real (RN45)"]
    end

    Administrador --> D1
    Administrador --> D2
    Administrador --> D3
    Administrador --> D4
    Administrador --> D5
    Administrador --> D6
    Administrador --> D7
    Administrador --> D8
    Administrador --> D9
    Administrador --> D10
    Administrador --> D11
    Administrador --> D12
```
