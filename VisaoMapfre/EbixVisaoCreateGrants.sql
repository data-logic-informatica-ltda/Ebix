-- Script de Atribuição de Grants para os Usuários aplicacionais
-- Autor: Alexandre e Rogerio
-- Favor informar antes de executar o script o schema que será usado para receber os grants dos objeetos

/************************************
*  INPUT PARAMETERS
************************************/
DEFINE owner=
DEFINE grantee1=
DEFINE grantee2=

alter session set current_schema=&owner;

GRANT INSERT, UPDATE, DELETE, SELECT on TB_FORMA_PAGTO_EMPRESA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_RISCO_PRE_FORMATADO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_LAYOUT_EMAIL to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_PRODUTO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_FUNDO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_ESTADO_CIVIL to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_OCUPACAO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_ORGAO_EMISSOR to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_FORMA_PAGAMENTO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_TIPO_MEIO_COMUNICACAO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_COMISSAO_LOG to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_PROPOSTA_COBERTURA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_MOTIVO_RECUSA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_FUNCIONALIDADE to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_TIPO_INVESTIMENTO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_PERFIL to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_USUARIO_DIGITADOR to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_RESPONSAVEL_FINANCEIRO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_RESPONSAVEL_LEGAL to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_PARAMETRIZACAO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_ENDERECO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_PRODUTO_EMPRESA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_COMISSAO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_COMPRA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_ARQ_ALIQ to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_HISTORICO_DOCUMENTO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_TIPO_PARAMETRO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_RAMO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_COMP_ALIQ to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_ARQ_PORTABILIDADE_INTERNA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_DOCUMENTO_BENEFICIARIO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_CODIGO_ACESSO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_INVESTIMENTO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_SEXO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_PAIS to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_PORTABILIDADE_STATUS to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_DE_PARA_HISTORICO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_TIPO_RISCO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_VISAO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_DOCUMENTO_PREVIDENCIA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_USUARIO_CANAL_VENDA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_SEGURADORA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_DOCUMENTO_CIVIL to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_USUARIO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_TIPO_MOTIVO_RECUSA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_ARQUIVO_COTA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_DOCUMENTO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_PORTABILIDADE to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_TIPO_PORTABILIDADE to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_TIPO_ENTIDADE to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_TITULARIDADE to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_SITUACAO_SEGURADORA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_BANCO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_TIPO_ENDERECO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_TIPO_EMPRESA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_DOCUMENTO_COBRANCA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_ARQUIVO_PORTABILIDADE to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_NIF to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_EMPRESA_PARAMETRO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_OBSERVACAO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_HISTORICO_DOC_CORRETOR to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_COBERTURA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_GRUPO_FUNCIONALIDADE to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_ARQUIVO_CADA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_MOTIVO_NIF to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_UF to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_PARAMETRO_FTP to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_NUM_DOCUMENTO_SEG to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_PROPOSTA_FUNDO_INVESTIMENTO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_PARAMETRO_BATCH to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_RISCO_PREFORMAT_COB to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_GRUPO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_GRAU_PARENTESCO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_REGIME_TRIBUTARIO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_TIPO_PRODUTO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_ARQ_STATUS_CARGA_LOG to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_ARQ_STATUS_CARGA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_EMPRESA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_TIPO_DOCUMENTO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_SITUACAO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_DIA_VENCIMENTO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_ARQUIVO_MOVI to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_CLIENTE to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_ARQUIVO_PLAN to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_ESTRUTURA_VENDA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_CANAL_VENDA to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_FUNDO_INVESTIMENTO to &grantee1;
GRANT INSERT, UPDATE, DELETE, SELECT on TB_ARQUIVO_PAGAMENTO to &grantee1;
GRANT SELECT on SQ_EMPRESA to &grantee1;
GRANT SELECT on SQ_ENDERECO to &grantee1;
GRANT SELECT on SQ_ESTRUTURA_VENDA to &grantee1;
GRANT SELECT on SQ_FORMA_PAGTO_EMPRESA to &grantee1;
GRANT SELECT on SQ_FUNDO to &grantee1;
GRANT SELECT on SQ_FUNDO_INVESTIMENTO to &grantee1;
GRANT SELECT on SQ_GRAU_PARENTESCO to &grantee1;
GRANT SELECT on SQ_GRUPO to &grantee1;
GRANT SELECT on SQ_GRUPO_FUNCIONALIDADE to &grantee1;
GRANT SELECT on SQ_HISTORICO to &grantee1;
GRANT SELECT on SQ_HISTORICO_DOC_CORRETOR to &grantee1;
GRANT SELECT on SQ_HISTORICO_MOTIVO_RECUSA to &grantee1;
GRANT SELECT on SQ_INVESTIMENTO to &grantee1;
GRANT SELECT on SQ_NIF to &grantee1;
GRANT SELECT on SQ_NUM_DOC_SEG_PORT to &grantee1;
GRANT SELECT on SQ_NUM_DOC_SEG_PROP to &grantee1;
GRANT SELECT on SQ_PARAMETRO_FTP to &grantee1;
GRANT SELECT on SQ_PORTABILIDADE to &grantee1;
GRANT SELECT on SQ_PORTABILIDADE_STATUS to &grantee1;
GRANT SELECT on SQ_PRODUTO_EMPRESA to &grantee1;
GRANT SELECT on SQ_RAMO to &grantee1;
GRANT SELECT on SQ_RESPONSAVEL_FINANCEIRO to &grantee1;
GRANT SELECT on SQ_RESPONSAVEL_LEGAL to &grantee1;
GRANT SELECT on SQ_USUARIO to &grantee1;
GRANT SELECT on SQ_USUARIO_CANAL_VENDA to &grantee1;
GRANT SELECT on SQ_USUARIO_DIGITADOR to &grantee1;
GRANT SELECT on VW_DOCUMENTO to &grantee1;
GRANT SELECT on VW_PORTABILIDADE to &grantee1;
GRANT SELECT on VW_PROPOSTA to &grantee1;
GRANT SELECT on VW_RELCARTEIRA to &grantee1;
GRANT SELECT on VW_RELPORTABILIDADE to &grantee1;
GRANT SELECT on VW_RELPROPOSTA to &grantee1;
GRANT SELECT on SQ_ARQ_PORTABILIDADE_INTERNA to &grantee1;
GRANT SELECT on SQ_ARQ_STATUS_CARGA to &grantee1;
GRANT SELECT on SQ_ARQ_STATUS_CARGA_LOG to &grantee1;
GRANT SELECT on SQ_ARQUIVO_ALIQ to &grantee1;
GRANT SELECT on SQ_ARQUIVO_CADA to &grantee1;
GRANT SELECT on SQ_ARQUIVO_COTA to &grantee1;
GRANT SELECT on SQ_ARQUIVO_MOVI to &grantee1;
GRANT SELECT on SQ_ARQUIVO_PAGAMENTO to &grantee1;
GRANT SELECT on SQ_ARQUIVO_PLAN to &grantee1;
GRANT SELECT on SQ_ARQUIVO_PORTABILIDADE to &grantee1;
GRANT SELECT on SQ_BANCO to &grantee1;
GRANT SELECT on SQ_BENEFICIARIO to &grantee1;
GRANT SELECT on SQ_CANAL_DE_VENDA to &grantee1;
GRANT SELECT on SQ_CLIENTE to &grantee1;
GRANT SELECT on SQ_COBERTURA to &grantee1;
GRANT SELECT on SQ_COBRANCA to &grantee1;
GRANT SELECT on SQ_CODIGO_ACESSO to &grantee1;
GRANT SELECT on SQ_COMP_ALIQ to &grantee1;
GRANT SELECT on SQ_COMPRA to &grantee1;
GRANT SELECT on SQ_DE_PARA_HISTORICO to &grantee1;
GRANT SELECT on SQ_DOCUMENTO to &grantee1;
GRANT SELECT on SQ_DOCUMENTO_PREVIDENCIA to &grantee1;

--

GRANT SELECT on TB_FORMA_PAGTO_EMPRESA to &grantee2;
GRANT SELECT on TB_RISCO_PRE_FORMATADO to &grantee2;
GRANT SELECT on TB_LAYOUT_EMAIL to &grantee2;
GRANT SELECT on TB_PRODUTO to &grantee2;
GRANT SELECT on TB_FUNDO to &grantee2;
GRANT SELECT on TB_ESTADO_CIVIL to &grantee2;
GRANT SELECT on TB_OCUPACAO to &grantee2;
GRANT SELECT on TB_ORGAO_EMISSOR to &grantee2;
GRANT SELECT on TB_FORMA_PAGAMENTO to &grantee2;
GRANT SELECT on TB_TIPO_MEIO_COMUNICACAO to &grantee2;
GRANT SELECT on TB_COMISSAO_LOG to &grantee2;
GRANT SELECT on TB_PROPOSTA_COBERTURA to &grantee2;
GRANT SELECT on TB_MOTIVO_RECUSA to &grantee2;
GRANT SELECT on TB_FUNCIONALIDADE to &grantee2;
GRANT SELECT on TB_TIPO_INVESTIMENTO to &grantee2;
GRANT SELECT on TB_PERFIL to &grantee2;
GRANT SELECT on TB_USUARIO_DIGITADOR to &grantee2;
GRANT SELECT on TB_RESPONSAVEL_FINANCEIRO to &grantee2;
GRANT SELECT on TB_RESPONSAVEL_LEGAL to &grantee2;
GRANT SELECT on TB_PARAMETRIZACAO to &grantee2;
GRANT SELECT on TB_ENDERECO to &grantee2;
GRANT SELECT on TB_PRODUTO_EMPRESA to &grantee2;
GRANT SELECT on TB_COMISSAO to &grantee2;
GRANT SELECT on TB_COMPRA to &grantee2;
GRANT SELECT on TB_ARQ_ALIQ to &grantee2;
GRANT SELECT on TB_HISTORICO_DOCUMENTO to &grantee2;
GRANT SELECT on TB_TIPO_PARAMETRO to &grantee2;
GRANT SELECT on TB_RAMO to &grantee2;
GRANT SELECT on TB_COMP_ALIQ to &grantee2;
GRANT SELECT on TB_ARQ_PORTABILIDADE_INTERNA to &grantee2;
GRANT SELECT on TB_DOCUMENTO_BENEFICIARIO to &grantee2;
GRANT SELECT on TB_CODIGO_ACESSO to &grantee2;
GRANT SELECT on TB_INVESTIMENTO to &grantee2;
GRANT SELECT on TB_SEXO to &grantee2;
GRANT SELECT on TB_PAIS to &grantee2;
GRANT SELECT on TB_PORTABILIDADE_STATUS to &grantee2;
GRANT SELECT on TB_DE_PARA_HISTORICO to &grantee2;
GRANT SELECT on TB_TIPO_RISCO to &grantee2;
GRANT SELECT on TB_VISAO to &grantee2;
GRANT SELECT on TB_DOCUMENTO_PREVIDENCIA to &grantee2;
GRANT SELECT on TB_USUARIO_CANAL_VENDA to &grantee2;
GRANT SELECT on TB_SEGURADORA to &grantee2;
GRANT SELECT on TB_DOCUMENTO_CIVIL to &grantee2;
GRANT SELECT on TB_USUARIO to &grantee2;
GRANT SELECT on TB_TIPO_MOTIVO_RECUSA to &grantee2;
GRANT SELECT on TB_ARQUIVO_COTA to &grantee2;
GRANT SELECT on TB_DOCUMENTO to &grantee2;
GRANT SELECT on TB_PORTABILIDADE to &grantee2;
GRANT SELECT on TB_TIPO_PORTABILIDADE to &grantee2;
GRANT SELECT on TB_TIPO_ENTIDADE to &grantee2;
GRANT SELECT on TB_TITULARIDADE to &grantee2;
GRANT SELECT on TB_SITUACAO_SEGURADORA to &grantee2;
GRANT SELECT on TB_BANCO to &grantee2;
GRANT SELECT on TB_TIPO_ENDERECO to &grantee2;
GRANT SELECT on TB_TIPO_EMPRESA to &grantee2;
GRANT SELECT on TB_DOCUMENTO_COBRANCA to &grantee2;
GRANT SELECT on TB_ARQUIVO_PORTABILIDADE to &grantee2;
GRANT SELECT on TB_NIF to &grantee2;
GRANT SELECT on TB_EMPRESA_PARAMETRO to &grantee2;
GRANT SELECT on TB_OBSERVACAO to &grantee2;
GRANT SELECT on TB_HISTORICO_DOC_CORRETOR to &grantee2;
GRANT SELECT on TB_COBERTURA to &grantee2;
GRANT SELECT on TB_GRUPO_FUNCIONALIDADE to &grantee2;
GRANT SELECT on TB_ARQUIVO_CADA to &grantee2;
GRANT SELECT on TB_MOTIVO_NIF to &grantee2;
GRANT SELECT on TB_UF to &grantee2;
GRANT SELECT on TB_PARAMETRO_FTP to &grantee2;
GRANT SELECT on TB_NUM_DOCUMENTO_SEG to &grantee2;
GRANT SELECT on TB_PROPOSTA_FUNDO_INVESTIMENTO to &grantee2;
GRANT SELECT on TB_PARAMETRO_BATCH to &grantee2;
GRANT SELECT on TB_RISCO_PREFORMAT_COB to &grantee2;
GRANT SELECT on TB_GRUPO to &grantee2;
GRANT SELECT on TB_GRAU_PARENTESCO to &grantee2;
GRANT SELECT on TB_REGIME_TRIBUTARIO to &grantee2;
GRANT SELECT on TB_TIPO_PRODUTO to &grantee2;
GRANT SELECT on TB_ARQ_STATUS_CARGA_LOG to &grantee2;
GRANT SELECT on TB_ARQ_STATUS_CARGA to &grantee2;
GRANT SELECT on TB_EMPRESA to &grantee2;
GRANT SELECT on TB_TIPO_DOCUMENTO to &grantee2;
GRANT SELECT on TB_SITUACAO to &grantee2;
GRANT SELECT on TB_DIA_VENCIMENTO to &grantee2;
GRANT SELECT on TB_ARQUIVO_MOVI to &grantee2;
GRANT SELECT on TB_CLIENTE to &grantee2;
GRANT SELECT on TB_ARQUIVO_PLAN to &grantee2;
GRANT SELECT on TB_ESTRUTURA_VENDA to &grantee2;
GRANT SELECT on TB_CANAL_VENDA to &grantee2;
GRANT SELECT on TB_FUNDO_INVESTIMENTO to &grantee2;
GRANT SELECT on TB_ARQUIVO_PAGAMENTO to &grantee2;
GRANT SELECT on SQ_EMPRESA to &grantee2;
GRANT SELECT on SQ_ENDERECO to &grantee2;
GRANT SELECT on SQ_ESTRUTURA_VENDA to &grantee2;
GRANT SELECT on SQ_FORMA_PAGTO_EMPRESA to &grantee2;
GRANT SELECT on SQ_FUNDO to &grantee2;
GRANT SELECT on SQ_FUNDO_INVESTIMENTO to &grantee2;
GRANT SELECT on SQ_GRAU_PARENTESCO to &grantee2;
GRANT SELECT on SQ_GRUPO to &grantee2;
GRANT SELECT on SQ_GRUPO_FUNCIONALIDADE to &grantee2;
GRANT SELECT on SQ_HISTORICO to &grantee2;
GRANT SELECT on SQ_HISTORICO_DOC_CORRETOR to &grantee2;
GRANT SELECT on SQ_HISTORICO_MOTIVO_RECUSA to &grantee2;
GRANT SELECT on SQ_INVESTIMENTO to &grantee2;
GRANT SELECT on SQ_NIF to &grantee2;
GRANT SELECT on SQ_NUM_DOC_SEG_PORT to &grantee2;
GRANT SELECT on SQ_NUM_DOC_SEG_PROP to &grantee2;
GRANT SELECT on SQ_PARAMETRO_FTP to &grantee2;
GRANT SELECT on SQ_PORTABILIDADE to &grantee2;
GRANT SELECT on SQ_PORTABILIDADE_STATUS to &grantee2;
GRANT SELECT on SQ_PRODUTO_EMPRESA to &grantee2;
GRANT SELECT on SQ_RAMO to &grantee2;
GRANT SELECT on SQ_RESPONSAVEL_FINANCEIRO to &grantee2;
GRANT SELECT on SQ_RESPONSAVEL_LEGAL to &grantee2;
GRANT SELECT on SQ_USUARIO to &grantee2;
GRANT SELECT on SQ_USUARIO_CANAL_VENDA to &grantee2;
GRANT SELECT on SQ_USUARIO_DIGITADOR to &grantee2;
GRANT SELECT on VW_DOCUMENTO to &grantee2;
GRANT SELECT on VW_PORTABILIDADE to &grantee2;
GRANT SELECT on VW_PROPOSTA to &grantee2;
GRANT SELECT on VW_RELCARTEIRA to &grantee2;
GRANT SELECT on VW_RELPORTABILIDADE to &grantee2;
GRANT SELECT on VW_RELPROPOSTA to &grantee2;
GRANT SELECT on SQ_ARQ_PORTABILIDADE_INTERNA to &grantee2;
GRANT SELECT on SQ_ARQ_STATUS_CARGA to &grantee2;
GRANT SELECT on SQ_ARQ_STATUS_CARGA_LOG to &grantee2;
GRANT SELECT on SQ_ARQUIVO_ALIQ to &grantee2;
GRANT SELECT on SQ_ARQUIVO_CADA to &grantee2;
GRANT SELECT on SQ_ARQUIVO_COTA to &grantee2;
GRANT SELECT on SQ_ARQUIVO_MOVI to &grantee2;
GRANT SELECT on SQ_ARQUIVO_PAGAMENTO to &grantee2;
GRANT SELECT on SQ_ARQUIVO_PLAN to &grantee2;
GRANT SELECT on SQ_ARQUIVO_PORTABILIDADE to &grantee2;
GRANT SELECT on SQ_BANCO to &grantee2;
GRANT SELECT on SQ_BENEFICIARIO to &grantee2;
GRANT SELECT on SQ_CANAL_DE_VENDA to &grantee2;
GRANT SELECT on SQ_CLIENTE to &grantee2;
GRANT SELECT on SQ_COBERTURA to &grantee2;
GRANT SELECT on SQ_COBRANCA to &grantee2;
GRANT SELECT on SQ_CODIGO_ACESSO to &grantee2;
GRANT SELECT on SQ_COMP_ALIQ to &grantee2;
GRANT SELECT on SQ_COMPRA to &grantee2;
GRANT SELECT on SQ_DE_PARA_HISTORICO to &grantee2;
GRANT SELECT on SQ_DOCUMENTO to &grantee2;
GRANT SELECT on SQ_DOCUMENTO_PREVIDENCIA to &grantee2;

exit
