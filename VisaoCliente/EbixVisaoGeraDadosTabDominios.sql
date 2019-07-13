set lines 200
set pages 0
set head off

-- =======================================================================
--
-- POPULA - TB_DE_PARA_HISTORICO
-- NÃO EXISTE EM WISGCICATU_PRD
--
-- POPULA - TB_MOTIVO_NIF
-- NÃO EXISTE EM WISGCICATU_PRD
--
-- POPULA - TB_TIPO_INVESTIMENTO
-- NÃO EXISTE EM WISGCICATU_PRD
--
-- POPULA - TB_TIPO_RISCO
-- NÃO EXISTE EM WISGCICATU_PRD
--
-- 06 - TB_LAYOUT_EMAIL     - coluna DS_LAYOUT_EMAIL     - CLOB - 0 linha
--
-- =======================================================================

-- 01 - POPULA - TB_BANCO
-- Tabela TB_BANCO do visão não terá a coluna FL_ATIVO
SELECT 'INSERT INTO TB_BANCO (CD_BANCO,DESC_BANCO,NUM_BANCO) VALUES ('||CD_BANCO||','''||DESC_BANCO||''','||NUM_BANCO||');'
FROM WISGCICATU_PRD.TB_BANCO
.
spool Insert_TB_BANCO.sql
/
spool off;

-- 02 - POPULA - TB_DIA_VENCIMENTO
SELECT 'INSERT INTO TB_DIA_VENCIMENTO (ID_DIA_VENCIMENTO,NUM_DIA_VENCIMENTO) VALUES ('||ID_DIA_VENCIMENTO||','||NUM_DIA_VENCIMENTO||');'
FROM WISGCICATU_PRD.TB_DIA_VENCIMENTO
.
spool Insert_TB_DIA_VENCIMENTO.sql
/
spool off;

-- 04 - POPULA - TB_ESTADO_CIVIL
SELECT 'INSERT INTO TB_ESTADO_CIVIL (ID,NM_ESTADO_CIVIL) VALUES ('||ID||','''||NM_ESTADO_CIVIL||''');'
FROM WISGCICATU_PRD.TB_ESTADO_CIVIL
.
spool Insert_TB_ESTADO_CIVIL.sql
/
spool off;

-- 05 - POPULA - TB_FORMA_PAGAMENTO
SELECT 'INSERT INTO TB_FORMA_PAGAMENTO (ID,NM_FORMA_PAGAMENTO) VALUES ('||ID||','''||NM_FORMA_PAGAMENTO||''');'
FROM WISGCICATU_PRD.TB_FORMA_PAGAMENTO
.
spool Insert_TB_FORMA_PAGAMENTO.sql
/
spool off;

-- 06 - POPULA - TB_FUNCIONALIDADE
SELECT 'INSERT INTO TB_FUNCIONALIDADE (ID,NM_MODULO,NM_FUNCIONALIDADE,NM_OPERACAO) VALUES ('||ID||','''||NM_MODULO||''','''||NM_FUNCIONALIDADE||''','''||NM_OPERACAO||''');'
FROM WISGCICATU_PRD.TB_FUNCIONALIDADE
.
spool Insert_TB_FUNCIONALIDADE.sql
/
spool off;

-- 07 - POPULA - TB_GRAU_PARENTESCO
SELECT 'INSERT INTO TB_GRAU_PARENTESCO (ID,DS_GRAU_PARENTESCO,FL_ATIVO) VALUES ('||ID||','''||DS_GRAU_PARENTESCO||''','''||FL_ATIVO||''');'
FROM WISGCICATU_PRD.TB_GRAU_PARENTESCO
.
spool Insert_TB_GRAU_PARENTESCO.sql
/
spool off;

-- 08 - POPULA - TB_LAYOUT_EMAIL
SELECT 'INSERT INTO TB_LAYOUT_EMAIL (ID,DS_ASSUNTO,DS_LAYOUT_EMAIL,DS_TIPO_LAYOUT_EMAIL) VALUES ('||ID||','''||DS_ASSUNTO||''','''||DS_LAYOUT_EMAIL||''','''||DS_TIPO_LAYOUT_EMAIL||''');'
FROM WISGCICATU_PRD.TB_LAYOUT_EMAIL
.
spool Insert_TB_LAYOUT_EMAIL.sql
/
spool off;

-- 09 - POPULA - TB_MOTIVO_RECUSA
SELECT 'INSERT INTO TB_MOTIVO_RECUSA (ID,NM_MOTIVO,DS_MOTIVO,PID_TIPO_MOTIVO_RECUSA) VALUES ('||ID||','''||NM_MOTIVO||''','''||DS_MOTIVO||''','||PID_TIPO_MOTIVO_RECUSA||');'
FROM WISGCICATU_PRD.TB_MOTIVO_RECUSA
.
spool Insert_TB_MOTIVO_RECUSA.sql
/
spool off;

-- 10 - POPULA - TB_OCUPACAO
SELECT 'INSERT INTO TB_OCUPACAO (CD_OCUPACAO,DS_OCUPACAO) VALUES ('||CD_OCUPACAO||','''||DS_OCUPACAO||''');'
FROM WISGCICATU_PRD.TB_OCUPACAO
.
spool Insert_TB_OCUPACAO.sql
/
spool off;

-- 11 - POPULA - TB_ORGAO_EMISSOR
SELECT 'INSERT INTO TB_ORGAO_EMISSOR (ID,SL_ORGAO,NM_ORGAO) VALUES ('||ID||','''||SL_ORGAO||''','''||NM_ORGAO||''');'
FROM WISGCICATU_PRD.TB_ORGAO_EMISSOR
spool Insert_TB_ORGAO_EMISSOR.sql
.
/

-- 12 - POPULA - TB_PAIS
SELECT 'INSERT INTO TB_PAIS (CD_PAIS,NM_PAIS,SG_PAIS) VALUES ('||CD_PAIS||','''||NM_PAIS||''','''||SG_PAIS||''');'
FROM WISGCICATU_PRD.TB_PAIS
.
spool Insert_TB_PAIS.sql
/
spool off;

-- 13 - POPULA - TB_PERFIL
SELECT 'INSERT INTO TB_PERFIL (ID,NM_PERFIL) VALUES ('||ID||','''||NM_PERFIL||''');'
FROM WISGCICATU_PRD.TB_PERFIL
.
spool Insert_TB_PERFIL.sql
/
spool off;

-- 14  - POPULA - TB_RAMO
SELECT 'INSERT INTO TB_RAMO (ID,CD_RAMO,NM_RAMO) VALUES ('||ID||','||CD_RAMO||','''||NM_RAMO||''');'
FROM WISGCICATU_PRD.TB_RAMO
.
spool Insert_TB_RAMO.sql
/
spool off;

-- 15 - POPULA - TB_REGIME_TRIBUTARIO
SELECT 'INSERT INTO TB_REGIME_TRIBUTARIO (ID,DS_REGIME_TRIBUTARIO) VALUES ('||ID||','''||DS_REGIME_TRIBUTARIO||''');'
FROM WISGCICATU_PRD.TB_REGIME_TRIBUTARIO
.
spool Insert_TB_REGIME_TRIBUTARIO.sql
/
spool off;

-- 16 - POPULA - TB_SEXO
SELECT 'INSERT INTO TB_SEXO (ID,DS_SEXO) VALUES ('||ID||','''||DS_SEXO||''');'
FROM WISGCICATU_PRD.TB_SEXO
.
spool Insert_TB_SEXO.sql
/
spool off;

-- 17 - POPULA - TB_SITUACAO
SELECT 'INSERT INTO TB_SITUACAO (ID,DS_SITUACAO) VALUES ('||ID||','''||DS_SITUACAO||''');'
FROM WISGCICATU_PRD.TB_SITUACAO
.
spool Insert_TB_SITUACAO.sql
/
spool off;

-- 18 - POPULA - TB_SITUACAO_SEGURADORA
SELECT 'INSERT INTO TB_SITUACAO_SEGURADORA (ID,DS_SITUACAO,PID_TIPO_DOCUMENTO) VALUES ('||ID||','''||DS_SITUACAO||''','||PID_TIPO_DOCUMENTO||');'
FROM WISGCICATU_PRD.TB_SITUACAO_SEGURADORA
.
spool Insert_TB_SITUACAO_SEGURADORA.sql
/
spool off;

-- 19 - POPULA - TB_TIPO_DOCUMENTO
SELECT 'INSERT INTO TB_TIPO_DOCUMENTO (ID,NM_TIPO_DOCUMENTO) VALUES ('||ID||','''||NM_TIPO_DOCUMENTO||''');'
FROM WISGCICATU_PRD.TB_TIPO_DOCUMENTO
.
spool Insert_TB_TIPO_DOCUMENTO.sql
/
spool off;

-- 20 - POPULA - TB_TIPO_EMPRESA
SELECT 'INSERT INTO TB_TIPO_EMPRESA (ID,DS_TIPO_EMPRESA) VALUES ('||ID||','''||DS_TIPO_EMPRESA||''');'
FROM WISGCICATU_PRD.TB_TIPO_EMPRESA
.
spool Insert_TB_TIPO_EMPRESA.sql
/
spool off;

-- 21 - POPULA - TB_TIPO_ENDERECO
SELECT 'INSERT INTO TB_TIPO_ENDERECO (ID,NM_TIPO_ENDERECO,DS_TIPO_ENDERECO) VALUES ('||ID||','''||NM_TIPO_ENDERECO||''','''||DS_TIPO_ENDERECO||''');'
FROM WISGCICATU_PRD.TB_TIPO_ENDERECO
.
spool Insert_TB_TIPO_ENDERECO.sql
/
spool off;

-- 22 - POPULA - TB_TIPO_ENTIDADE
SELECT 'INSERT INTO TB_TIPO_ENTIDADE (CD_TIPO_ENTIDADE,DS_TIPO_ENTIDADE) VALUES ('||CD_TIPO_ENTIDADE||','''||DS_TIPO_ENTIDADE||''');'
FROM WISGCICATU_PRD.TB_TIPO_ENTIDADE
.
spool Insert_TB_TIPO_ENTIDADE.sql
/
spool off;

-- 24 - POPULA - TB_TIPO_MEIO_COMUNICACAO
SELECT 'INSERT INTO TB_TIPO_MEIO_COMUNICACAO (ID,NM_MEIO_COMUNICACAO) VALUES ('||ID||','''||NM_MEIO_COMUNICACAO||''');'
FROM WISGCICATU_PRD.TB_TIPO_MEIO_COMUNICACAO
.
spool Insert_TB_TIPO_MEIO_COMUNICACAO.sql
/
spool off;

-- 25 - POPULA - TB_TIPO_PARAMETRO
SELECT 'INSERT INTO TB_TIPO_PARAMETRO (ID,DS_TIPO_PARAMETRO) VALUES ('||ID||','''||DS_TIPO_PARAMETRO||''');'
FROM WISGCICATU_PRD.TB_TIPO_PARAMETRO
.
spool Insert_TB_TIPO_PARAMETRO.sql
/
spool off;

-- 26 - POPULA - TB_TIPO_PORTABILIDADE
SELECT 'INSERT INTO TB_TIPO_PORTABILIDADE (ID,DS_TIPO_VALOR_PORTABILIDADE) VALUES ('||ID||','''||DS_TIPO_VALOR_PORTABILIDADE||''');'
FROM WISGCICATU_PRD.TB_TIPO_PORTABILIDADE
.
spool Insert_TB_TIPO_PORTABILIDADE.sql
/
spool off;

-- 27 - POPULA - TB_TIPO_PRODUTO
SELECT 'INSERT INTO TB_TIPO_PRODUTO (CD_TIPO_PRODUTO,DS_TIPO_PRODUTO) VALUES ('||CD_TIPO_PRODUTO||','''||DS_TIPO_PRODUTO||''');'
FROM WISGCICATU_PRD.TB_TIPO_PRODUTO
.
spool Insert_TB_TIPO_PRODUTO.sql
/
spool off;

-- 29 - POPULA - TB_TITULARIDADE
SELECT 'INSERT INTO TB_TITULARIDADE (CD_TITULARIDADE,DS_TITULARIDADE) VALUES ('||CD_TITULARIDADE||','''||DS_TITULARIDADE||''');'
FROM WISGCICATU_PRD.TB_TITULARIDADE
.
spool Insert_TB_TITULARIDADE.sql
/
spool off;

-- 30 - POPULA - TB_UF
SELECT 'INSERT INTO TB_UF (ID,DS_UF,NM_UF) VALUES ('||ID||','''||DS_UF||''','''||NM_UF||''');'
FROM WISGCICATU_PRD.TB_UF
.
spool Insert_TB_UF.sql
/
spool off;

-- 31 - POPULA - TB_VISAO
SELECT 'INSERT INTO TB_VISAO (ID,NM_VISAO) VALUES ('||ID||','''||NM_VISAO||''');'
FROM WISGCICATU_PRD.TB_VISAO
.
spool Insert_TB_VISAO.sql
/
spool off;

-- 32 - POPULA - TB_PRODUTO
set long 32767
SELECT 'INSERT INTO TB_PRODUTO (ID,PID_RAMO,NM_PRODUTO,PID_TIPO_PRODUTO,CD_PRODUTO_SEG,ATIVO,DSC_PRODUTO) VALUES ('||ID||','||PID_RAMO||','''||NM_PRODUTO||''','||PID_TIPO_PRODUTO||','||CD_PRODUTO_SEG||','''||ATIVO||''','''||dbms_lob.substr(DSC_PRODUTO,4000,1)||''');'
FROM WISGCICATU_PRD.TB_PRODUTO
.
spool Insert_TB_PRODUTO.sql
/
spool off;
set long 100

-- 33 - POPULA - TB_DOCUMENTO_CIVIL
SELECT 'INSERT INTO TB_DOCUMENTO_CIVIL (CD_DOCUMENTO,DS_DOCUMENTO,FL_ATIVO) VALUES ('||CD_DOCUMENTO||','''||DS_DOCUMENTO||''','''||FL_ATIVO||''');'
FROM WISGCICATU_PRD.TB_DOCUMENTO_CIVIL
.
spool Insert_TB_DOCUMENTO_CIVIL.sql
/
spool off;

-- 34 - POPULA - TB_PARAMETRIZACAO
SELECT 'INSERT INTO TB_PARAMETRIZACAO (ID,DURACAO_HRS,DT_INCLUSAO,CD_RESP_INCLUSAO,CD_RESP_ATUAL,DT_RESP_ATUAL,TP_PARAMETRO) VALUES ('||ID||','||DURACAO_HRS||','''||DT_INCLUSAO||''','''||CD_RESP_INCLUSAO||''','''||CD_RESP_ATUAL||''','''||DT_RESP_ATUAL||''','||TP_PARAMETRO||');' 
FROM WISGCICATU_PRD.TB_PARAMETRIZACAO
.
spool Insert_TB_PARAMETRIZACAO.sql
/
spool off;

-- 35 - POPULA - TB_PARAMETRO_BATCH
SELECT 'INSERT INTO TB_PARAMETRO_BATCH (ID,PID_SEGURADORA,TP_ARQUIVO,DS_FTP_DIRETORIO,DS_FTP_DIR_BACKUP,DS_ARQUIVO_NOME,DS_ARQUIVO_EXTENSAO,DS_LOCAL_DIRETORIO,PID_PARAMETRO_FTP) VALUES ('||ID||','||PID_SEGURADORA||','||TP_ARQUIVO||','''||DS_FTP_DIRETORIO||''','''||DS_FTP_DIR_BACKUP||''','''||DS_ARQUIVO_NOME||''','''||DS_ARQUIVO_EXTENSAO||''','''||DS_LOCAL_DIRETORIO||''','||PID_PARAMETRO_FTP||');'
FROM WISGCICATU_PRD.TB_PARAMETRO_BATCH
.
spool Insert_TB_PARAMETRO_BATCH.sql
/
spool off;

-- 36 - POPULA - TB_PARAMETRO_FTP
SELECT 'INSERT INTO TB_PARAMETRO_FTP (ID,PID_SEGURADORA,NM_USUARIO,DS_SENHA,NM_HOST,NU_PORTA,TP_CONEXAO) VALUES ('||ID||','||PID_SEGURADORA||','''||NM_USUARIO||''','''||DS_SENHA||''','''||NM_HOST||''','||NU_PORTA||','||TP_CONEXAO||');'
FROM WISGCICATU_PRD.TB_PARAMETRO_FTP
.
spool Insert_TB_PARAMETRO_FTP.sql
/
spool off;

-- 37 - POPULA - TB_SEGURADORA
SELECT 'INSERT INTO TB_SEGURADORA (ID,NM_SEGURADORA,NUM_CNPJ,CD_FIP,FL_ATIVO) VALUES ('||ID||','''||NM_SEGURADORA||''','''||NUM_CNPJ||''','||CD_FIP||','''||FL_ATIVO||''');'
FROM WISGCICATU_PRD.TB_SEGURADORA
.
spool Insert_TB_SEGURADORA.sql
/
spool off;

-- 38 - POPULA - TB_ARQ_STATUS_CARGA
SELECT
'INSERT INTO TB_ARQ_STATUS_CARGA (ID,DS_STATUS,DT_CARGA,NM_ARQUIVO,TP_ARQUIVO,VL_LINHA_INICIAL,PID_EMPRESA,PID_USUARIO,PID_SEGURADORA,DT_ARQUIVO,DS_POSICAO_DIARIA,DS_INFORMATIVO,CD_PARCERIA,CD_BANCO,DS_SEQUENCIAL) VALUES ('||ID||','''||DS_STATUS||''','''||DT_CARGA||''','''||NM_ARQUIVO||''','||TP_ARQUIVO||','||DECODE(NVL(VL_LINHA_INICIAL,0),0,'NULL',VL_LINHA_INICIAL)||','||DECODE(NVL(PID_EMPRESA,0),0,'NULL',PID_EMPRESA)||','||DECODE(NVL(PID_USUARIO,0),0,'NULL',PID_USUARIO)||','||DECODE(NVL(PID_SEGURADORA,0),0,'NULL',PID_SEGURADORA)||','''||DT_ARQUIVO||''','''||DS_POSICAO_DIARIA||''','''||DS_INFORMATIVO||''','''||CD_PARCERIA||''','''||CD_BANCO||''','''||DS_SEQUENCIAL||''');'
FROM WISGCICATU_PRD.TB_ARQ_STATUS_CARGA
.
spool Insert_TB_ARQ_STATUS_CARGA.sql
/
spool off;

-- 39 - POPULA - TB_ARQ_STATUS_CARGA_LOG 
SELECT 'INSERT INTO TB_ARQ_STATUS_CARGA_LOG (ID,PID_STATUS_CARGA,NU_LINHA,NM_COLUNA,DS_ERRO,NR_DOCUMENTO) VALUES ('||ID||','||PID_STATUS_CARGA||','||NU_LINHA||','''||NM_COLUNA||''','''||DS_ERRO||''','''||NR_DOCUMENTO||''');'
FROM WISGCICATU_PRD.TB_ARQ_STATUS_CARGA_LOG
.
spool Insert_TB_ARQ_STATUS_CARGA_LOG.sql
/
spool off;

-- 40 - POPULA - TB_ARQUIVO_CADA
SELECT 
'INSERT INTO TB_ARQUIVO_CADA (ID,PID_ARQ_STATUS,TP_ARQUIVO,NU_PROPOSTA,NU_MATRICULA,NM_TITULAR,DS_LOGRADOURO,DS_BAIRRO,DS_CIDADE,DS_CEP,DS_UF,NU_TELEFONE1,NU_TELEFONE2,NM_FUNDO,CD_FUNDO,CT_FUNDO,DT_SALDO,QT_COTAS,VL_SALDO,DT_LIBERACAO_PORTABILIDADE,DT_LIGERACAO_RESGATE,DS_SITUACAO,NU_LINHA,NU_PROC_SUSEP,NU_CPF,TP_PARTICIPANTE,NU_IDENTIDADE,DS_NATUREZA_DOC,DS_ORGAO_EMISSOR,DT_EXPEDICAO,TP_REGIME_IR,DS_REGIME_IR,DS_BANCO_PATROCINIO,DS_AGENCIA_PATROCINIO,DS_CONTA_PATROCINIO,NU_CNPJ_PATROCINIO,DS_BANCO_PARTICIPANTE,DS_AGENCIA_PARTICIPANTE,DS_CONTA_PARTICIPANTE,VL_IOF,VL_IR,VL_SALDO_LIQUIDO,DT_NASCIMENTO,NU_CERTIFICADO,NM_PLANO,NU_CONTRATO) 
VALUES 
('||ID||','||PID_ARQ_STATUS||','''||TP_ARQUIVO||''','||NU_PROPOSTA||','||NU_MATRICULA||','''||NM_TITULAR||''','''||DS_LOGRADOURO||''','''||DS_BAIRRO||''','''||DS_CIDADE||''','''||DS_CEP||''','''||DS_UF||''','||NU_TELEFONE1||','||NU_TELEFONE2||','''||NM_FUNDO||''','''||CD_FUNDO||''','''||CT_FUNDO||''','''||DT_SALDO||''','||QT_COTAS||','||VL_SALDO||','''||DT_LIBERACAO_PORTABILIDADE||''','''||DT_LIGERACAO_RESGATE||''','''||DS_SITUACAO||''','||NU_LINHA||','''||NU_PROC_SUSEP||''','''||NU_CPF||''','''||TP_PARTICIPANTE||''','''||NU_IDENTIDADE||''','''||DS_NATUREZA_DOC||''','''||DS_ORGAO_EMISSOR||''','''||DT_EXPEDICAO||''','''||TP_REGIME_IR||''','''||DS_REGIME_IR||''','''||DS_BANCO_PATROCINIO||''','''||DS_AGENCIA_PATROCINIO||''','''||DS_CONTA_PATROCINIO||''','''||NU_CNPJ_PATROCINIO||''','''||DS_BANCO_PARTICIPANTE||''','''||DS_AGENCIA_PARTICIPANTE||''','''||DS_CONTA_PARTICIPANTE||''','''||VL_IOF||''','''||VL_IR||''','''||VL_SALDO_LIQUIDO||''','''||DT_NASCIMENTO||''','''||NU_CERTIFICADO||''','''||NM_PLANO||''','''||NU_CONTRATO||''');'
FROM WISGCICATU_PRD.TB_ARQUIVO_CADA
.
spool Insert_TB_ARQUIVO_CADA.sql
/
spool off;

-- 41 - POPULA - TB_ARQUIVO_COTA
SELECT 'INSERT INTO TB_ARQUIVO_COTA (ID,PID_ARQ_STATUS,TP_REGISTRO,DT_INDICE,CD_FUNDO,VL_COTA,VL_SALDO) VALUES ('||ID||','||PID_ARQ_STATUS||','''||TP_REGISTRO||''','''||DT_INDICE||''','''||CD_FUNDO||''','||VL_COTA||','||VL_SALDO||');'
FROM WISGCICATU_PRD.TB_ARQUIVO_COTA
.
spool Insert_TB_ARQUIVO_COTA.sql
/
spool off;

-- 42 - POPULA - TB_ARQUIVO_MOVI
SELECT 'INSERT INTO TB_ARQUIVO_MOVI (ID,PID_ARQ_STATUS,TP_REGISTRO,DS_HISTORICO,NU_PROPOSTA,NU_MATRICULA,NU_CERTIFICADO,NM_FUNDO,CD_FUNDO,CT_FUNDO,DT_MOVIMENTO,QT_COTAS,VL_MOVIMENTO,DT_COTA,VL_COTA,VL_DA,VL_IR,NU_DOCUMENTO,DT_PAGAMENTO,NU_PARCELA,VALOR_TAXA_SAIDA,DS_OPERACAO_REALIZADA,CD_ANGARIADOR,DS_AGENCIA,VL_IDENTIFICACAO_CLIENTE,NM_PRODUTO,CD_PLANO_PARCEIRO,NU_PROTOCOLO,VL_NOMINAL,DS_CGC_CPF_CLIENTE,CD_MOVIMENTO_ICATU,DT_SOLICITACAO,NU_PROC_SUSEP,DS_SINAL_MOVIMENTACAO,NU_CONTRATO)
 VALUES 
 ('||ID||','||PID_ARQ_STATUS||','||TP_REGISTRO||','''||DS_HISTORICO||''','||NU_PROPOSTA||','||NU_MATRICULA||','||NU_CERTIFICADO||','''||NM_FUNDO||''','''||CD_FUNDO||''','''||CT_FUNDO||''','''||DT_MOVIMENTO||''','||QT_COTAS||','||VL_MOVIMENTO||','''||DT_COTA||''','||VL_COTA||','||VL_DA||','||VL_IR||','||NU_DOCUMENTO||','''||DT_PAGAMENTO||''','||NU_PARCELA||','||VALOR_TAXA_SAIDA||','''||DS_OPERACAO_REALIZADA||''','''||CD_ANGARIADOR||''','''||DS_AGENCIA||''','''||VL_IDENTIFICACAO_CLIENTE||''','''||NM_PRODUTO||''','''||CD_PLANO_PARCEIRO||''','||NU_PROTOCOLO||','||VL_NOMINAL||','''||DS_CGC_CPF_CLIENTE||''','''||CD_MOVIMENTO_ICATU||''','''||DT_SOLICITACAO||''','''||NU_PROC_SUSEP||''','''||DS_SINAL_MOVIMENTACAO||''','''||NU_CONTRATO||''');'
FROM WISGCICATU_PRD.TB_ARQUIVO_MOVI
.
spool Insert_TB_ARQUIVO_MOVI.sql
/
spool off;

-- 43 - POPULA - TB_ARQUIVO_PAGAMENTO
SELECT 'INSERT INTO TB_ARQUIVO_PAGAMENTO (ID,PID_ARQ_STATUS,NU_LINHA,NU_CERTIFICADO,DT_CONTRIBUICAO,DT_COMPETENCIA,VL_PARCELA,NU_PARCELA,DS_FORMA_CONTRIBUICAO,DS_STATUS,DT_VENCIMENTO,TP_COBRANCA,DS_RETORNO_BANCARIO,DS_MOTIVO,NM_CLIENTE,NU_CPF_CNPJ,NM_FUNDO,VL_RESERVA,DS_CANAL_AFINIDADE,NM_PLANO,DS_PARCERIA,CD_BANCO,NU_AGENCIA,NU_CONTA_CORRENTE,NU_DIA_VENCIMENTO,DS_HAVERA_REPIQUE,NM_BANCO)
 VALUES 
 ('||ID||','||PID_ARQ_STATUS||','||NU_LINHA||','''||NU_CERTIFICADO||''','''||DT_CONTRIBUICAO||''','''||DT_COMPETENCIA||''','||VL_PARCELA||','||NU_PARCELA||','''||DS_FORMA_CONTRIBUICAO||''','''||DS_STATUS||''','''||DT_VENCIMENTO||''','''||TP_COBRANCA||''','''||DS_RETORNO_BANCARIO||''','''||DS_MOTIVO||''','''||NM_CLIENTE||''','''||NU_CPF_CNPJ||''','''||NM_FUNDO||''','||VL_RESERVA||','''||DS_CANAL_AFINIDADE||''','''||NM_PLANO||''','''||DS_PARCERIA||''','''||CD_BANCO||''','''||NU_AGENCIA||''','''||NU_CONTA_CORRENTE||''','''||NU_DIA_VENCIMENTO||''','''||DS_HAVERA_REPIQUE||''','''||NM_BANCO||''');'
FROM WISGCICATU_PRD.TB_ARQUIVO_PAGAMENTO
.
spool Insert_TB_ARQUIVO_PAGAMENTO.sql
/
spool off;

-- 44 - POPULA - TB_ARQUIVO_PLAN
SELECT 'INSERT INTO TB_ARQUIVO_PLAN (ID,PID_ARQ_STATUS,TP_REGISTRO,NM_FUNDO,CD_FUNDO,VL_DA,NUM_PROC_SUSEP) VALUES ('||ID||','||PID_ARQ_STATUS||','''||TP_REGISTRO||''','''||NM_FUNDO||''','''||CD_FUNDO||''','||VL_DA||','''||NUM_PROC_SUSEP||''');'
FROM WISGCICATU_PRD.TB_ARQUIVO_PLAN
.
spool Insert_TB_ARQUIVO_PLAN.sql
/
spool off;

-- 44 - POPULA - TB_ARQUIVO_PORTABILIDADE
SELECT 'INSERT INTO TB_ARQUIVO_PORTABILIDADE (ID,PID_ARQ_STATUS,NM_CLIENTE,DS_CPF,DS_STATUS,VL_VALOR,NM_CEDENTE,DS_CERTIFICADO_ORIGEM,DS_CERTIFICADO_DESTINO,DS_OBSERVACAO,DS_MOTIVO_RECUSA,NU_LINHA,DT_ENVIO_SID,DT_CONCLUSAO,CD_PORTABILIDADE,TP_PLANO,PID_MOTIVO_RECUSA) 
VALUES 
('||ID||','||PID_ARQ_STATUS||','''||NM_CLIENTE||''','''||DS_CPF||''','''||DS_STATUS||''','||VL_VALOR||','''||NM_CEDENTE||''','''||DS_CERTIFICADO_ORIGEM||''','''||DS_CERTIFICADO_DESTINO||''','''||DS_OBSERVACAO||''','''||DS_MOTIVO_RECUSA||''','||NU_LINHA||','''||DT_ENVIO_SID||''','''||DT_CONCLUSAO||''','''||CD_PORTABILIDADE||''','''||TP_PLANO||''','||PID_MOTIVO_RECUSA||');'
FROM WISGCICATU_PRD.TB_ARQUIVO_PORTABILIDADE
.
spool Insert_TB_ARQUIVO_PORTABILIDADE.sql
/
spool off;

