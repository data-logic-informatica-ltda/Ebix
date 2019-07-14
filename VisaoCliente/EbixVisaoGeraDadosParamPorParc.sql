set lines 900
set pages 0
set head off

-- =======================================================================
--
-- =======================================================================
-- Script de Geracao das Cargas de Tabelas Por Parceria
-- Autor: Alexandre e Rogerio
-- Favor informar antes de executar o script o schema que será usado para consultar as tabelas de dominio 

-- 01 - POPULA - TB_EMPRESA e TB_EMPRESA_PARAMETRO
SELECT '  INSERT INTO DB_EXCHANGE_VISAO_TST.TB_EMPRESA  ( ID ,    NM_EMPRESA,    DS_EMAIL,    FL_LICENSA_ATIVA,    NU_SUSEP,    DS_CAMINHO_LOGOTIPO,    NU_MUMPS,    NUM_CNPJ,    DG,    CD_PARCERIA,    NM_EMPRESA_FANTASIA,    NUM_TELEFONE,    NM_APELIDO,    SENHA,    LOGIN,    CD_XPORT,    NUM_FUNCAO,    USAR_SERVICO_ATIVO,    PID_EMPRESA_SECUNDARIA,
    PID_EMPRESA_SUPERIOR,    PID_TIPO_EMPRESA,    PID_USUARIO_B2C  )  VALUES(
'||E.ID||' ,
'||DECODE(E.NM_EMPRESA, NULL, 'NULL', ''''||E.NM_EMPRESA||'''')     ||',
'||DECODE(E.DS_EMAIL, NULL, 'NULL', ''''||E.DS_EMAIL||'''')     ||'  ,
'||DECODE(E.FL_LICENSA_ATIVA, NULL, 'NULL', ''''||E.FL_LICENSA_ATIVA||'''') ||',
'||DECODE(E.NU_SUSEP, NULL, 'NULL', ''''||E.NU_SUSEP||'''')      ||'  ,
'||DECODE(E.DS_CAMINHO_LOGOTIPO, NULL, 'NULL', ''''|| E.DS_CAMINHO_LOGOTIPO||'''')||' ,
'||DECODE(E.NU_MUMPS, NULL, 'NULL', ''''|| E.NU_MUMPS ||'''')||' ,
'||DECODE(E.NUM_CNPJ, NULL, 'NULL', ''''|| E.NUM_CNPJ ||'''')||' ,
'||DECODE(E.DG, NULL,  'NULL', ''''|| E.DG ||'''')||' ,
'||DECODE(E.CD_PARCERIA, NULL, 'NULL', ''''||E.CD_PARCERIA ||'''')||' ,
'||DECODE(E.NM_EMPRESA_FANTASIA, NULL, 'NULL', ''''||E.NM_EMPRESA_FANTASIA||'''')||' ,
'||DECODE(E.NUM_TELEFONE, NULL, 'NULL', ''''||E.NUM_TELEFONE||'''')||' ,
'||DECODE(E.NM_APELIDO, NULL, 'NULL', ''''||E.NM_APELIDO||'''')||' ,
'||DECODE(E.SENHA, NULL, 'NULL', ''''||E.SENHA||'''')||' ,
'||DECODE(E.LOGIN, NULL, 'NULL', ''''||E.LOGIN||'''')||' ,
'||DECODE(E.CD_XPORT, NULL, 'NULL', E.CD_XPORT)||' ,
'||DECODE(E.NUM_FUNCAO, NULL, 'NULL', ''''||E.NUM_FUNCAO||'''')||' ,
'||DECODE(E.USAR_SERVICO_ATIVO, NULL, 'NULL', ''''||E.USAR_SERVICO_ATIVO||'''')||' ,
'||DECODE(E.PID_EMPRESA_SECUNDARIA, NULL, 'NULL', E.PID_EMPRESA_SECUNDARIA)||' ,
'||DECODE(E.PID_EMPRESA_SUPERIOR, NULL, 'NULL', E.PID_EMPRESA_SUPERIOR)||' ,
'||DECODE(E.PID_TIPO_EMPRESA, NULL, 'NULL',  E.PID_TIPO_EMPRESA)||' ,
'||DECODE(E.NM_APELIDO, NULL, 'NULL', DECODE((SELECT U.ID FROM WISGCICATU_PRD.TB_USUARIO U WHERE U.LOGIN_USUARIO=E.NM_APELIDO AND ROWNUM=1), NULL, 'NULL',(SELECT U.ID FROM WISGCICATU_PRD.TB_USUARIO U WHERE U.LOGIN_USUARIO=E.NM_APELIDO AND ROWNUM=1)))    ||' ); ' ,
' INSERT INTO TB_EMPRESA_PARAMETRO  (    ID,    PID_EMPRESA,    FL_HABILITA_PORTABILIDADE,    FL_HABILITA_BENEFICIARIO,    FL_HABILITA_RESP_FINANCEIRO,    DS_DISCLAIMER_BANCO,    DS_DISCLAIMER_PORT,    NU_IDADE_MAX_APOSENT,    FL_HABILITA_PGBL,    FL_HABILITA_VGBL,    FL_HABILITA_REGRESSIVA,    FL_HABILITA_PROGRESSIVA ) VALUES    ( 
  '||E.ID||',
    '||E.ID||',
    ''S'',
    ''S'',
    ''S'',
    NULL,
    NULL,
    99,
    ''S'',
    ''S'',
    ''S'',
    ''S'' );'
FROM  WISGCICATU_PRD.TB_EMPRESA E
WHERE E.ID =4
ORDER BY E.ID
.
spool Insert_TB_EMPRESA_TB_EMPRESA_PARAMETRO.sql
/
spool off;

-- 02 - POPULA - TB_FORMA_PAGTO_EMPRESA
SELECT 'INSERT INTO TB_FORMA_PAGTO_EMPRESA (    ID,    PID_FORMA_PAGAMENTO,    PID_EMPRESA) VALUES (
    '||FPE.ID||',
    '||FPE.PID_FORMA_PAGAMENTO||',
    '||FPE.PID_EMPRESA||');'
FROM WISGCICATU_PRD.TB_FORMA_PAGTO_EMPRESA FPE
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=FPE.PID_EMPRESA
WHERE E.ID =4
.
spool Insert_TB_FORMA_PAGTO_EMPRESA.sql
/
spool off;

-- 03 - POPULA - TB_PRODUTO_EMPRESA
SELECT 'INSERT INTO TB_PRODUTO_EMPRESA (    ID,    PID_PRODUTO,    PID_EMPRESA) VALUES (
     '||PE.ID||',
     '||PE.PID_PRODUTO||',
     '||PE.PID_EMPRESA||'
);' FROM WISGCICATU_PRD.TB_EMPRESA E 
JOIN WISGCICATU_PRD.TB_PRODUTO_EMPRESA PE ON PE.PID_EMPRESA=E.ID
WHERE E.ID =4
.
spool Insert_TB_PRODUTO_EMPRESA.sql
/
spool off

-- 04 - POPULA - TB_GRUPO
SELECT 'INSERT INTO  TB_GRUPO (    ID,    NM_GRUPO,    PID_EMPRESA,    FL_ATIVO,    DT_CADASTRO) VALUES (    
    '||G.ID||',
    '''||G.NM_GRUPO||''',
    '||G.PID_EMPRESA||', 
    '||DECODE(G.FL_ATIVO, NULL, 'N', ''''|| case when ( G.FL_ATIVO = '0') then 'N' else 'S' end ||'''')||' ,
    '''||G.DT_CADASTRO||'''  
);'
FROM WISGCICATU_PRD.TB_GRUPO G
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=G.PID_EMPRESA
WHERE E.ID =4
.
spool Insert_TB_GRUPO.sql
/
spool off;

-- 05 - POPULA - TB_GRUPO_FUNCIONALIDADE
SELECT 'INSERT INTO  TB_GRUPO_FUNCIONALIDADE (    ID,    PID_GRUPO,    PID_FUNCIONALIDADE) VALUES (
        '||GF.ID||',
        '||GF.PID_GRUPO||',
        '||GF.PID_FUNCIONALIDADE||' 
);'
FROM WISGCICATU_PRD.TB_GRUPO_FUNCIONALIDADE GF
JOIN WISGCICATU_PRD.TB_GRUPO G ON G.ID=GF.PID_GRUPO
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=G.PID_EMPRESA
WHERE E.ID=4 
.
spool Insert_TB_GRUPO_FUNCIONALIDADE.sql
/
spool off;

-- 06 - POPULA - TB_CANAL_VENDA
SELECT 'INSERT INTO TB_CANAL_VENDA (    ID,    PID_EMPRESA,    NM_CANAL_VENDA,    FL_ATIVO,    DT_CADASTRO) VALUES (
'||CV.ID||',
'||CV.PID_EMPRESA||', 
'||DECODE(CV.NM_CANAL_VENDA, NULL, 'NULL', ''''||CV.NM_CANAL_VENDA||'''')||',
'||DECODE(CV.FL_ATIVO, NULL, 'N', ''''|| case when ( CV.FL_ATIVO = '0') then 'N' else 'S' end ||'''')||' ,
'||DECODE(CV.DT_CADASTRO, NULL, 'NULL', ''''||CV.DT_CADASTRO||'''')||'
);'
FROM WISGCICATU_PRD.TB_CANAL_VENDA CV
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=CV.PID_EMPRESA
WHERE E.ID=4
.
spool Insert_TB_CANAL_VENDA.sql
/
spool off;

-- 07 - POPULA - TB_ESTRUTURA_VENDA
SELECT 'INSERT INTO TB_ESTRUTURA_VENDA (
    ID,
    NM_ESTRUTURA_VENDA,
    NUM_CNPJ_CPF,
    PID_UF,
    PID_EMPRESA,
    DT_CADASTRO,
    FL_ATIVO,
    PID_ESTRUTURA_VENDA_SUPERIOR,
    FL_PONTO_VENDA
) VALUES (
    '||EV.ID||',
    '||DECODE(EV.NM_ESTRUTURA_VENDA, NULL, 'NULL', ''''||EV.NM_ESTRUTURA_VENDA||'''')||', 
    '||DECODE(EV.NUM_CNPJ_CPF, NULL, 'NULL', ''''||EV.NUM_CNPJ_CPF||'''')||',  
    '||DECODE(EV.PID_UF, NULL, 'NULL', EV.PID_UF)||',     
    '||DECODE(EV.PID_EMPRESA, NULL, 'NULL', EV.PID_EMPRESA)||'  ,
    '||DECODE(EV.DT_CADASTRO, NULL, 'NULL', ''''||EV.DT_CADASTRO||'''')||' , 
    '||DECODE(EV.FL_ATIVO, NULL, 'N', ''''|| case when ( EV.FL_ATIVO = '0') then 'N' else 'S' end ||'''')||' ,
    '||DECODE(EV.PID_ESTRUTURA_VENDA_SUPERIOR, NULL, 'NULL', EV.PID_ESTRUTURA_VENDA_SUPERIOR)||'  ,
     '||DECODE(EV.FL_PONTO_VENDA, NULL, 'N', ''''|| case when ( EV.FL_PONTO_VENDA= '0') then 'N' else 'S' end||'''')||' );' 
FROM WISGCICATU_PRD.TB_ESTRUTURA_VENDA EV
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=EV.PID_EMPRESA
WHERE E.ID=4
.
spool Insert_TB_ESTRUTURA_VENDA.sql
/
spool off;

-- 08 - POPULA - TB_USUARIO
set long 32767 
SELECT ' INSERT INTO tb_usuario (    ID,    pid_empresa,    login_usuario,    ds_senha,    fl_primeiro_acesso,    nu_erros_acesso,    fl_bloqueado,    fl_ativo,    ds_email,    pid_perfil,    nu_cpf_cnpj,    dt_cadastro,    nm_usuario,    pid_estrutura_venda,    pid_grupo,    pid_visao,    fl_visao_logada) 
 VALUES (    
    '||U.ID||',
    '||DECODE(U.PID_EMPRESA, NULL, 'NULL', U.PID_EMPRESA)||'  ,   
     '||DECODE(U.LOGIN_USUARIO, NULL, 'NULL', ''''||U.LOGIN_USUARIO||'''')||'  ,
    '||DECODE(U.DS_SENHA, NULL, 'NULL', ''''||U.DS_SENHA||'''')||'  ,
    '||DECODE(U.FL_PRIMEIRO_ACESSO, NULL, 'NULL', ''''||U.FL_PRIMEIRO_ACESSO||'''')||'  ,
    '||DECODE(U.NU_ERROS_ACESSO, NULL, 'NULL', U.NU_ERROS_ACESSO)||'  ,   
    '||DECODE(U.FL_BLOQUEADO, NULL, 'NULL', ''''||U.FL_BLOQUEADO||'''')||' ,
    '||DECODE(U.FL_ATIVO, NULL, 'NULL', ''''||U.FL_ATIVO||'''')||'  ,
    '||DECODE(U.DS_EMAIL, NULL, 'NULL', ''''||U.DS_EMAIL||'''')||'  ,
    1  ,
    '||DECODE(U.NU_CPF_CNPJ, NULL, 'NULL', ''''||U.NU_CPF_CNPJ||'''')||'  ,
    '||DECODE(U.DT_CADASTRO, NULL, 'NULL', ''''||U.DT_CADASTRO||'''')||'   ,
    '||DECODE(U.LOGIN_USUARIO, NULL, 'NULL', ''''||U.LOGIN_USUARIO||'''')||'  ,
    '||DECODE(UP.PID_ESTRUTURA_VENDA, NULL, 'NULL', UP.PID_ESTRUTURA_VENDA)||'  ,    
    '||DECODE(G.ID, NULL, 'NULL', G.ID)||'  ,     
    '||DECODE(UV.PID_VISAO, NULL, 'NULL', UV.PID_VISAO)||'  ,     
    ''S'' );'     
FROM  WISGCICATU_PRD.TB_USUARIO U
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=U.PID_EMPRESA  
left JOIN WISGCICATU_PRD.TB_USUARIO_PARAMETRIZACAO UP ON UP.PID_USUARIO=U.ID  
left JOIN WISGCICATU_PRD.TB_ESTRUTURA_VENDA EV ON EV.PID_EMPRESA=U.PID_EMPRESA and   up.pid_estrutura_venda= ev.id 
JOIN WISGCICATU_PRD.TB_CANAL_VENDA CV ON  CV.PID_EMPRESA=E.ID
JOIN WISGCICATU_PRD.TB_GRUPO G ON  G.PID_EMPRESA=E.ID
JOIN WISGCICATU_PRD.TB_USUARIO_CANAL_VENDA UCV ON UCV.PID_USUARIO=U.ID AND UCV.PID_CANAL_VENDA=CV.ID
JOIN WISGCICATU_PRD.TB_USUARIO_GRUPO UG ON UG.PID_USUARIO=U.ID AND UG.PID_GRUPO_ACESSO  = G.ID
JOIN WISGCICATU_PRD.TB_USUARIO_VISAO UV ON UV.PID_USUARIO=U.ID  
WHERE 1=1 
  AND u.pid_empresa=4
.
spool Insert_TB_USUARIO.sql
/
spool off;
set long 100

-- 09 - POPULA - TB_USUARIO_CANAL_VENDA
SELECT 'INSERT INTO  TB_USUARIO_CANAL_VENDA (
    ID,
    PID_CANAL_VENDA,
    PID_USUARIO) VALUES (
   '||UCV.ID||',
   '||DECODE(UCV.PID_CANAL_VENDA, NULL, 'NULL', UCV.PID_CANAL_VENDA)||'  , 
   '||DECODE(UCV.PID_USUARIO, NULL, 'NULL', UCV.PID_USUARIO)||'  );'     
FROM  WISGCICATU_PRD.TB_USUARIO U
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=U.PID_EMPRESA  
LEFT JOIN WISGCICATU_PRD.TB_USUARIO_PARAMETRIZACAO UP ON UP.PID_USUARIO=U.ID  
LEFT JOIN WISGCICATU_PRD.TB_ESTRUTURA_VENDA EV ON EV.PID_EMPRESA=U.PID_EMPRESA AND   UP.PID_ESTRUTURA_VENDA= EV.ID 
JOIN WISGCICATU_PRD.TB_CANAL_VENDA CV ON  CV.PID_EMPRESA=E.ID
JOIN WISGCICATU_PRD.TB_USUARIO_CANAL_VENDA UCV ON UCV.PID_USUARIO=U.ID AND UCV.PID_CANAL_VENDA=CV.ID
WHERE 1=1 
  AND E.ID=4
  order by DECODE(UCV.PID_CANAL_VENDA, NULL, 'NULL', UCV.PID_CANAL_VENDA),DECODE(UCV.PID_USUARIO, NULL, 'NULL', UCV.PID_USUARIO)
.
spool Insert_TB_USUARIO_CANAL_VENDA.sql
/
spool off;

-- 10 - POPULA - TB_ENDERECO
SELECT 'INSERT INTO tb_endereco (    id,    pid_tipo_endereco,    ds_endereco,    ds_complemento,    ds_bairro,    nu_cep,    pid_uf,    nm_cidade,    nu_endereco) VALUES (
    '||EN.ID||',
    '||DECODE(EN.pid_tipo_endereco, NULL, 'NULL', EN.pid_tipo_endereco)||'  ,     
    '||DECODE(EN.ds_endereco, NULL, 'NULL', ''''||EN.ds_endereco||'''')||'  , 
    '||DECODE(EN.ds_complemento, NULL, 'NULL', ''''||EN.ds_complemento||'''')||'  ,   
    '||DECODE(EN.ds_bairro, NULL, 'NULL', ''''||EN.ds_bairro||'''')||'  ,    
    '||DECODE(EN.nu_cep, NULL, 'NULL', ''''||EN.nu_cep||'''')||'  ,   
    '||DECODE(EN.pid_uf, NULL, 'NULL', EN.pid_uf)||'  ,    
    '||DECODE(EN.nm_cidade, NULL, 'NULL', ''''||EN.nm_cidade||'''')||'  ,   
    '||DECODE(EN.nu_endereco, NULL, 'NULL', ''''||EN.nu_endereco||'''')||'   );'
from WISGCICATU_PRD.tb_endereco en
join WISGCICATU_PRD.tb_cliente c on c.pid_endereco=en.id
join WISGCICATU_PRD.tb_documento d on d.pid_cliente=c.id
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=d.PID_EMPRESA  
where d.pid_empresa=4
.
spool Insert_TB_ENDERECO.sql
/
spool off;

-- 11 - POPULA - TB_CLIENTE
SELECT 'INSERT INTO  tb_cliente (    id,    num_doc_identificacao,    dt_nascimento,    pid_estado_civil,    num_cpf,    pid_titularidade,    pid_documento_civil,    pid_orgao_emissor,    dt_expedicao,    pid_ocupacao,    fl_ppe,    ds_origem_recurso,    vl_renda_patrimonio,    pid_pais_nacionalidade,    pid_pais_outra_nacionalidade,    fl_esteve_eua,    num_ddd_residencial,    num_telefone_residencial,    ds_email,    nm_cliente,    pid_endereco,    pid_sexo,    num_ddd_celular,    num_telefone_celular,    pid_pais_endereco_postal,    ds_empresa) 
    VALUES (    '||C.ID||',    
    '||DECODE(C.num_doc_identificacao, NULL, 'NULL', ''''||C.num_doc_identificacao||'''')||'  ,    
    '||DECODE(C.dt_nascimento, NULL, 'NULL', ''''||C.dt_nascimento||'''')||'  ,   
    '||DECODE(c.pid_estado_civil, NULL, 'NULL', c.pid_estado_civil)||'  ,     
    '||DECODE(C.num_cpf, NULL, 'NULL', ''''||C.num_cpf||'''')||'  ,       
    '||DECODE(c.pid_titularidade, NULL, 'NULL', c.pid_titularidade)||'  ,   
    '||DECODE(c.pid_documento_civil, NULL, 'NULL', c.pid_documento_civil)||'  ,   
    '||DECODE(c.pid_orgao_emissor, NULL, 'NULL', c.pid_orgao_emissor)||'  ,  
    '||DECODE(C.dt_expedicao, NULL, 'NULL', ''''||C.dt_expedicao||'''')||'  ,   
    '||DECODE(c.pid_ocupacao, NULL, 'NULL', c.pid_ocupacao)||'  ,      
    '||DECODE(C.cd_ppe, NULL, 'N', ''''|| case when ( C.cd_ppe = '0') then 'N' else 'S' end ||'''')||'  ,     
    '||DECODE(C.ds_origem_recurso, NULL, 'NULL', ''''||C.ds_origem_recurso||'''')||'  ,    
    '||DECODE(C.vl_renda_patrimonio, NULL, 'NULL', ''''||C.vl_renda_patrimonio||'''')||'  ,    
    '||DECODE(c.pid_pais_nacionalidade, NULL, 'NULL', c.pid_pais_nacionalidade)||'  ,   
    '||DECODE(c.pid_pais_outra_nacionalidade, NULL, 'NULL', c.pid_pais_outra_nacionalidade)||'   ,
    '||DECODE(C.cd_esteve_eua, NULL, 'NULL', ''''||C.cd_esteve_eua||'''')||'  ,     
    '||DECODE(C.num_ddd_residencial, NULL, 'NULL', ''''||C.num_ddd_residencial||'''')||'  ,      
    '||DECODE(C.num_telefone_residencial, NULL, 'NULL', ''''||C.num_telefone_residencial||'''')||'  ,     
    '||DECODE(C.ds_email, NULL, 'NULL', ''''||C.ds_email||'''')||'  ,    
    '||DECODE(C.nm_cliente, NULL, 'NULL', ''''||C.nm_cliente||'''')||'  ,   
    '||DECODE(c.pid_endereco, NULL, 'NULL', c.pid_endereco)||'  ,   
    '||DECODE(c.pid_sexo, NULL, 'NULL', c.pid_sexo)||'  ,  
    '||DECODE(C.num_ddd_celular, NULL, 'NULL', ''''||C.num_ddd_celular||'''')||'  ,      
    '||DECODE(C.num_telefone_celular, NULL, 'NULL', ''''||C.num_telefone_celular||'''')||'  ,   
    '||DECODE(c.pid_pais_endereco_postal, NULL, 'NULL', c.pid_pais_endereco_postal)||'  ,  
    '||DECODE(C.ds_empresa, NULL, 'NULL', ''''||C.ds_empresa||'''')||'        
);' 
from WISGCICATU_PRD.TB_CLIENTE c  
join WISGCICATU_PRD.tb_documento d on d.pid_cliente=c.id
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=d.PID_EMPRESA  
where d.pid_empresa=4
.
spool Insert_TB_CLIENTE.sql
/
spool off;

-- 12 - POPULA - TB_RESPONSAVEL_FINANCEIRO
SELECT 'INSERT INTO tb_responsavel_financeiro (    id,    nome,    num_cpf,    pid_cliente,    dt_nascimento,    ds_email) VALUES (    '||R.ID||', '||
        DECODE(r.nome, NULL, 'NULL', ''''||r.nome||'''')||'  ,         '||DECODE(r.num_cpf, NULL, 'NULL', ''''||r.num_cpf||'''')||'  ,       '||
        DECODE(r.pid_cliente, NULL, 'NULL', r.pid_cliente)||'  ,      '||DECODE(r.dt_nascimento, NULL, 'NULL', ''''||r.dt_nascimento||'''')||'  ,         '||
        DECODE(r.ds_email, NULL, 'NULL', ''''||r.ds_email||'''')||'           );' 
from WISGCICATU_PRD.TB_RESPONSAVEL_FINANCEIRO r
join WISGCICATU_PRD.TB_CLIENTE c  on c.id=r.pid_cliente
join WISGCICATU_PRD.tb_documento d on d.pid_cliente=c.id
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=d.PID_EMPRESA  
where d.pid_empresa=4
.
spool Insert_TB_RESPONSAVEL_FINANCEIRO.sql
/
spool off;

-- 13 - POPULA - TB_RESPONSAVEL_LEGAL
SELECT 'INSERT INTO tb_responsavel_legal (    id,    num_doc_identificacao,    pid_documento_civil,    ds_email,    pid_cliente,    nm_resp_legal,    num_cpf,    dt_nascimento,    nm_arquivo,    num_ddd_celular,    num_tel_celular) 
VALUES (
'||R.ID||',    
'||DECODE(r.num_doc_identificacao, NULL, 'NULL', ''''||r.num_doc_identificacao||'''')||'  ,         
'||DECODE(r.pid_documento_civil, NULL, 'NULL', r.pid_documento_civil)||'  ,     
'||DECODE(r.ds_email, NULL, 'NULL', ''''||r.ds_email||'''')||'  ,        
'||DECODE(r.pid_cliente, NULL, 'NULL', r.pid_cliente)||'  ,  
'||DECODE(r.nm_resp_legal, NULL, 'NULL', ''''||r.nm_resp_legal||'''')||'  ,         
'||DECODE(r.num_cpf, NULL, 'NULL', ''''||r.num_cpf||'''')||'  ,        
'||DECODE(r.dt_nascimento, NULL, 'NULL', ''''||r.dt_nascimento||'''')||'  ,NULL,21 ,999999999 );' 
from WISGCICATU_PRD.TB_RESPONSAVEL_LEGAL r
join WISGCICATU_PRD.TB_CLIENTE c  on c.id=r.pid_cliente
join WISGCICATU_PRD.tb_documento d on d.pid_cliente=c.id
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=d.PID_EMPRESA  
where d.pid_empresa=4
.
spool Insert_TB_RESPONSAVEL_LEGAL.sql
/
spool off;

-- 14  - POPULA - TB_NIF
SELECT 'INSERT  tb_nif ( id, num_nif, pid_pais, pid_cliente, pid_motivo_nif) VALUES ('||n.ID||','||DECODE(n.num_nif, NULL, 'NULL', ''''||n.num_nif||'''')||'     ,   '||
        DECODE(n.pid_pais, NULL, 'NULL', n.pid_pais)||'  ,   '||DECODE(n.pid_cliente, NULL, 'NULL', n.pid_cliente)||'  ,  NULL );'
from WISGCICATU_PRD.TB_NIF n
join WISGCICATU_PRD.TB_CLIENTE c  on c.id=n.pid_cliente
join WISGCICATU_PRD.tb_documento d on d.pid_cliente=c.id
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=d.PID_EMPRESA  
where d.pid_empresa=4
.
spool Insert_TB_NIF.sql
/
spool off;

-- 15 - POPULA - TB_INVESTIMENTO
SELECT 'insert into TB_INVESTIMENTO (ID,PID_TIPO_INVESTIMENTO,PID_RISCO_PRE_FORMAT,PID_TIPO_RISCO,PID_PRODUTO,PID_EMPRESA,NM_INVESTIMENTO,CD_FUNDO_SEG,DS_RESUMO,FL_MAIOR_VENDA,FL_APORTE_OBRIG,FL_CONTRIB_OBRIG,FL_VISAO_CLIENTE,FL_ATIVO,VL_APORTE,
VL_CONTRIBUICAO,COR)values(
        '||ID||', 
        1,  
        null, 
        null, 
        '||PID_PRODUTO||',
        '||PID_EMPRESA||',
        '''||NM_FUNDO_REDUZIDO||''', 
        '''||CD_FUNDO_SEG||''', 
        null, 
        null, 
        '''||FL_APORTE_OBRIG||''', 
        '''||FL_CONTRIB_OBRIG||''', 
        ''S'', 
        '''||FL_ATIVO||''', 
        '||VL_APORTE_MIN||', 
        '||VL_CONTR_MIN||' ,
        null 
        );',
from  WISGCICATU_PRD.TB_FUNDO WHERE PID_EMPRESA=4 order by id 
.
spool Insert_TB_INVESTIMENTO.sql
/
spool off;

-- 16 - POPULA - TB_FUNDO
SELECT 'INSERT INTO TB_FUNDO   (  NM_FUNDO,    ID,    VL_TAF,    NU_CNPJ,    CD_FUNDO_SEG,    NM_FUNDO_REDUZIDO  )
  VALUES
  ( '''||F.NM_FUNDO ||''',
     '||ID||', 
     '||replace(lpad(rtrim(to_char(VL_TAF, 'FM90D99'), to_char(VL_TAF, 'D')), 6),',', '.')       ||' , 
      '||NU_CNPJ||', 
    '''||CD_FUNDO_SEG||''',
    '''|| NM_FUNDO_REDUZIDO||''' 
  );'
from WISGCICATU_PRD.TB_FUNDO f WHERE f.PID_EMPRESA =4   order by id
.
spool Insert_TB_FUNDO.sql
/
spool off;

-- 17 - POPULA - tb_fundo_investimento
SELECT 'INSERT INTO tb_fundo_investimento   ( ID,PID_INVESTIMENTO,PID_FUNDO,PC_DISTRIBUICAO,NU_PROCESSO_SUSEP,NM_PLANO,CD_TP_CARREGAMENTO,POSSUI_PERFORMANCE,CD_FUNDO_SEG,NU_CNPJ  )  VALUES
  ( '||f.id||',
    '||f.id||',
    '||f.id||',
    100,
    '''|| f.NU_PROCESSO_SUSEP  ||'''  , 
    '''|| f.nm_plano ||'''  , 
    '||  CD_TP_CARREGAMENTO||'  , 
    '''||     case when (f.POSSUI_PERFORMANCE is null or f.POSSUI_PERFORMANCE = '0') then 'N' else 'S' end      ||''', 
    '''||f.CD_FUNDO_SEG||''',
    '''||f.NU_CNPJ ||''' 
  );'  
from  WISGCICATU_PRD.TB_FUNDO f 
WHERE f.PID_EMPRESA =4    order by f.NU_CNPJ
.
spool Insert_tb_fundo_investimento.sql
/
spool off;

-- 18 - POPULA - TB_DOCUMENTO
SELECT 'INSERT INTO  tb_documento (    id_documento,    pid_empresa,    pid_cliente,    pid_ramo,    dt_cadastro,    pid_tipo_documento,    num_doc_seg,    pid_situacao_seguradora,    pid_canal_venda,    pid_usuario_digitador,    pid_estrutura_venda,    pid_compra,    pid_usuario)
VALUES (
    '||d.id_documento||',  
    '||DECODE(d.pid_empresa, NULL, 'NULL', ''''||d.pid_empresa||'''')||'    ,
    '||DECODE(d.pid_cliente, NULL, 'NULL', ''''||d.pid_cliente||'''')||'  ,
    '||DECODE(d.pid_ramo, NULL, 'NULL', ''''||d.pid_ramo||'''')||'   ,
    '||DECODE(d.dt_cadastro, NULL, 'NULL', ''''||d.dt_cadastro||'''')||'     ,
    '||DECODE(d.pid_tipo_documento, NULL, 'NULL', ''''||d.pid_tipo_documento||'''')||'   ,
    '||DECODE(d.num_doc_seg, NULL, 'NULL', ''''||d.num_doc_seg||'''')||'     ,
    '||DECODE(d.pid_situacao_seguradora, NULL, 'NULL', ''''||d.pid_situacao_seguradora||'''')||'  ,
    '||DECODE(d.pid_canal_venda, NULL, 'NULL', ''''||d.pid_canal_venda||'''')||'  ,
    '||DECODE(d.pid_usuario_digitador, NULL, 'NULL', ''''||d.pid_usuario_digitador||'''')||'  ,
    '||DECODE(d.pid_estrutura_venda, NULL, 'NULL', ''''||d.pid_estrutura_venda||'''')||' ,
    NULL  ,
    '||DECODE(d.pid_corretor, NULL, 'NULL', ''''||d.pid_corretor||'''')||' 
);'
from WISGCICATU_PRD.TB_DOCUMENTO d 
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=d.PID_EMPRESA  
where e.id=4 order by d.id_documento
.
spool Insert_TB_DOCUMENTO.sql
/
spool off;

-- 19 - POPULA - TB_HISTORICO_DOCUMENTO
SELECT 'INSERT INTO tb_historico_documento (    id,    pid_documento,    pid_situacao,    dt_atualizacao,    ip,    ua,    nm_usuario,    pid_motivo_recusa)
VALUES (
    '||hd.id||' , 
    '||DECODE(hd.pid_documento, NULL, 'NULL',  hd.pid_documento )||' ,   
    '||DECODE(hd.pid_situacao, NULL, 'NULL',  hd.pid_situacao )||' ,    
    '||DECODE(hd.DT_ATUALIZACAO, NULL, 'NULL', ''''||hd.DT_ATUALIZACAO||'''')||'   ,
    '||DECODE(hd.ip, NULL, 'NULL', ''''||hd.ip||'''')||' ,
    '||DECODE(hd.ua, NULL, 'NULL', ''''||hd.ua||'''')||' ,
    '||DECODE(hd.nm_usuario, NULL, 'NULL', ''''||hd.nm_usuario||'''')||' ,
    NULL); '
from WISGCICATU_PRD.TB_HISTORICO_DOCUMENTO hd
join WISGCICATU_PRD.TB_DOCUMENTO d on d.id_documento =hd.pid_documento
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=d.PID_EMPRESA  
where e.id=4
order by hd.id
.
spool Insert_TB_HISTORICO_DOCUMENTO.sql
/
spool off;

-- 20 - POPULA - TB_HISTORICO_DOC_CORRETOR
SELECT 'INSERT INTO tb_historico_doc_corretor (    id,    pid_documento,    dt_alteracao,    pid_usuario_anterior,    pid_usuario_atual,    pid_corretor_anterior,    pid_corretor_atual) VALUES (     '||hdc.id||' , '||DECODE(hdc.pid_documento, NULL, 'NULL',  hdc.pid_documento )||'    , '||
        DECODE(hdc.dt_alteracao, NULL, 'NULL', ''''||hdc.dt_alteracao||'''')||' ,    NULL        , NULL        , '||
        DECODE(hdc.pid_corretor_anterior, NULL, 'NULL',  hdc.pid_corretor_anterior )||'    , '||
        DECODE(hdc.pid_corretor_atual, NULL, 'NULL',  hdc.pid_corretor_atual )||'    );'
from WISGCICATU_PRD.TB_HISTORICO_DOC_CORRETOR hdc
join WISGCICATU_PRD.TB_DOCUMENTO d on d.id_documento =hdc.pid_documento
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=d.PID_EMPRESA  
where e.id=4
order by hdc.id
.
spool Insert_TB_HISTORICO_DOC_CORRETOR.sql
/
spool off;

-- 21 - POPULA - TB_DOCUMENTO_PREVIDENCIA
SELECT 'INSERT INTO  tb_documento_previdencia (    pid_documento_previdencia,    num_apolice,    num_idade_concessao,    vl_aporte_inicial,    vl_contribuicao,    pid_regime_tributario) 
VALUES (
  '||  dp.pid_documento_previdencia ||',
    '||DECODE(dp.num_apolice, NULL, 'NULL', ''''||dp.num_apolice||'''')||'  ,
   '||DECODE(dp.num_idade_concessao, NULL, 'NULL', ''''||dp.num_idade_concessao||'''')||' ,
    '||DECODE(dp.vl_aporte_inicial, NULL, 'NULL', ''''||dp.vl_aporte_inicial||'''')||' ,
    '||DECODE(dp.vl_contribuicao, NULL, 'NULL', ''''||dp.vl_contribuicao||'''')||' ,
  '||DECODE(dp.pid_regime_tributario, NULL, 'NULL',  dp.pid_regime_tributario )||'   
);'
from WISGCICATU_PRD.TB_DOCUMENTO_PREVIDENCIA dp
join WISGCICATU_PRD.tb_documento d on d.id_documento = dp.PID_DOCUMENTO_PREVIDENCIA 
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=d.PID_EMPRESA  
where e.id=4
.
spool Insert_TB_DOCUMENTO_PREVIDENCIA.sql
/
spool off;

-- 22 - POPULA - TB_DOCUMENTO_BENEFICIARIO
SELECT 'INSERT INTO tb_documento_beneficiario (
    id,
    pc_participacao,
    pid_documento_previdencia,
    dt_nascimento,
    nm_beneficiario,
    pid_grau_parentesco
) VALUES (
    '||  db.id||', 
    '||DECODE(db.pc_participacao, NULL, 'NULL', ''''||db.pc_participacao||'''')||'  ,   
    '||DECODE(db.pid_documento_previdencia, NULL, 'NULL',  db.pid_documento_previdencia )||'    ,
    '||DECODE(db.dt_nascimento, NULL, 'NULL', ''''||db.dt_nascimento||'''')||'  ,    
    '||DECODE(db.nm_beneficiario, NULL, 'NULL', ''''||db.nm_beneficiario||'''')||'  ,  
    '||DECODE(db.pid_grau_parentesco, NULL, 'NULL',  db.pid_grau_parentesco )||'    
);'
from WISGCICATU_PRD.TB_DOCUMENTO_BENEFICIARIO db
join WISGCICATU_PRD.TB_DOCUMENTO_PREVIDENCIA dp on dp.pid_documento_previdencia=db.pid_documento_previdencia
join WISGCICATU_PRD.tb_documento d on d.id_documento = dp.PID_DOCUMENTO_PREVIDENCIA 
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=d.PID_EMPRESA  
where e.id=4
.
spool Insert_TB_DOCUMENTO_BENEFICIARIO.sql
/
spool off;

-- 23 - POPULA - TB_DOCUMENTO_COBRANCA
SELECT 'INSERT INTO  tb_documento_cobranca (    id,    pid_documento_previdencia,    pid_banco,    num_agencia,    dv_conta_corrente,    pid_forma_pagamento,    num_conta_corrente,    pid_dia_vencimento,    dv_agencia)
VALUES (
    '||  dc.id||',  
     '||DECODE(dc.pid_documento_previdencia, NULL, 'NULL',  dc.pid_documento_previdencia )||'    ,  
     '||DECODE(dc.pid_banco, NULL, 'NULL',  dc.pid_banco )||'  ,
    '||DECODE(dc.num_agencia, NULL, 'NULL', ''''||dc.num_agencia||'''')||' ,
    '||DECODE(dc.dv_conta_corrente, NULL, 'NULL', ''''||dc.dv_conta_corrente||'''')||' ,
    '||DECODE(dc.pid_forma_pagamento, NULL, 'NULL',  dc.pid_forma_pagamento )||'   ,
    '||DECODE(dc.num_conta_corrente, NULL, 'NULL', ''''||dc.num_conta_corrente||'''')||' ,
   '||DECODE(dc.pid_dia_vencimento, NULL, 'NULL',  dc.pid_dia_vencimento )||'    ,
    '||DECODE(dc.dv_agencia, NULL, 'NULL', ''''||dc.dv_agencia||'''')||' 
);'
from WISGCICATU_PRD.TB_DOCUMENTO_COBRANCA dc
join WISGCICATU_PRD.TB_DOCUMENTO_PREVIDENCIA dp on dp.pid_documento_previdencia=dc.pid_documento_previdencia
join WISGCICATU_PRD.tb_documento d on d.id_documento = dp.PID_DOCUMENTO_PREVIDENCIA 
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=d.PID_EMPRESA  
where e.id=4
.
spool Insert_TB_DOCUMENTO_COBRANCA.sql
/
spool off;

-- 24 - POPULA - TB_PORTABILIDADE
SELECT 'INSERT INTO tb_portabilidade (
    pid_documento_portabilidade,
    pid_seguradora_ced,
    pid_tipo_produto,
    pid_regime_tributario_ced,
    pid_tipo_entidade_ced,
    vl_portabilidade,
    nm_plano_ced,
    pid_tipo_portabilidade,
    num_cnpj_fundo_ced,
    num_certificado_ced,
    num_susep_fundo_ced,
    pid_documento_previdencia,
    nm_arquivo
) VALUES ('||  p.pid_documento_portabilidade||',    
'||DECODE(p.pid_seguradora_ced, NULL, 'NULL',  p.pid_seguradora_ced )||'    ,
'||DECODE(p.pid_tipo_produto, NULL, 'NULL',  p.pid_tipo_produto )||'   ,
'||DECODE(p.pid_regime_tributario_ced, NULL, 'NULL',  p.pid_regime_tributario_ced )||'   ,
'||DECODE(p.pid_tipo_entidade_ced, NULL, 'NULL',  p.pid_tipo_entidade_ced )||'  ,
'||DECODE(p.vl_portabilidade, NULL, 'NULL', ''''||p.vl_portabilidade||'''')||' ,   
'||DECODE(p.nm_plano_ced, NULL, 'NULL', ''''||p.nm_plano_ced||'''')||' ,    
'||DECODE(p.pid_tipo_portabilidade, NULL, 'NULL',  p.pid_tipo_portabilidade )||'  ,
'||DECODE(p.num_cnpj_fundo_ced, NULL, 'NULL', ''''||p.num_cnpj_fundo_ced||'''')||' ,    
'||DECODE(p.num_certificado_ced, NULL, 'NULL', ''''||p.num_certificado_ced||'''')||' , 
'||DECODE(p.num_susep_fundo_ced, NULL, 'NULL', ''''||p.num_susep_fundo_ced||'''')||' ,    
'||DECODE(p.pid_documento_previdencia, NULL, 'NULL',  p.pid_documento_previdencia )||'   ,
'||DECODE(p.nm_arquivo, NULL, 'NULL', ''''||p.nm_arquivo||'''')||'    
);'
from WISGCICATU_PRD.TB_PORTABILIDADE p
join WISGCICATU_PRD.TB_DOCUMENTO_PREVIDENCIA dp on dp.pid_documento_previdencia=p.pid_documento_previdencia
join WISGCICATU_PRD.tb_documento d on d.id_documento = dp.PID_DOCUMENTO_PREVIDENCIA 
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=d.PID_EMPRESA  
where e.id=4
.
spool Insert_TB_PORTABILIDADE.sql
/
spool off;

-- 25 - POPULA - TB_PROPOSTA_FUNDO_INVESTIMENTO
SELECT 'INSERT INTO  tb_proposta_fundo_investimento (
    num_doc_seg,
    pc_distribuicao,
    pid_fundo_investimento,
    pid_documento_previdencia
) VALUES (
    '||DECODE(d.num_doc_seg, NULL, 'NULL', ''''||d.num_doc_seg||'''')||' ,
    100,
 '||DECODE( dp.pid_fundo, NULL, 'NULL',   dp.pid_fundo )||'    ,
 '||DECODE(dp.pid_documento_previdencia, NULL, 'NULL',  dp.pid_documento_previdencia )||'     
);' 
from WISGCICATU_PRD.TB_DOCUMENTO_PREVIDENCIA dp 
join WISGCICATU_PRD.tb_documento d on d.id_documento = dp.PID_DOCUMENTO_PREVIDENCIA 
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=d.PID_EMPRESA  
where e.id=4
.
spool Insert_TB_PROPOSTA_FUNDO_INVESTIMENTO.sql
/
spool off;

-- 26 - POPULA - tb_codigo_acesso
SELECT DISTINCT 'INSERT INTO tb_codigo_acesso (
    id,
    cd_transacao,
    dt_criacao,
    pid_compra
) VALUES (
    '||  ca.id||',   
  '||DECODE(ca.cd_transacao, NULL, 'NULL',  ca.cd_transacao )||'     ,
   '||DECODE(ca.dt_criacao, NULL, 'NULL', ''''||ca.dt_criacao||'''')||' ,
    NULL);'
from WISGCICATU_PRD.TB_CODIGO_ACESSO ca
join WISGCICATU_PRD.tb_documento d on d.id_documento = ca.PID_DOCUMENTO
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=d.PID_EMPRESA  
where e.id=4
.
spool Insert_tb_codigo_acesso.sql
/
spool off;

-- 27 - POPULA - tb_num_documento_seg
SELECT distinct 'INSERT INTO  tb_num_documento_seg (    num_documento_seg,    fl_assinada) 
 VALUES (  '||DECODE(ds.num_documento_seg, NULL, 'NULL', ''''||ds.num_documento_seg||'''')||'    ,
  '||DECODE(ds.fl_assinada, NULL, 'NULL', ''''||ds.fl_assinada||'''')||'   );'
 from WISGCICATU_PRD.TB_NUM_DOCUMENTO_SEG ds
join WISGCICATU_PRD.tb_documento d on d.num_doc_seg = ds.num_documento_seg
JOIN WISGCICATU_PRD.TB_EMPRESA E ON E.ID=d.PID_EMPRESA  
where e.id=4
.
spool Insert_tb_num_documento_seg.sql
/
spool off;
exit
