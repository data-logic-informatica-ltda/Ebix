-- Script de Inclusao de dados nas Tabelas e Comentários do Sistema Visao
-- Autor: Alexandre e Rogerio
-- Favor informar antes de executar o script o schema que será usado para receber os objeetos

/************************************
*  INPUT PARAMETERS
************************************/
DEFINE owner=DB_EXCHANGE_VISAO_TST

set timing on
alter session set current_schema=&owner;

set timing on 
set define off
spool EbixVisaoCargaDadosParamPorParc.log
@Insert_TB_EMPRESA_TB_EMPRESA_PARAMETRO.sql
commit;
@Insert_TB_FORMA_PAGTO_EMPRESA.sql
commit;
@Insert_TB_PRODUTO_EMPRESA.sql
commit;
@Insert_TB_GRUPO.sql
commit;
@Insert_TB_GRUPO_FUNCIONALIDADE.sql
commit;
@Insert_TB_CANAL_VENDA.sql
commit;
@Insert_TB_ESTRUTURA_VENDA.sql
commit;
@Insert_TB_USUARIO.sql
commit;
@Insert_TB_USUARIO_CANAL_VENDA.sql
commit;
@Insert_TB_ENDERECO.sql
commit;
@Insert_TB_CLIENTE.sql
commit;
@Insert_TB_RESPONSAVEL_FINANCEIRO.sql
commit;
@Insert_TB_RESPONSAVEL_LEGAL.sql
commit;
@Insert_TB_NIF.sql
commit;
@Insert_TB_INVESTIMENTO.sql
commit;
@Insert_TB_FUNDO.sql
commit;
@Insert_tb_fundo_investimento.sql
commit;
@Insert_TB_DOCUMENTO.sql
commit;
@Insert_TB_HISTORICO_DOCUMENTO.sql
commit;
@Insert_TB_HISTORICO_DOC_CORRETOR.sql
commit;
@Insert_TB_DOCUMENTO_PREVIDENCIA.sql
commit;
@Insert_TB_DOCUMENTO_BENEFICIARIO.sql
commit;
@Insert_TB_DOCUMENTO_COBRANCA.sql
commit;
@Insert_TB_PORTABILIDADE.sql
commit;
@Insert_TB_PROPOSTA_FUNDO_INVESTIMENTO.sql
commit;
@Insert_tb_codigo_acesso.sql
commit;
@Insert_TB_PORTABILIDADE_STATUS.sql
commit;
/*  ESTA TABELA SERA CARREGADA NO DUMP - TICKET 1900225
@Insert_tb_num_documento_seg.sql
commit;
*/
spool off
exit
