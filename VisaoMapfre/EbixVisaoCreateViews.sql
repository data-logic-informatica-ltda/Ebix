-- Script de criação das views
-- Autor: Alexandre e Rogerio
-- Favor informar antes de executar o script o schema que será usado para receber os objeetos

-- Indexes

/************************************
*  INPUT PARAMETERS
************************************/
DEFINE owner=

alter session set current_schema = &owner;

spool create_Views.log

CREATE OR REPLACE FORCE VIEW "VW_DOCUMENTO" ("TIPOINFORENDIMENTO", "NUMPROPOSTA", "IDPROPOSTA", "TIPO_PRODUTO", "CODIGO_PRODUTO", "NOME_CLIENTE", "SEXO", "NASCIMENTO", "ESTADO_CIVIL", "CPF", "TITULARIDADE", "NUM_IDENTIFICACAO", "DOCUMENTO", "ORG_EMISSOR", "DTGERACAO", "HRGERACAO", "DTMOVIMENTO", "DTEXPEDICAO", "COD_PAIS", "COD_OUTRO_PAIS", "HIST_DOC_IDENTIF", "HIST_DOC_STATUS", "MOTIVO_REC", "NACIONALIDADE", "ENDERECO", "NUMERO_END", "COMPLEMENTO", "CEP", "BAIRRO", "CIDADE", "UF", "PAIS", "DDD", "TELEFONE", "DDD_CELULAR", "TELEFONE_CELULAR", "OCUPACAO", "PESSOA_POLIT_EXP", "ORIGEM_RECURSOS", "VL_RENDA", "EMAIL", "OUTRA_NACIONALIDADE", "ESTEVE_EUA", "CD_FUNDO", "NOME_PLANO", "SUSEP", "CNPJ_FUNDO", "NOME_FUNDO", "TAXA_ADM", "TIPO_CARREGAMENTO", "IDADE_APOSENTADORIA", "REGIME_TABELA_DESC", "VL_APORTEINICIAL", "VL_CONTRIBUICAO", "DIA_VENCIMENTO", "COD_FORMA_PAGTO", "NOME_BENEFICIARIO", "BENEFICIARIO_NASCIMENTO", "BENEFICIARIO_PARENTESCO", "BENEFICIARIO_PARTICIPACAO", "NRO_BANCO", "NOME_BANCO", "AGENCIA", "CONTA_CORRENTE", "DV_CONTA_CORRENTE", "FINANCEIRO_NOME", "FINANCEIRO_CPF", "RESP_LEGAL_NOME", "RESP_LEGAL_DOC_IDENT", "DOCUMENTO_NATUREZA", "NOME_EMPRESA_SOCIALCORRETOR", "EMPRESA_SUSEP") AS 
  SELECT DISTINCT
             PRODUTO.PID_TIPO_PRODUTO                     AS TIPOINFORENDIMENTO
            ,SEG_DOC.NUM_DOC_SEG                          AS NUMPROPOSTA
            ,SEG_DOC.ID_DOCUMENTO                         AS IDPROPOSTA
            ,TIPO_PRODUTO.DS_TIPO_PRODUTO                 AS TIPO_PRODUTO
            ,PRODUTO.CD_PRODUTO_SEG                       AS CODIGO_PRODUTO
            ,CLIENTE.NM_CLIENTE                           AS NOME_CLIENTE
            ,SEXO.DS_SEXO                                 AS SEXO
            ,CLIENTE.DT_NASCIMENTO                        AS NASCIMENTO
            ,EST_CIVIL.NM_ESTADO_CIVIL                    AS ESTADO_CIVIL
            ,CLIENTE.NUM_CPF                              AS CPF
            ,TITULARIDADE.DS_TITULARIDADE                 AS TITULARIDADE
            ,CLIENTE.NUM_DOC_IDENTIFICACAO                AS NUM_IDENTIFICACAO
            ,DOCUMENTO.DS_DOCUMENTO                       AS DOCUMENTO
            ,ORG_EMISSOR.NM_ORGAO                         AS ORG_EMISSOR
            ,TO_CHAR(SYSDATE, 'dd/mm/yyyy')               AS DTGERACAO
            ,TO_CHAR(SYSDATE, 'hh24:mi:ss')               AS HRGERACAO
            ,TO_CHAR(SYSDATE, 'dd/mm/yyyy')               AS DTMOVIMENTO
            ,TO_CHAR(CLIENTE.DT_EXPEDICAO, 'DD/MM/YYYY')  AS DTEXPEDICAO
            ,CLIENTE.CD_PAIS_NACIONALIDADE                AS COD_PAIS
            ,CLIENTE.CD_PAIS_OUTRA_NACIONALIDADE          AS COD_OUTRO_PAIS
            ,CASE
              WHEN (SEG_DOC.ID_DOCUMENTO != NULL) THEN
                          (SELECT HISTORICO_DOC.ID
                                  FROM TB_HISTORICO_DOCUMENTO HISTORICO_DOC
                                  WHERE 1=1
                                  AND HISTORICO_DOC.PID_SEGURO_DOCUMENTO = SEG_DOC.ID_DOCUMENTO)
              END HIST_DOC_IDENTIF
             ,CASE
               WHEN (SEG_DOC.ID_DOCUMENTO != NULL) THEN
                          (SELECT HISTORICO_DOC.PID_SITUACAO
                                  FROM TB_HISTORICO_DOCUMENTO HISTORICO_DOC
                                  WHERE 1=1
                                  AND HISTORICO_DOC.PID_SEGURO_DOCUMENTO = SEG_DOC.ID_DOCUMENTO)
              END HIST_DOC_STATUS
              ,CASE
              WHEN (SEG_DOC.ID_DOCUMENTO != NULL) THEN
                          (SELECT MOTIVO_REC.NM_MOTIVO
                                  FROM TB_HISTORICO_DOCUMENTO HISTORICO_DOC
                                  INNER JOIN TB_HISTORICO_MOTIVO_RECUSA HIST_MOT_RECUSA ON HIST_MOT_RECUSA.PID_HISTORICO =  HISTORICO_DOC.ID
                                  INNER JOIN TB_MOTIVO_RECUSA MOTIVO_REC ON MOTIVO_REC.ID = HIST_MOT_RECUSA.PID_MOTIVO_RECUSA
                                  WHERE 1=1
                                  AND HISTORICO_DOC.PID_SEGURO_DOCUMENTO = SEG_DOC.ID_DOCUMENTO)
              END MOTIVO_REC
            ,CASE
                 CLIENTE.CD_PAIS_NACIONALIDADE
                             WHEN 31 then 'BRA'
                             WHEN 68 then 'EUA'
                 END NACIONALIDADE
            ,ENDERECO.DS_ENDERECO                         AS ENDERECO
            ,ENDERECO.NU_ENDERECO                         AS NUMERO_END
            ,ENDERECO.DS_COMPLEMENTO                      AS COMPLEMENTO
            ,ENDERECO.NU_CEP                              AS CEP
            ,ENDERECO.DS_BAIRRO                           AS BAIRRO
            ,ENDERECO.NM_CIDADE                           AS CIDADE
            ,UF.DS_UF                                     AS UF
            ,PAIS.NM_PAIS                                 AS PAIS
            ,CLIENTE.NUM_DDD_RESIDENCIAL                  AS DDD
            ,CLIENTE.NUM_TELEFONE_RESIDENCIAL             AS TELEFONE
            ,CLIENTE.NUM_DDD_CELULAR                      AS DDD_CELULAR
            ,CLIENTE.NUM_TELEFONE_CELULAR                 AS TELEFONE_CELULAR
            ,OCUPACAO.DS_OCUPACAO                         AS OCUPACAO
            ,CLIENTE.CD_PPE                               AS PESSOA_POLIT_EXP
            ,CLIENTE.DS_ORIGEM_RECURSO                    AS ORIGEM_RECURSOS
            ,CLIENTE.VL_RENDA_PATRIMONIO                  AS VL_RENDA
            ,CLIENTE.DS_EMAIL                             AS EMAIL
            ,OUTRO_PAIS.NM_PAIS                           AS OUTRA_NACIONALIDADE
            ,CLIENTE.CD_ESTEVE_EUA                        AS ESTEVE_EUA
            --#OPCAO PLANO#--
            ,FUNDO.CD_FUNDO_SEG                           AS CD_FUNDO
            ,FUNDO.NM_PLANO                               AS NOME_PLANO
            ,FUNDO.NU_PROCESSO_SUSEP                      AS SUSEP
            ,FUNDO.NU_CNPJ                                AS CNPJ_FUNDO
            ,FUNDO.NM_FUNDO                               AS NOME_FUNDO
            ,FUNDO.VL_TAF                                 AS TAXA_ADM
            ,FUNDO.CD_TP_CARREGAMENTO                     AS TIPO_CARREGAMENTO
            ,DOCUMENTO_PREVIDENCIA.NUM_IDADE_CONCESSAO    AS IDADE_APOSENTADORIA
            ,CASE
                 REG_TRIBUTARIO.ID
                             WHEN 1 then 'Progressiva'
                             WHEN 2 then 'Regressiva'
             END REGIME_TABELA_DESC
            ,DOCUMENTO_PREVIDENCIA.VL_APORTE_INICIAL      AS VL_APORTEINICIAL
            ,DOCUMENTO_PREVIDENCIA.VL_CONTRIBUICAO        AS VL_CONTRIBUICAO
            ,VENCIMENTO.NUM_DIA_VENCIMENTO                AS DIA_VENCIMENTO
            ,COBRANCA.PID_FORMA_PAGAMENTO                 AS COD_FORMA_PAGTO
            --#DADOS PAGAMENTO#--
            ,BENEFICIARIO.NM_BENEFICIARIO                 AS NOME_BENEFICIARIO
            ,BENEFICIARIO.DT_NASCIMENTO                   AS BENEFICIARIO_NASCIMENTO
            ,BENEFICIARIO.DS_PARENTESCO                   AS BENEFICIARIO_PARENTESCO
            ,BENEFICIARIO.PC_PARTICIPACAO                 AS BENEFICIARIO_PARTICIPACAO
            ,BANCO.NUM_BANCO                              AS NRO_BANCO
            ,BANCO.DESC_BANCO                             AS NOME_BANCO
            ,COBRANCA.NUM_AGENCIA                         AS AGENCIA
            ,COBRANCA.NUM_CONTA_CORRENTE                  AS CONTA_CORRENTE
            ,COBRANCA.DV_CONTA_CORRENTE                   AS DV_CONTA_CORRENTE
            ,CASE
                WHEN (CLIENTE.ID != NULL) THEN
                            (SELECT RESP_FINANCEIRO.NOME
                                    FROM TB_RESPONSAVEL_FINANCEIRO RESP_FINANCEIRO
                                    WHERE 1=1
                                    AND RESP_FINANCEIRO.PID_CLIENTE = CLIENTE.ID)
                END FINANCEIRO_NOME
             ,CASE
                WHEN (CLIENTE.ID != NULL) THEN
                            (SELECT RESP_FINANCEIRO.NUM_CPF
                                    FROM TB_RESPONSAVEL_FINANCEIRO RESP_FINANCEIRO
                                    WHERE 1=1
                                    AND RESP_FINANCEIRO.PID_CLIENTE = CLIENTE.ID)
                END FINANCEIRO_CPF
            --#DADOS PROCURADOR#--
            ,CASE
                WHEN (CLIENTE.ID != NULL) THEN
                            (SELECT RESP_LEGAL.NM_RESP_LEGAL
                                    FROM TB_RESPONSAVEL_LEGAL RESP_LEGAL
                                    WHERE 1=1
                                    AND RESP_LEGAL.PID_CLIENTE = CLIENTE.ID)
                END RESP_LEGAL_NOME
            ,CASE
                WHEN (CLIENTE.ID != NULL) THEN
                            (SELECT RESP_LEGAL.NUM_DOC_IDENTIFICACAO
                                    FROM TB_RESPONSAVEL_LEGAL RESP_LEGAL
                                    WHERE 1=1
                                    AND RESP_LEGAL.PID_CLIENTE = CLIENTE.ID)
                END RESP_LEGAL_DOC_IDENT
            ,CASE
              WHEN (CLIENTE.ID != NULL) THEN
                          (SELECT DOC_LEGAL.DS_DOCUMENTO
                                  FROM TB_RESPONSAVEL_LEGAL RESP_LEGAL
                                  INNER JOIN TB_DOCUMENTO_CIVIL DOC_LEGAL ON DOC_LEGAL.CD_DOCUMENTO =  RESP_LEGAL.PID_DOCUMENTO
                                  WHERE 1=1
                                  AND RESP_LEGAL.PID_CLIENTE = CLIENTE.ID)
              END DOCUMENTO_NATUREZA
            --#USO CORRETOR#--
            ,EMPRESA.NM_EMPRESA                          AS NOME_EMPRESA_SOCIALCORRETOR
            ,EMPRESA.NU_SUSEP                            AS EMPRESA_SUSEP
            FROM TB_DOCUMENTO SEG_DOC
                                            INNER JOIN TB_DOCUMENTO_CIVIL DOCUMENTO ON DOCUMENTO.CD_DOCUMENTO = SEG_DOC.ID_DOCUMENTO
                                            INNER JOIN TB_EMPRESA EMPRESA ON EMPRESA.ID = SEG_DOC.PID_EMPRESA
                                            INNER JOIN TB_CLIENTE CLIENTE ON CLIENTE.ID =  SEG_DOC.PID_CLIENTE
                                            INNER JOIN TB_SEXO SEXO ON SEXO.ID = CLIENTE.PID_SEXO
                                            INNER JOIN TB_ESTADO_CIVIL EST_CIVIL ON EST_CIVIL.ID = CLIENTE.PID_ESTADO_CIVIL
                                            INNER JOIN TB_TITULARIDADE TITULARIDADE ON TITULARIDADE.CD_TITULARIDADE = CLIENTE.PID_TITULARIDADE
                                            INNER JOIN TB_ORGAO_EMISSOR ORG_EMISSOR ON ORG_EMISSOR.ID = CLIENTE.PID_ORGAO_EMISSOR
                                            INNER JOIN TB_ENDERECO ENDERECO ON ENDERECO.ID = CLIENTE.PID_ENDERECO
                                            INNER JOIN TB_UF UF ON UF.ID = ENDERECO.PID_UF
                                            INNER JOIN TB_PAIS PAIS ON PAIS.CD_PAIS = CLIENTE.CD_PAIS_NACIONALIDADE
                                            INNER JOIN TB_PAIS OUTRO_PAIS ON OUTRO_PAIS.CD_PAIS = CLIENTE.CD_PAIS_OUTRA_NACIONALIDADE
                                            INNER JOIN TB_OCUPACAO OCUPACAO ON OCUPACAO.CD_OCUPACAO = CLIENTE.PID_OCUPACAO
                                            INNER JOIN TB_RAMO RAMO ON RAMO.ID = SEG_DOC.PID_RAMO
                                            INNER JOIN TB_CORRETOR CORRETOR ON CORRETOR.ID = SEG_DOC.PID_CORRETOR
                                            INNER JOIN TB_TIPO_DOCUMENTO TIPO_DOC ON TIPO_DOC.ID = SEG_DOC.PID_TIPO_DOCUMENTO
                                            --OPÇÃO DE PLANO
                                            INNER JOIN TB_DOCUMENTO_PREVIDENCIA DOCUMENTO_PREVIDENCIA ON DOCUMENTO_PREVIDENCIA.PID_DOCUMENTO = SEG_DOC.ID_DOCUMENTO
                                            INNER JOIN TB_FUNDO FUNDO ON FUNDO.ID = DOCUMENTO_PREVIDENCIA.PID_FUNDO
                                            INNER JOIN TB_PRODUTO PRODUTO ON PRODUTO.ID = FUNDO.PID_PRODUTO
                                            INNER JOIN TB_TIPO_PRODUTO TIPO_PRODUTO ON TIPO_PRODUTO.CD_TIPO_PRODUTO = PRODUTO.PID_TIPO_PRODUTO
                                            INNER JOIN TB_REGIME_TRIBUTARIO REG_TRIBUTARIO ON REG_TRIBUTARIO.ID = DOCUMENTO_PREVIDENCIA.PID_REGIME_TRIBUTARIO
                                            INNER JOIN TB_DOCUMENTO_COBRANCA COBRANCA ON COBRANCA.PID_DOCUMENTO = SEG_DOC.ID_DOCUMENTO
                                            INNER JOIN TB_DIA_VENCIMENTO VENCIMENTO ON VENCIMENTO.ID_DIA_VENCIMENTO = COBRANCA.PID_DIA_VENCIMENTO
                                            INNER JOIN TB_DOCUMENTO_BENEFICIARIO BENEFICIARIO ON BENEFICIARIO.PID_DOCUMENTO  = SEG_DOC.ID_DOCUMENTO
                                            INNER JOIN TB_FORMA_PAGAMENTO FORMA_PAGAMENTO ON FORMA_PAGAMENTO.ID = COBRANCA.PID_FORMA_PAGAMENTO
                                            INNER JOIN TB_BANCO BANCO ON BANCO.CD_BANCO = COBRANCA.PID_BANCO
                                            INNER JOIN TB_EMPRESA EMPRESA ON EMPRESA.ID = SEG_DOC.PID_EMPRESA;



  CREATE OR REPLACE FORCE VIEW "VW_PORTABILIDADE" ("IDDOCUMENTO", "CODIGOPORTABILIDADE", "CODSEGURADORACEDENTE", "TIPOPORTABILIDADE", "VALORTOTALPORTADODATAREF", "VALORSOLICITADOPARCIAL", "VALORSOLICITADONAOTRIBUTAVEL", "CODTIPOENTIDADECED", "NUMIDENTPLANOCEDENTE", "TIPOTRIBUTACAOIRCEDENTE", "CODIGOPROPOSTA", "CNPJFUNDOCEDENTE", "IDPROCESSOSUSEPCEDENTE", "DESCRICAOPLANOCEDENTE", "TIPOPLANOCEDENTE", "NUMIDENTPLANOCESSIONARIA", "CODFUNDOCES", "TIPOTRIBUTACAOIRCESSIONARIA", "NOMEPARTICIPANTESEGURADO", "CPFPARTICIPANTESEGURADO", "DTNASCIMENTOPARTSEG", "SEXOPARTICIPANTESEGURADO", "EMAILPARTICIPANTESEGURADO", "CELULARPARTICIPANTESEGURADO", "CELULARPARTICIPANTESEGURADO2", "NOMEENTIDADECEDENTE", "CNPJENTIDADECEDENTE", "CNPJFUNDOCESSIONARIA", "TIPOPLANOCESSIONARIA", "IDPROCESSOSUSEPCESSIONARIA", "DESCRICAOPLANOCESSIONARIA", "CDSTATUS", "DTSOLICITACAOPARTICIPANTE", "CDEMPRESA", "SITUACAOSEGURADORA", "NOMEEMPRESA", "CODIGOPARCERIA", "CODIGOXPORT", "LOGIN", "SENHA", "AGENCIA", "NUMCONTACORRENTE", "DVCONTACORRENTE", "NUMBANCO", "CODIGOPARCERIACESSIONARIA", "CODIGOPARCERIAEMPRESA") AS 
  SELECT
    port.pid_documento_portabilidade AS idDocumento,
    ( SELECT
      doc.num_doc_seg AS numeroDocumento
      FROM tb_documento doc where doc.id_documento = port.pid_documento_portabilidade) AS codigoPortabilidade,
    port.pid_seguradora_ced          AS codSeguradoraCedente,
    port.pid_tipo_portabilidade      AS TipoPortabilidade,
    port.vl_portabilidade            AS ValorTotalPortadoDataRef,
    port.vl_portabilidade            AS ValorSolicitadoParcial,
    port.vl_portabilidade            AS ValorSolicitadoNaoTributavel,
    port.pid_tipo_entidade_ced       AS codTipoEntidadeCed,
    port.num_certificado_ced         AS NumIdentPlanoCedente,
    port.pid_regime_tributario_ced   AS TipoTributacaoIRCedente,
    port.pid_documento_previdencia   AS codigoProposta,
    port.NUM_CNPJ_FUNDO_CED          AS CNPJFundoCedente,
    port.NUM_SUSEP_FUNDO_CED         AS IDProcessoSUSEPCedente,
    port.NM_PLANO_CED                AS DescricaoPlanoCedente,
    port.PID_TIPO_PRODUTO            AS TipoPlanoCedente,
    proposta.NUM_DOC_SEG             AS NumIdentPlanoCessionaria,
    fi.pid_fundo                AS codFundoCes,
    docprev.pid_regime_tributario    AS TipoTributacaoIRCessionaria,
    cliente.nm_cliente               AS NomeParticipanteSegurado,
    cliente.num_cpf                  AS CPFParticipanteSegurado,
    cliente.dt_nascimento            AS DtNascimentoPartSeg,
    cliente.pid_sexo                 AS SexoParticipanteSegurado,
    cliente.ds_email                 AS EmailParticipanteSegurado,
    cliente.num_ddd_celular          AS CelularParticipanteSegurado,
    cliente.num_telefone_celular     AS CelularParticipanteSegurado2,
    seguradora.nm_seguradora         AS NomeEntidadeCedente,
    seguradora.num_cnpj              AS CNPJEntidadeCedente,
    fundo.nu_cnpj                    AS CNPJFundoCessionaria,
    produto.PID_TIPO_PRODUTO         AS TipoPlanoCessionaria,
    fi.nu_processo_susep          AS IDProcessoSUSEPCessionaria,
    fundo.nm_fundo_reduzido          AS DescricaoPlanoCessionaria,
    historico.pid_situacao           AS cdStatus,
    historico.dt_atualizacao         AS dtSolicitacaoParticipante,
    doc.pid_empresa                  AS cdEmpresa,
    doc.PID_SITUACAO_SEGURADORA      AS situacaoSeguradora,
    emp.nm_empresa                   AS nomeEmpresa,
    seguradora.cd_fip                AS codigoParceria,
    emp.cd_xport                     AS codigoXport,
    emp.login                        AS login,
    emp.senha                        AS senha,
    cob.NUM_AGENCIA                  AS agencia,
    cob.NUM_CONTA_CORRENTE           AS numContaCorrente,
    cob.DV_CONTA_CORRENTE            AS dvContaCorrente,
    banco.NUM_BANCO                  AS numBanco,
    seguradoraCessionaria.cd_fip     AS codigoParceriaCessionaria,
    emp.cd_parceria                  AS codigoParceriaEmpresa
  FROM tb_documento doc
  INNER JOIN TB_EMPRESA EMP ON DOC.PID_EMPRESA = EMP.ID
  INNER JOIN tb_portabilidade port ON doc.id_documento        = port.pid_documento_portabilidade
  AND DOC.PID_TIPO_DOCUMENTO= 5 INNER JOIN tb_documento_previdencia docprev ON port.pid_documento_previdencia = docprev.pid_documento_previdencia
  INNER JOIN tb_cliente cliente ON doc.pid_cliente = cliente.id
  INNER JOIN TB_SEGURADORA seguradora ON port.pid_seguradora_ced = seguradora.id
  INNER JOIN TB_SEGURADORA seguradoraCessionaria ON seguradoraCessionaria.id = 20
  INNER JOIN TB_PROPOSTA_FUNDO_INVESTIMENTO pfi ON pfi.Pid_Documento_Previdencia= Docprev.Pid_Documento_Previdencia
  INNER JOIN TB_FUNDO_INVESTIMENTO fi ON Fi.Id = Pfi.Pid_Fundo_Investimento
  INNER JOIN TB_INVESTIMENTO investimento on investimento.id = fi.pid_investimento
  INNER JOIN tb_fundo fundo ON fi.pid_fundo = fundo.id
  INNER JOIN TB_PRODUTO produto ON investimento.pid_produto = produto.id
  LEFT JOIN TB_DOCUMENTO_COBRANCA cob ON cob.PID_DOCUMENTO_PREVIDENCIA = docprev.pid_documento_previdencia
  LEFT JOIN TB_BANCO banco ON banco.CD_BANCO = cob.PID_BANCO
  INNER JOIN TB_HISTORICO_DOCUMENTO historico ON doc.id_documento         = historico.pid_documento
  INNER JOIN tb_documento proposta ON port.PID_DOCUMENTO_PREVIDENCIA = proposta.ID_DOCUMENTO
  AND historico.pid_situacao =
    (SELECT
        MAX(sit2.pid_situacao)
      FROM
        tb_historico_documento sit2
      WHERE
        sit2.pid_documento = historico.pid_documento);



  CREATE OR REPLACE FORCE VIEW "VW_PROPOSTA" ("CDPROPOSTASEGURADORA", "IDDOCUMENTO", "DTGERACAO", "HRGERACAO", "DTMOVIMENTO", "DTPROPOSTA", "CDESCRITORIO", "CDTIPODOCUMENTO", "CDFUNDO", "CDEMPRESA", "CDUSUARIO", "VLCONTRIBUICAO", "VLAPORTEINICIAL", "IDADECONCESSAOBENEFICIO", "CDREGIMETRIBUTARIO", "PERECENTUALFUNDO", "CARREGAMENTO", "PLANO", "CODIGOPARCERIA", "NOMEEMPRESA", "DGPARCERIA", "CDMUMPS", "NUMCPF", "CDTITULARIDADECPF", "NMPROPONENTE", "DTNASCIMENTO", "CDDOCUMENTOCIVIL", "CDORGAOEMISSOR", "DTEXPEDICAO", "CDSEXO", "VLRENDAMENSAL", "CDESTADOCIVIL", "CDNACIONALIDADE", "NUMDDDRESIDENCIAL", "NUMTELEFONERESIDENCIAL", "NUMDDDCELULAR", "NUMTELEFONECELULAR", "DSORIGEMRECURSO", "DSEMAIL", "CDPPE", "CDPAIS", "NUMIDENTIFICACAO", "CDOCUPACAO", "NMEMPRESACLIENTE", "DSDOCUMENTOCIVIL", "NMORGAO", "LOGRADOURO", "TIPOENDERECO", "COMPLEMENTO", "BAIRRO", "CIDADE", "CEP", "UF", "NUMENDERECO", "NMPAISORIGEM", "FORMACOBRANCA", "BANCO", "AGENCIA", "DVAGENCIA", "CONTACORRENTE", "DVCONTACORRENTE", "DIAVENCIMENTO", "NUMBANCOSEG", "NMRESPFINANCEIRO", "CPFFINANCEIRO", "DSUF", "CODIGOFUNDOSEG", "NUMPROCESSOSUSEP", "CODIGOPRODUTOSEG", "CDSITUACAO", "DTATUALIZACAO", "NUMEROFUNCAO", "PIDEMPRESASECUNDARIA", "ANGARIADOR", "CODANGARIADOR", "EMPRESASECUNDARIA", "NUMUPSSECUNDARIA", "VLPORTABILIDADE", "DESCRICAOOCUPACAO", "PIDTIPOPRODUTO") AS 
  SELECT
    Pfi.Num_Doc_Seg                  AS cdPropostaSeguradora,
    doc.id_documento                 AS idDocumento,
    TO_CHAR(sysdate, 'dd/mm/yyyy')   AS dtGeracao,
    TO_CHAR(sysdate, 'hh24:mi:ss')   AS hrGeracao,
    TO_CHAR(sysdate, 'dd/mm/yyyy')   AS dtMovimento,
    doc.dt_cadastro                  AS dtProposta,
    doc.pid_empresa                  AS cdEscritorio,
    doc.pid_tipo_documento           AS cdTipoDocumento,
    fi.pid_fundo                     AS cdFundo,
    doc.pid_empresa                  AS cdEmpresa ,
    doc.pid_usuario                  AS cdUsuario,
    docprev.vl_contribuicao          AS vlContribuicao,
    docprev.vl_aporte_inicial        AS vlAporteInicial,
    docprev.num_idade_concessao      AS IDADECONCESSAOBENEFICIO,
    docprev.pid_regime_tributario    AS cdRegimeTributario,
    Pfi.Pc_Distribuicao              AS perecentualfundo,
    Fi.Cd_Tp_Carregamento            as carregamento,
    Fi.Nm_Plano                      as plano,
    emp.cd_parceria                  AS codigoParceria,
    emp.nm_empresa                   AS nomeEmpresa,
    emp.dg                           AS dgParceria,
    emp.nu_mumps                     AS cdMumps,
    cliente.num_cpf                  AS numCPF,
    cliente.pid_titularidade         AS cdTitularidadeCpf,
    cliente.nm_cliente               AS nmProponente,
    cliente.dt_nascimento            AS dtNascimento,
    cliente.pid_documento_civil      AS cdDocumentoCivil,
    cliente.pid_orgao_emissor        AS cdOrgaoEmissor,
    cliente.dt_expedicao             AS dtExpedicao,
    cliente.pid_sexo                 AS cdSexo,
    cliente.vl_renda_patrimonio      AS vlRendaMensal,
    cliente.pid_estado_civil         AS cdEstadoCivil,
    cliente.pid_pais_nacionalidade   AS cdNacionalidade,
    cliente.num_ddd_residencial      AS numDDDResidencial,
    cliente.num_telefone_residencial AS numTelefoneResidencial,
    cliente.num_ddd_celular          AS numDDDCelular,
    cliente.num_telefone_celular     AS numTelefoneCelular,
    cliente.ds_origem_recurso        AS dsOrigemRecurso,
    cliente.ds_email                 AS dsEmail,
    cliente.fl_ppe                   AS cdPPE,
    cliente.pid_pais_nacionalidade   AS cdPais,
    cliente.nuM_doc_identificacao    AS numIdentificacao,
    cliente.pid_ocupacao             AS cdOcupacao,
    cliente.ds_empresa               AS nmEmpresaCliente,
    doccivil.ds_documento            AS dsDocumentoCivil,
    orgaoemissor.nm_orgao            AS nmOrgao,
    endereco.ds_endereco             AS logradouro,
    endereco.pid_tipo_endereco       AS tipoEndereco,
    endereco.ds_complemento          AS complemento,
    endereco.ds_bairro               AS bairro,
    endereco.nm_cidade               AS cidade,
    endereco.nu_cep                  AS cep,
    endereco.pid_uf                  AS UF,
    endereco.nu_endereco             AS numEndereco,
    pais.nm_pais                     AS nmPaisOrigem,
    cobranca.pid_forma_pagamento     AS FormaCobranca,
    cobranca.pid_banco               AS banco,
    cobranca.num_agencia             AS agencia,
    cobranca.dv_agencia              AS dvAgencia,
    cobranca.num_conta_corrente      AS ContaCorrente,
    cobranca.dv_conta_corrente       AS dvContaCorrente,
    cobranca.pid_dia_vencimento      AS diaVencimento,
    banco.num_banco                  AS numBancoSeg,
    financeiro.nome                  AS nmRespFinanceiro,
    financeiro.num_cpf               AS cpfFinanceiro,
    uf.ds_uf                         AS dsUf,
    fundo.cd_fundo_seg               AS codigoFundoSeg,
    fi.nu_processo_susep             AS numProcessoSusep,
    produto.cd_produto_seg           AS codigoProdutoSeg,
    situacao.pid_situacao            AS cdSituacao,
    situacao.dt_atualizacao          AS dtAtualizacao,
    emp.num_funcao                      as numeroFuncao,
    emp.pid_empresa_secundaria as pidempresasecundaria,
    usuario.nm_usuario               as angariador,
    usuario.id                       as codangariador,
    (select num_funcao from tb_empresa where id= emp.pid_empresa_secundaria ) as empresaSecundaria,
    (select nu_Mumps from tb_empresa where id=emp.pid_empresa_secundaria  ) as nuMupsSecundaria,
    (SELECT SUM(portabilidade.vl_portabilidade)    from TB_portabilidade  portabilidade where
    DOCPREV.PID_DOCUMENTO_PREVIDENCIA = portabilidade.PID_DOCUMENTO_PREVIDENCIA ) AS vlPortabilidade,
    OCUPACAO.DS_OCUPACAO             AS descricaoOcupacao,
    produto.PID_TIPO_PRODUTO         AS pidTipoProduto
  FROM TB_DOCUMENTO DOC
  INNER JOIN TB_DOCUMENTO_PREVIDENCIA DOCPREV ON DOCPREV.PID_DOCUMENTO_PREVIDENCIA = DOC.ID_DOCUMENTO
  AND DOC.PID_TIPO_DOCUMENTO          = 1
  INNER JOIN TB_PROPOSTA_FUNDO_INVESTIMENTO PFI ON PFI.PID_DOCUMENTO_PREVIDENCIA = DOCPREV.PID_DOCUMENTO_PREVIDENCIA
  INNER JOIN TB_FUNDO_INVESTIMENTO FI ON FI.ID = PFI.PID_FUNDO_INVESTIMENTO
  INNER JOIN TB_EMPRESA EMP ON DOC.PID_EMPRESA = EMP.ID
  INNER JOIN TB_CLIENTE CLIENTE ON DOC.PID_CLIENTE = CLIENTE.ID
  INNER JOIN TB_PAIS pais ON CLIENTE.PID_PAIS_NACIONALIDADE = pais.cd_pais
  INNER JOIN TB_USUARIO usuario on usuario.id = Doc.Pid_Usuario
  LEFT JOIN TB_DOCUMENTO_COBRANCA cobranca ON DOCPREV.PID_DOCUMENTO_PREVIDENCIA = cobranca.PID_DOCUMENTO_PREVIDENCIA
  LEFT JOIN TB_BANCO banco ON cobranca.PID_BANCO = banco.cd_banco
  LEFT JOIN TB_RESPONSAVEL_FINANCEIRO financeiro ON CLIENTE.ID = financeiro.pid_cliente
  lEFT JOIN TB_OCUPACAO OCUPACAO ON OCUPACAO.CD_OCUPACAO = cliente.pid_ocupacao
  INNER JOIN TB_ENDERECO endereco ON CLIENTE.PID_ENDERECO = endereco.id
  INNER JOIN TB_UF uf ON endereco.pid_uf = uf.id
  INNER JOIN TB_FUNDO fundo ON FI.PID_FUNDO = fundo.id
  INNER JOIN Tb_Investimento investimento on investimento.id = fi.pid_investimento
  INNER JOIN TB_PRODUTO produto ON investimento.PID_PRODUTO = produto.id
  INNER JOIN TB_DOCUMENTO_CIVIL doccivil ON CLIENTE.PID_DOCUMENTO_CIVIL = doccivil.cd_documento
  INNER JOIN TB_ORGAO_EMISSOR orgaoemissor ON CLIENTE.PID_ORGAO_EMISSOR = orgaoemissor.id
  INNER JOIN TB_HISTORICO_DOCUMENTO situacao ON DOC.ID_DOCUMENTO        = SITUACAO.PID_DOCUMENTO
  AND situacao.pid_situacao =
    (SELECT
        MAX(sit2.pid_situacao)
      FROM
        tb_historico_documento sit2
      WHERE
        sit2.pid_documento = situacao.pid_documento)
  AND SITUACAO.PID_SITUACAO = 2;


  CREATE OR REPLACE FORCE VIEW "VW_RELCARTEIRA" ("DTCARGA", "DTARQUIVO", "ANGARIADOR", "PID_EMPRESA", "PARCERIA", "CANALVENDA", "ESTRUTURAVENDA", "PRODUTO", "SEGURADO", "CPF", "SEXO", "DTNASCIMENTO", "ENDERECO", "BAIRRO", "CIDADE", "CEP", "TELEFONE", "PROPOSTA", "CERTIFICADO", "NOMEFUNDO", "TIPOPLANO", "REGIMETRIBUTARIO", "TITULARIDADE", "SITUACAO", "TOTALCOTACLIENTE", "RESERVA", "DTCARENCIAPORTABILIDADEEXTERNA", "DTCARENCIARESGATE", "FORMAPAGAMENTO", "DTSITUACAO", "ASSISTENTE") AS 
  SELECT
          arquivo.dt_carga as dtCarga,
          arquivo.dt_arquivo as dtArquivo,
          usuario.nm_usuario AS angariador,
          doc.pid_empresa as pid_empresa,
          empresa.nm_empresa AS parceria,
          canal.nm_canal_venda AS canalVenda,
          estrutura.nm_estrutura_venda AS estruturaVenda,
          produto.nm_produto AS produto,
          cliente.nm_cliente AS segurado,
          cliente.num_cpf AS cpf,
          sexo.ds_sexo AS sexo,
          cliente.dt_Nascimento AS dtNascimento,
          endereco.ds_endereco AS endereco,
          endereco.ds_bairro AS bairro,
          endereco.nm_cidade AS cidade,
          endereco.nu_cep AS cep,
          (cliente.NUM_DDD_CELULAR ||'-'|| cliente.NUM_TELEFONE_CELULAR) AS telefone,
          cada.nu_proposta AS proposta,
          docprev.num_apolice AS certificado,
          fundo.nm_fundo AS nomeFundo,
          tipoproduto.ds_tipo_produto AS tipoPlano,
          tributario.ds_regime_tributario AS regimeTributario,
          titularidade.DS_TITULARIDADE AS titularidade,
          cada.ds_situacao AS situacao,
          cada.qt_cotas AS totalCotaCliente,
          cada.vl_saldo AS reserva,
          cada.DT_LIBERACAO_PORTABILIDADE AS dtCarenciaPortabilidadeExterna,
          cada.DT_LIGERACAO_RESGATE AS dtCarenciaResgate,
          pagamento.nm_forma_pagamento AS formaPagamento,
          cada.DT_SALDO AS dtSituacao,
          usuario.login_usuario AS assistente
     FROM
         tb_cliente cliente
      INNER JOIN
          tb_documento doc
              ON cliente.id = doc.pid_cliente
              AND doc.pid_tipo_documento = 1
      INNER JOIN
          tb_documento_previdencia docprev
              ON doc.id_documento = docprev.pid_documento_previdencia
      INNER JOIN
          tb_regime_tributario tributario
              ON tributario.id = docprev.pid_regime_tributario
      INNER JOIN
          tb_usuario usuario
              ON doc.pid_usuario = usuario.id
      LEFT JOIN
          TB_USUARIO usuario
              ON usuario.ID =  DOC.PID_USUARIO_DIGITADOR
      INNER JOIN
          TB_HISTORICO_DOCUMENTO hist_doc
              ON hist_doc.PID_DOCUMENTO = doc.ID_DOCUMENTO
              and hist_doc.ID = (
                  select
                      max(historicoDocumentoSituacao.ID)
              from
                  TB_HISTORICO_DOCUMENTO historicoDocumentoSituacao
              where
                  historicoDocumentoSituacao.PID_DOCUMENTO = doc.ID_DOCUMENTO
          )
      INNER JOIN
          tb_empresa empresa
              ON doc.pid_empresa = empresa.id
      LEFT JOIN
          tb_canal_venda canal
              ON doc.pid_canal_venda = canal.id
      INNER JOIN
     TB_PROPOSTA_FUNDO_INVESTIMENTO PFI
     ON pfi.PID_DOCUMENTO_PREVIDENCIA = docprev.PID_DOCUMENTO_PREVIDENCIA
      INNER JOIN
         TB_FUNDO_INVESTIMENTO FI
         ON FI.ID = PFI.PID_FUNDO_INVESTIMENTO
      INNER JOIN
         tb_investimento investimento
         ON investimento.id= fi.pid_investimento
      INNER JOIN
          tb_fundo fundo
              ON fi.pid_fundo = fundo.id
      INNER JOIN
          tb_produto produto
              ON investimento.pid_produto = produto.id
      INNER JOIN
          tb_sexo sexo
              ON cliente.pid_sexo = sexo.id
      INNER JOIN
          tb_endereco endereco
              ON cliente.pid_endereco = endereco.id
      INNER JOIN
          tb_tipo_produto tipoproduto
              ON produto.pid_tipo_produto = tipoproduto.cd_tipo_produto
      INNER JOIN
          tb_titularidade titularidade
              ON cliente.pid_titularidade = titularidade.cd_titularidade
      INNER JOIN
          tb_estrutura_venda estrutura
              ON usuario.pid_estrutura_venda = estrutura.id
      LEFT JOIN
          tb_documento_cobranca cobranca
              ON docprev.pid_documento_previdencia = cobranca.id
      LEFT JOIN
          tb_forma_pagamento pagamento
              ON cobranca.pid_forma_pagamento = pagamento.id
      LEFT JOIN
          tb_arquivo_cada cada
              ON cada.nu_proposta = doc.num_doc_seg
      LEFT JOIN
          tb_arq_status_carga arquivo
              ON (
                  arquivo.id = cada.pid_arq_status
                  AND cada.id = (
                      SELECT
                          MAX(c.id)
                  FROM
                      tb_arq_status_carga b
                  JOIN
                      tb_arquivo_cada c
                          ON (
                              b.id = c.pid_arq_status
                          )
                  WHERE
                      b.id = c.pid_arq_status
                      AND cada.nu_proposta = c.nu_proposta
             )
         )
     WHERE
         1=1;


  CREATE OR REPLACE FORCE VIEW "VW_RELPORTABILIDADE" ("ID_DOCUMENTO", "ANGARIADOR", "PARCERIA", "CANALVENDA", "PID_CANAL_VENDA", "PID_SITUACAO", "PID_EMPRESA", "DS_STATUS", "NM_CLIENTE", "IDUSUARIO", "CD_TIPO_PRODUTO", "ESTRUTURAVENDA", "PID_ESTRUTURA_VENDA", "IDPORTSTATUS", "DT_MOVIMENTO", "PID_DOCUMENTO_PORTABILIDADE", "DT_ATUALIZACAO", "SEGURADO", "CPF", "SEXO", "DTNASCIMENTO", "REGIMETRIBUTARIO", "SITUACAO", "PORTABILIDADE", "SEGURADORACEDENTE", "FUNDODESTINO", "FUNDOCEDENTE", "TIPOPLANOCEDENTE", "CERTIFICADOCEDENTE", "VALOR", "MOTIVORECUSA", "ESTAGIO", "PROPOSTA", "DTSOLICITACAO", "QTDDIAS", "DTCONCLUSAO", "ASSISTENTE", "PRODUTO", "SITUACAOXPORT") AS 
  SELECT   portabilidade.PID_DOCUMENTO_PORTABILIDADE as id_documento,
         usuario.NM_USUARIO AS angariador,
         empresa.nm_empresa AS parceria,
         canal.nm_canal_venda AS canalVenda,
         doc.pid_canal_venda,
         hist_doc.PID_SITUACAO as PID_SITUACAO,
         doc.pid_empresa as pid_empresa,
         portstatus.DS_STATUS as DS_STATUS,
         cliente.NM_CLIENTE as NM_CLIENTE,
         usuario.ID as idUsuario,
         tipoproduto.CD_TIPO_PRODUTO as CD_TIPO_PRODUTO,
         estrutura.nm_estrutura_venda AS estruturaVenda,
         doc.PID_ESTRUTURA_VENDA as PID_ESTRUTURA_VENDA,
         portstatus.id as idPortStatus,
         portstatus.dt_movimento as dt_movimento,
         portabilidade.pid_documento_portabilidade as pid_documento_portabilidade,
         hist_doc.dt_atualizacao as dt_atualizacao,
         cliente.nm_cliente AS segurado,
         cliente.num_cpf AS cpf,
         sexo.ds_sexo AS sexo,
         cliente.dt_Nascimento AS dtNascimento,
         regime.ds_regime_tributario  AS regimeTributario,
         situacao.DS_SITUACAO AS situacao,
         doc.num_doc_seg AS portabilidade,
         seguradora.nm_seguradora AS seguradoraCedente,
         fundo.nu_cnpj AS fundoDestino,
         portabilidade.num_cnpj_fundo_ced AS fundoCedente,
         portabilidade.nm_plano_ced AS tipoPlanoCedente,
         portabilidade.num_certificado_ced AS certificadoCedente,
         portabilidade.vl_portabilidade AS valor,
         portstatus.ds_motivo AS motivoRecusa,
         portstatus.DS_ESTAGIO as estagio,
          pfi.num_doc_seg AS proposta,
         (SELECT max(hd.dt_atualizacao)
         FROM    tb_historico_documento hd
         where       hd.pid_situacao =3
             and doc.id_documento = hd.pid_documento) AS dtSolicitacao,
          TRUNC((SELECT  MIN(portstatus.dt_movimento)
                        FROM  TB_PORTABILIDADE_STATUS)
               ) -
          TRUNC((SELECT max(hd.dt_atualizacao)
                FROM  tb_historico_documento hd
                where
                 doc.id_documento = hd.pid_documento)) AS qtdDias,
        (SELECT  MIN (port.DT_MOVIMENTO) dt_inclusao
         FROM  tb_portabilidade_status port
         where   portabilidade.pid_documento_portabilidade = port.pid_portabilidade
            AND ds_status = 'ConcluÌdo' ) AS dtConclusao,
         usuario.login_usuario AS assistente,
         tipoproduto.ds_tipo_produto  as produto,
         portstatus.ds_status AS situacaoXport
     FROM
         tb_cliente cliente
     INNER JOIN  tb_documento doc           ON cliente.id = doc.pid_cliente            AND doc.pid_tipo_documento = 5
     INNER JOIN  tb_portabilidade portabilidade       ON doc.id_documento = portabilidade.pid_documento_portabilidade
     INNER JOIN   tb_seguradora seguradora             ON portabilidade.pid_seguradora_ced = seguradora.id
     INNER JOIN  tb_regime_tributario regime          ON portabilidade.pid_regime_tributario_ced = regime.id
     INNER JOIN  tb_empresa empresa                   ON doc.pid_empresa = empresa.id
     INNER JOIN  tb_sexo sexo              ON cliente.pid_sexo = sexo.id
     INNER JOIN  tb_tipo_produto tipoproduto          ON portabilidade.pid_tipo_produto = tipoproduto.cd_tipo_produto
     INNER JOIN  tb_usuario usuario            ON doc.pid_usuario = usuario.id
     INNER JOIN  tb_documento_previdencia docprev             ON portabilidade.pid_documento_previdencia = docprev.pid_documento_previdencia
     INNER JOIN   TB_PROPOSTA_FUNDO_INVESTIMENTO PFI    ON pfi.PID_DOCUMENTO_PREVIDENCIA = docprev.PID_DOCUMENTO_PREVIDENCIA
     INNER JOIN   TB_FUNDO_INVESTIMENTO FI    ON FI.ID = PFI.PID_FUNDO_INVESTIMENTO
     INNER JOIN   tb_fundo fundo             ON fi.pid_fundo = fundo.id
     LEFT JOIN   tb_usuario_canal_venda canalusuario            ON canalusuario.pid_usuario = usuario.id
     LEFT JOIN   tb_canal_venda canal            ON doc.pid_canal_venda = canal.id
     INNER JOIN  tb_estrutura_venda estrutura          ON usuario.pid_estrutura_venda = estrutura.id
     LEFT JOIN   tb_portabilidade_status portstatus             ON portabilidade.pid_documento_portabilidade = portstatus.pid_portabilidade
     LEFT JOIN   TB_USUARIO usuario2             ON usuario2.ID =  DOC.PID_USUARIO_DIGITADOR
     INNER JOIN  TB_HISTORICO_DOCUMENTO hist_doc             ON doc.id_documento = hist_doc.pid_documento
             AND hist_doc.pid_situacao = ( SELECT  MAX(sit2.pid_situacao)
                                                 FROM  tb_historico_documento sit2
                                                 WHERE  sit2.pid_documento = hist_doc.pid_documento )
     INNER JOIN TB_SITUACAO  situacao   ON situacao.id = hist_doc.PID_SITUACAO
     WHERE
         1=1
        AND  portstatus.id = ( select  max(id)
                               FROM   tb_portabilidade_status port
                               where  port.pid_portabilidade = portabilidade.pid_documento_portabilidade);



  CREATE OR REPLACE FORCE VIEW "VW_RELPROPOSTA" ("PID_CANAL_VENDA", "PID_SITUACAO", "IDHISTORICO", "PID_EMPRESA", "NM_CLIENTE", "IDUSUARIO", "CD_TIPO_PRODUTO", "DS_SITUACAO", "PID_ESTRUTURA_VENDA", "DT_ATUALIZACAO", "DT_CARGA", "ID_CARGA", "ANGARIADOR", "PARCERIA", "CANALVENDA", "ESTRUTURAVENDA", "PRODUTO", "SEGURADO", "CPF", "SEXO", "DTNASCIMENTO", "PROPOSTA", "CERTIFICADO", "NOMEFUNDO", "TIPOPLANO", "REGIMETRIBUTARIO", "TITULARIDADE", "FORMAPAGAMENTO", "PREMIOTOTAL", "VALORCONTRIBUICAOREGULAR", "PRIMEIROAPORTE", "ASSISTENTE", "DTSITUACAO", "SITUACAO") AS 
  SELECT
        doc.pid_canal_venda,
         hist_doc.PID_SITUACAO as PID_SITUACAO,
         hist_doc.id as idHistorico,
         doc.pid_empresa as pid_empresa,
         cliente.NM_CLIENTE as NM_CLIENTE,
         usuario.ID as idUsuario,
         tipoproduto.CD_TIPO_PRODUTO as CD_TIPO_PRODUTO,
         cada.DS_SITUACAO as DS_SITUACAO ,
         doc.PID_ESTRUTURA_VENDA as PID_ESTRUTURA_VENDA,
     hist_doc.dt_atualizacao as dt_atualizacao,
         arquivo.dt_carga as dt_carga,
          arquivo.id as id_carga,
         usuario.nm_usuario AS angariador,
         empresa.nm_empresa AS parceria,
         canal.nm_canal_venda AS canalVenda,
         estrutura.nm_estrutura_venda AS estruturaVenda,
         produto.nm_produto AS produto,
         cliente.nm_cliente AS segurado,
         cliente.num_cpf AS cpf,
         sexo.ds_sexo AS sexo,
         cliente.dt_Nascimento AS dtNascimento,
         pfi.num_doc_seg AS proposta,
         docprev.num_apolice AS certificado,
         fundo.nm_fundo AS nomeFundo,
         tipoproduto.ds_tipo_produto AS tipoPlano,
         tributario.ds_regime_tributario AS regimeTributario,
         titularidade.DS_TITULARIDADE AS titularidade,
         (select
             fc.NM_FORMA_PAGAMENTO
         from
             TB_DOCUMENTO_COBRANCA DC
         JOIN
             TB_FORMA_PAGAMENTO FC
             ON dc.PID_FORMA_PAGAMENTO = fc.ID
         where
             DC.PID_DOCUMENTO_PREVIDENCIA = doc.id_documento) as formaPagamento,
         NVL(docprev.VL_CONTRIBUICAO,
         0) + NVL(docprev.VL_APORTE_INICIAL,
         0) AS premioTotal,
         docprev.VL_CONTRIBUICAO AS valorContribuicaoRegular,
         docprev.VL_APORTE_INICIAL as primeiroAporte,
         usuario.login_usuario AS assistente,
         TO_DATE(cada.DT_SALDO,
         'YYYY-MM-DD')  AS dtSituacao,
         cada.ds_situacao AS situacao
     FROM
         tb_cliente cliente
     INNER JOIN
         tb_documento doc
             ON cliente.id = doc.pid_cliente
             AND doc.pid_tipo_documento = 1
     INNER JOIN
         tb_documento_previdencia docprev
             ON doc.id_documento = docprev.pid_documento_previdencia
     INNER JOIN
    TB_PROPOSTA_FUNDO_INVESTIMENTO PFI
    ON pfi.PID_DOCUMENTO_PREVIDENCIA = docprev.PID_DOCUMENTO_PREVIDENCIA
     INNER JOIN
        TB_FUNDO_INVESTIMENTO FI
        ON FI.ID = PFI.PID_FUNDO_INVESTIMENTO
     INNER JOIN
        tb_investimento investimento
        ON investimento.id= fi.pid_investimento
     INNER JOIN
        tb_produto produto
        ON produto.id = investimento.pid_produto
     INNER JOIN
        tb_regime_tributario tributario
        ON tributario.id = docprev.pid_regime_tributario
     INNER JOIN
        TB_USUARIO usuario
        ON usuario.ID =  DOC.PID_USUARIO
     INNER JOIN
        TB_HISTORICO_DOCUMENTO hist_doc
        ON hist_doc.PID_DOCUMENTO = doc.ID_DOCUMENTO
             and hist_doc.ID = (
                 select
                     max(historicoDocumentoSituacao.ID)
             from
                 TB_HISTORICO_DOCUMENTO historicoDocumentoSituacao
             where
                 historicoDocumentoSituacao.PID_DOCUMENTO = doc.ID_DOCUMENTO
         )
     INNER JOIN
         tb_empresa empresa
         ON doc.pid_empresa = empresa.id
     LEFT JOIN
         tb_canal_venda canal
           ON doc.pid_canal_venda = canal.id
     INNER JOIN
         tb_fundo fundo
         ON fi.pid_fundo = fundo.id
      INNER JOIN
         tb_sexo sexo
         ON cliente.pid_sexo = sexo.id
     INNER JOIN
         tb_endereco endereco
         ON cliente.pid_endereco = endereco.id
     INNER JOIN
         tb_tipo_produto tipoproduto
         ON produto.pid_tipo_produto = tipoproduto.cd_tipo_produto
     INNER JOIN
         tb_situacao situacao
         ON hist_doc.pid_situacao = situacao.id
     INNER JOIN
         tb_titularidade titularidade
         ON cliente.pid_titularidade = titularidade.cd_titularidade
     LEFT JOIN
         tb_estrutura_venda estrutura
         ON usuario.pid_estrutura_venda = estrutura.id
     LEFT JOIN
         tb_documento_cobranca cobranca
         ON docprev.pid_documento_previdencia = cobranca.id
     LEFT JOIN
         tb_forma_pagamento pagamento
         ON cobranca.pid_forma_pagamento = pagamento.id
     LEFT JOIN
         tb_arquivo_cada cada
         ON cada.nu_proposta = doc.num_doc_seg
     LEFT JOIN
         tb_arq_status_carga arquivo
         ON (
                 arquivo.id = cada.pid_arq_status
                 AND cada.id = (
                     SELECT
                         MAX(c.id)
                 FROM
                     tb_arq_status_carga b
                 JOIN
                     tb_arquivo_cada c
                         ON (
                             b.id = c.pid_arq_status
                         )
                 WHERE
                      b.id = c.pid_arq_status
                     AND cada.nu_proposta = c.nu_proposta
             )
         )
     WHERE
         1=1;


prompt "Fim do Script CreateViews"

spool off

exit
