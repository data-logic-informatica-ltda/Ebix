##########################################################################################################
# Roteiro de Migracao - Ebix & DLDBA
# Scripts de Base de Dados para Migracao para a nova versao do Sistema Visao
# Descricao dos passos que serao realizados pela migracao para a nova versao do Visao
##########################################################################################################

- Backup do Schema
- Criacao do schema
- Execucao dos scripts para criacao da estrutura basica dos objetos do schema
- Carga das tabelas Basicas com os Scripts de Insert
- Carga das tabelas Basicas com Export/Import - Maiores tabelas
- Criacao dos Indices e Constraints
- Criacao das Views
- Criacao das Sequences
- Criacao dos Triggers
- Tabelas que serao carregadas com o datapump
  - Todas que se iniciam com TB_ARQ (Origem - WISGCICATU_PRD)
	TB_ARQ_STATUS_CARGA_LOG
	TB_ARQ_STATUS_CARGA
	TB_ARQUIVO_PLAN
	TB_ARQUIVO_COTA
	TB_ARQUIVO_CADA
  - Tabela TB_LAYOUT_EMAIL (Origem - Ambiente Teste) 
