# 📘 Documento de Regras de Negócio – SGSA

**Sistema:** SGSA – Sistema de Gerenciamento de Sala de Aula
**Versão Final:** 5.0+ (complementada com sugestões e análises de usuários)
**Atualizado em:** 17/05/2025

------

## 🎯 Visão Geral

Este documento apresenta, de forma detalhada e meticulosa, todas as **Regras de Negócio (RN)** do SGSA – Sistema de Gerenciamento de Sala de Aula. As regras foram consolidadas com base nas análises de funcionalidades por perfil, requisitos pedagógicos, administrativos e operacionais, refletindo a maturidade do projeto.

As RNs estão organizadas por módulo funcional e perfil de usuário relacionado.

------

## 🔐 1. Controle de Acesso e Perfis

| Código | Regra                              | Descrição                                                    |
| ------ | ---------------------------------- | ------------------------------------------------------------ |
| RN01   | Acesso hierárquico                 | Diretor > Coordenação > Professores > Secretaria, cada um com permissões específicas. |
| RN02   | Cadastro centralizado              | Todos os usuários são registrados via tabela única com tipo definido por perfil. |
| RN03   | Validação de credenciais           | Login via e-mail e senha criptografada.                      |
| RN21   | Multipapel de usuários             | Um usuário pode assumir múltiplos papéis (ex: professor e coordenador). |
| RN22   | Registro de acesso                 | Todo login é registrado com data, hora, IP e agente.         |
| RN31   | Autenticação em dois fatores (2FA) | Ativação de 2FA para perfis críticos (ex: administrador, coordenação). |
| RN32   | Auditoria de alterações            | Todas as alterações relevantes são registradas para rastreabilidade. |
| RN39   | Gerenciamento de usuários e perfis | O administrador pode criar, editar, desativar usuários e atribuir/remover perfis. |
| RN41   | Acesso administrativo completo     | O administrador tem permissão irrestrita ao sistema e aos dados sensíveis. |
| RN42   | Configurações globais do sistema   | O administrador define parâmetros de segurança, acesso e operação sistêmica. |

------

## 🏫 2. Estrutura Acadêmica

| Código | Regra                   | Descrição                                                    |
| ------ | ----------------------- | ------------------------------------------------------------ |
| RN04   | Vinculação acadêmica    | Ciclos, séries e turmas estão relacionadas por ano letivo.   |
| RN05   | Composição de turma     | Cada turma é composta por alunos, professores e associada ao turno. |
| RN28   | Turno obrigatório       | Cada turma deve ter um turno definido (Matutino, Vespertino, Noturno). |
| RN33   | Histórico de turmas     | Mudanças de turma dos alunos são registradas com data de entrada e saída. |
| RN40   | Estrutura institucional | O administrador pode gerenciar ciclos, séries, turmas, horários e intervalos. |

------

## 🧑‍🏫 3. Registro de Aula

| Código | Regra                         | Descrição                                                    |
| ------ | ----------------------------- | ------------------------------------------------------------ |
| RN06   | Estrutura de aula             | Aulas possuem campos obrigatórios: conteúdo, capítulo, páginas, data, horário. |
| RN07   | Conteúdo obrigatório          | O campo de conteúdo da aula é obrigatório para seu registro. |
| RN08   | Janela de edição              | Aulas podem ser editadas por até 72 horas após registradas.  |
| RN23   | Aula não ministrada           | Aulas podem ser marcadas como `foi_realizada = false`.       |
| RN34   | Planejamento de aulas futuras | Aulas podem ser cadastradas como `prevista`, `realizada` ou `cancelada`. |

------

## 🧾 4. Chamada e Frequência

| Código | Regra               | Descrição                                                    |
| ------ | ------------------- | ------------------------------------------------------------ |
| RN09   | Registro individual | Frequência é registrada por aluno, por aula.                 |
| RN10   | Consolidação diária | O sistema gera relatórios de frequência ao final de cada dia. |
| RN19   | Histórico de faltas | Consolidado por bimestre, série, aluno.                      |
| RN24   | Registro ampliado   | Marcação de presença suporta `atrasado`, `saiu cedo`, `parcial`. |

------

## 📚 5. Tarefas e Atividades

| Código | Regra                  | Descrição                                                    |
| ------ | ---------------------- | ------------------------------------------------------------ |
| RN11   | Atribuição flexível    | Tarefas podem ser atribuídas por turma ou individualmente por aluno. |
| RN12   | Estrutura da tarefa    | Toda tarefa deve conter: descrição, capítulo, páginas, tipo, prazo. |
| RN13   | Notificação de prazo   | Alerta enviado ao aluno e/ou responsável 48h antes do vencimento. |
| RN25   | Atividade fora da aula | Tarefas podem ser cadastradas independentemente de uma aula. |
| RN35   | Status das tarefas     | As tarefas têm status: `pendente`, `entregue`, `atrasada`, `reentregue`. |
| RN36   | Avaliação digital      | Tarefas podem ser avaliadas diretamente dentro do sistema por critérios definidos. |

------

## ⚠️ 6. Ocorrências

| Código | Regra                     | Descrição                                                    |
| ------ | ------------------------- | ------------------------------------------------------------ |
| RN14   | Classificação             | Tipos de ocorrência: Acadêmica, Comportamental, Saúde.       |
| RN15   | Registro detalhado        | Requer tipo, descrição, justificativa, data.                 |
| RN16   | Notificação               | Ocorrências graves geram alerta automático para a coordenação. |
| RN20   | Relatório de ocorrências  | Relatórios periódicos (mensal, bimestral).                   |
| RN26   | Nível de sigilo           | Ocorrências têm níveis de visibilidade: baixo, médio, alto.  |
| RN27   | Ocorrência fora da aula   | Podem ser registradas mesmo sem vínculo com uma aula.        |
| RN37   | Ocorrência por disciplina | Permite vincular a ocorrência a uma disciplina específica.   |

------

## 🕒 7. Horários e Agenda

| Código | Regra                       | Descrição                                                    |
| ------ | --------------------------- | ------------------------------------------------------------ |
| RN29   | Intervalos personalizados   | Cada série ou segmento possui horários próprios de intervalo. |
| RN30   | Grade horária por segmento  | Segmentos têm estrutura de horário distinta por turno.       |
| RN38   | Agenda integrada por perfil | Usuários veem sua agenda consolidada com base em seu papel (professor, coordenação etc.). |

------

## ✅ Conclusão

Estas regras representam o núcleo lógico e funcional do SGSA. Elas foram criadas em diálogo com os diferentes perfis do sistema, considerando:

- A realidade operacional de escolas técnicas e regulares.
- A rastreabilidade e segurança dos registros.
- A personalização por faixa etária, segmento e função.
