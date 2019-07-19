-- Script de Inclusao de dados nas Tabelas e Comentários do Sistema Visao
-- Autor: Alexandre e Rogerio
-- Favor informar antes de executar o script o schema que será usado para receber os objeetos

/************************************
*  INPUT PARAMETERS
************************************/
DEFINE owner=

set timing on
alter session set current_schema=&owner;

set define off
spool EbixVisaoCargaDadosTabDominios.log
@Insert_TB_BANCO.sql
commit;
@Insert_TB_DIA_VENCIMENTO.sql
commit;
@Insert_TB_TIPO_MOTIVO_RECUSA.sql
commit;
@Insert_TB_ESTADO_CIVIL.sql
commit;
@Insert_TB_FORMA_PAGAMENTO.sql
commit;
@Insert_TB_FUNCIONALIDADE.sql
commit;
@Insert_TB_GRAU_PARENTESCO.sql
commit;
@Insert_TB_MOTIVO_RECUSA.sql
commit;
@Insert_TB_OCUPACAO.sql
commit;
@Insert_TB_ORGAO_EMISSOR.sql
commit;
@Insert_TB_PAIS.sql
commit;
@Insert_TB_PERFIL.sql
commit;
@Insert_TB_RAMO.sql
commit;
@Insert_TB_REGIME_TRIBUTARIO.sql
commit;
@Insert_TB_SEXO.sql
commit;
@Insert_TB_SITUACAO.sql
commit;
@Insert_TB_SITUACAO_SEGURADORA.sql
commit;
@Insert_TB_TIPO_DOCUMENTO.sql
commit;
@Insert_TB_TIPO_EMPRESA.sql
commit;
@Insert_TB_TIPO_ENDERECO.sql
commit;
@Insert_TB_TIPO_ENTIDADE.sql
commit;
@Insert_TB_TIPO_MEIO_COMUNICACAO.sql
commit;
@Insert_TB_TIPO_PARAMETRO.sql
commit;
@Insert_TB_TIPO_PORTABILIDADE.sql
commit;
@Insert_TB_TIPO_PRODUTO.sql
commit;
@Insert_TB_TITULARIDADE.sql
commit;
@Insert_TB_UF.sql
commit;
@Insert_TB_VISAO.sql
commit;
@Insert_TB_PRODUTO.sql
commit;
@Insert_TB_DOCUMENTO_CIVIL.sql
commit;
@Insert_TB_PARAMETRIZACAO.sql
commit;
@Insert_TB_PARAMETRO_BATCH.sql
commit;
@Insert_TB_PARAMETRO_FTP.sql
commit;
@Insert_TB_SEGURADORA.sql
commit;
@Insert_TB_ARQ_STATUS_CARGA.sql
commit;
@Insert_TB_ARQ_STATUS_CARGA_LOG.sql
commit;
@Insert_TB_ARQUIVO_MOVI.sql
commit;
spool off
exit
