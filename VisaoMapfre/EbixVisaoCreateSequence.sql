-- Criação das sequences Sistema Visão
-- Autor: Alexandre e Rogerio
-- Favor informar antes de executar o script o schema que será usado para receber os objeetos

/************************************
*  INPUT PARAMETERS
************************************/
DEFINE owner=

alter session set current_schema=&owner;

spool create_sequence.log

-- Sequences

prompt "Creating Sequences"

create sequence SQ_ARQ_PORTABILIDADE_INTERNA	START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_ARQ_STATUS_CARGA		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_ARQ_STATUS_CARGA_LOG		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_ARQUIVO_ALIQ			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_ARQUIVO_CADA			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_ARQUIVO_COTA			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_ARQUIVO_MOVI			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_ARQUIVO_PAGAMENTO		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_ARQUIVO_PLAN			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_ARQUIVO_PORTABILIDADE 	START WITH 1  INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_BANCO			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_BENEFICIARIO			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_CANAL_DE_VENDA		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_CLIENTE			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_COBERTURA			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_COBRANCA			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_CODIGO_ACESSO		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_COMP_ALIQ			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_COMPRA			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_DE_PARA_HISTORICO		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_DOCUMENTO			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_DOCUMENTO_PREVIDENCIA	START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_EMPRESA			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_ENDERECO			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_ESTRUTURA_VENDA		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_FORMA_PAGTO_EMPRESA		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_FUNDO			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_FUNDO_INVESTIMENTO		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_GRAU_PARENTESCO		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_GRUPO			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_GRUPO_FUNCIONALIDADE		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_HISTORICO			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_HISTORICO_DOC_CORRETOR	START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_HISTORICO_MOTIVO_RECUSA	START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_INVESTIMENTO			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_NIF				START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_NUM_DOC_SEG_PORT		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_NUM_DOC_SEG_PROP		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_PARAMETRO_FTP		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_PORTABILIDADE		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_PORTABILIDADE_STATUS		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_PRODUTO_EMPRESA		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_RAMO				START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_RESPONSAVEL_FINANCEIRO	START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_RESPONSAVEL_LEGAL		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_USUARIO			START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_USUARIO_CANAL_VENDA		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
create sequence SQ_USUARIO_DIGITADOR		START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

prompt "Fim do Script CreateSequences"

spool off

exit 
