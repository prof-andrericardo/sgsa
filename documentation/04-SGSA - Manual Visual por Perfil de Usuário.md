# 📘 Manual Visual por Perfil de Usuário – SGSA

Este manual apresenta de forma clara e objetiva as funcionalidades e regras de negócio associadas a cada perfil de usuário do Sistema de Gerenciamento de Sala de Aula (SGSA). Cada seção contém os objetivos, regras aplicáveis e uma visão funcional simplificada.

------

## 👩‍🏫 Perfil: Professor

### 🎯 Objetivos do Usuário

- Registrar aulas e conteúdos.
- Realizar chamadas e justificar ausências.
- Atribuir, avaliar e acompanhar tarefas.
- Registrar ocorrências.
- Consultar agenda e horários.

### 🔒 Regras de Negócio Associadas

- **RN06**: Estrutura de aula
- **RN07**: Conteúdo obrigatório
- **RN08**: Janela de edição de aulas
- **RN09**: Registro individual de frequência
- **RN10**: Consolidação diária da frequência
- **RN11–RN13**: Atribuição, estrutura e notificação de tarefas
- **RN14–RN16**: Registro e notificação de ocorrências
- **RN19**: Histórico de faltas
- **RN23**: Aula não ministrada
- **RN24**: Registro ampliado (atraso, saída antecipada)
- **RN25**: Tarefas fora de aula
- **RN30**: Grade horária por segmento
- **RN34**: Planejamento de aulas futuras
- **RN35**: Status das tarefas
- **RN36**: Avaliação digital
- **RN45**: Troca de perfil em tempo real
- **RN37**: Ocorrência por disciplina
- **RN38**: Visualização integrada da agenda

### 🧭 Funcionalidades Visuais

- Tela de Registro de Aula
- Tela de Chamada (modo rápido e detalhado)
- Tela de Tarefas com status e filtros
- Tela de Ocorrências por tipo
- Agenda Semanal do Professor

------

## 👨‍💼 Perfil: Coordenação (Pedagógica e Administrativa)

### 🎯 Objetivos do Usuário

- Supervisionar professores e turmas.
- Acompanhar frequência e ocorrências.
- Analisar e intervir em registros críticos.
- Gerar relatórios e validar informações pedagógicas.

### 🔒 Regras de Negócio Associadas

- **RN01**: Acesso hierárquico
- **RN17**: Controle de dados sensíveis
- **RN18**: Alerta de aniversários
- **RN19**: Histórico de faltas
- **RN20**: Relatórios mensais de ocorrências
- **RN22**: Logs de acesso
- **RN26**: Sigilo de ocorrências
- **RN27**: Ocorrência fora de aula
- **RN28**: Turno obrigatório por turma
- **RN30**: Grade horária por segmento
- **RN31**: Autenticação 2FA (planejada)
- **RN32**: Auditoria de alterações
- **RN33**: Histórico de turmas
- **RN34**: Planejamento de aulas futuras
- **RN36**: Avaliação digital
- **RN45**: Troca de perfil em tempo real supervisionada
- **RN37**: Ocorrência por disciplina
- **RN38**: Agenda geral consolidada
- **RN46**: Conflito de agendas por múltiplos perfis

### 🧭 Funcionalidades Visuais

- Painel de Supervisão de Turmas
- Relatórios de Frequência e Ocorrência
- Tela de Logs e Auditoria
- Painel de Acompanhamento de Professores
- Agenda e Mapa de Horários por Turno
- Visualizar e Resolver Conflitos de Agenda

------

## 👩‍💼 Perfil: Secretaria

### 🎯 Objetivos do Usuário

- Gerenciar dados administrativos (matrícula, históricos, documentos).
- Consultar turmas, professores e horários.
- Atender responsáveis com dados atualizados.

### 🔒 Regras de Negócio Associadas

- **RN01**: Acesso hierárquico
- **RN02**: Cadastro centralizado
- **RN17**: Acesso controlado a dados sensíveis
- **RN18**: Notificação de aniversários
- **RN22**: Registro de acesso (logins)
- **RN28**: Turno obrigatório da turma
- **RN29**: Intervalos personalizados
- **RN30**: Grade horária por segmento
- **RN33**: Histórico de turmas
- **RN38**: Agenda visual consolidada por série/turno

### 🧭 Funcionalidades Visuais

- Cadastro e Consulta de Alunos e Responsáveis
- Tela de Grade Horária por Turma
- Agenda Escolar Integrada
- Relatórios Administrativos (matrícula, histórico)
- Painel de Acessos e Permissões

------

## 🧑‍💻 Perfil: Administrador do Sistema

### 🎯 Objetivos do Usuário

- Gerenciar todos os usuários e perfis.
- Controlar e configurar a estrutura institucional (ciclos, séries, turmas, horários, intervalos).
- Supervisionar acessos e auditorias.
- Definir regras globais e segurança do sistema.

### 🔒 Regras de Negócio Associadas

- **RN01**: Acesso hierárquico
- **RN02**: Cadastro centralizado
- **RN21**: Multipapel de usuários
- **RN22**: Registro de acesso
- **RN28**: Turno obrigatório da turma
- **RN29**: Intervalos personalizados
- **RN30**: Grade horária por segmento
- **RN31**: Autenticação em dois fatores
- **RN32**: Auditoria de alterações
- **RN33**: Histórico de mudanças de turma
- **RN38**: Agenda visual integrada
- **RN39**: Gerenciamento de usuários e perfis
- **RN40**: Manutenção da estrutura institucional
- **RN41**: Acesso administrativo completo
- **RN42**: Configurações globais do sistema
- **RN44**: Auditoria de alterações
- **RN45**: Troca de perfil em tempo real
- **RN46**: Conflito de agendas por múltiplos perfis

### 🧭 Funcionalidades Visuais

- Painel de Administração Geral
- Cadastro e Edição de Usuários
- Atribuição de Perfis e Papéis
- Editor de Ciclos, Séries e Turmas
- Gerenciamento da Grade Horária e Intervalos
- Configurações de Segurança (2FA, logs, permissões)
- Tela de Auditoria e Histórico de Ações
- Relatórios Institucionais e Exportações

------

## 📌 Observações Finais

- A interface do SGSA será adaptada de acordo com o perfil de acesso.
- Cada perfil visualizará apenas as funcionalidades e dados permitidos pelas regras de negócio.
- A agenda integrada (RN38) será o ponto central de interação para todos os perfis.
