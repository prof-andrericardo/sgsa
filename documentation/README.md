# 📘 SGSA – Índice Mestre dos Scripts DDL

**Sistema de Gerenciamento de Sala de Aula (SGSA)**
 **Versão:** v1.1 • **Banco:** MySQL 8+ • **Charset:** utf8mb4

Este repositório contém os scripts SQL organizados em partes didáticas para construção completa do banco de dados do SGSA, seguindo as boas práticas de normalização (3FN) e referência direta às regras de negócio (RN01–RN46).

------

## 🗂️ Estrutura dos Arquivos DDL

| Nº   | Arquivo                      | Conteúdo                                                     |
| ---- | ---------------------------- | ------------------------------------------------------------ |
| 01   | `01_estrutura.sql`           | Criação do banco `sgsa`, charset `utf8mb4`, collation, `USE` |
| 02   | `02_usuarios.sql`            | Tabelas `usuario`, `usuario_papel`, `log_acesso` (autenticação e perfis) |
| 03   | `03_estrutura_academica.sql` | Tabelas `ciclo`, `serie`, `ano_letivo`, `turma`              |
| 04   | `04_aula_chamada_tarefa.sql` | Tabelas `aula`, `chamada`, `tarefa` (registro de aulas e tarefas) |
| 05   | `05_ocorrencias.sql`         | Tabela `ocorrencia` (disciplinar, saúde, acadêmica, com sigilo) |
| 06   | `06_horarios.sql`            | Tabelas `grade_horaria` e `intervalo_escolar`                |
| 07   | `07_preferencia_agenda.sql`  | Tabela `preferencia_agenda` (conflito entre múltiplos papéis - RN46) |
| 📦    | `SGSA_Modelo_Completo.sql`   | Script completo e consolidado de todas as partes acima       |

------

## 🧠 Regras de Negócio Mapeadas

Todos os scripts estão comentados com as RNs correspondentes para facilitar rastreabilidade, por exemplo:

```sql
-- RN19: Histórico de faltas consolidado por períodos
-- RN45: Troca de perfil em tempo real
-- RN46: Resolução de conflitos de agenda
```

------

## ✅ Recomendações

- Execute os scripts **na ordem numérica sugerida** para respeitar dependências entre tabelas.
- Utilize um gerenciador de banco com suporte a `utf8mb4` (MySQL 8.0 ou superior).
- Verifique permissões de `FOREIGN KEY` e ative o `InnoDB` como engine padrão.

------

Para mais informações técnicas, consulte os documentos de modelagem conceitual e funcional disponíveis na pasta `/documentacao`.