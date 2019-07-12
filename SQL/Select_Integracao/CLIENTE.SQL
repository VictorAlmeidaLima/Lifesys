SELECT
--Ainda falta Alimentar esse campo com os códigos de acordo com a PK da tabela CLIENTE do Atendimento.
/*Nome: CODIGO - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório - */
PAR.AD_CODEXT AS CODIGO,
/*Nome: NOME - Tipo: VARCHAR - Tamanho: 80 -  -  */
PAR.NOMEPARC AS NOME,
/*Nome: RESPONSAVEL - Tipo: VARCHAR - Tamanho: 50 -  -  */
(SELECT NOMECONTATO FROM TGFCTT CTT WHERE CON.CODIMPLANT = CODCONTATO AND PAR.CODPARC = CTT.CODPARC) AS RESPONSAVEL,
/*Nome: CONTATO - Tipo: VARCHAR - Tamanho: 50 -  -*/
(SELECT NOMECONTATO FROM TGFCTT CTT WHERE CON.CODIMPLANT = CODCONTATO AND PAR.CODPARC = CTT.CODPARC) AS CONTATO,
/*Nome: ENDERECO - Tipo: VARCHAR - Tamanho: 50 -  -  */
ENDER.NOMEEND AS ENDERECO,
/*Nome: BAIRRO - Tipo: VARCHAR - Tamanho: 40 -  -  */
BAI.NOMEBAI AS BAIRRO,
/*Nome: CEP - Tipo: VARCHAR - Tamanho: 8 -  -  */
PAR.CEP,
/*Nome: CIDADE - Tipo: INTEGER - Tamanho: 4 -  -  */
CID.CODMUNFIS AS CIDADE,
/*Nome: CIDADEDESC - Tipo: VARCHAR - Tamanho: 40 -  -  */
CID.NOMECID AS CIDADEDESC,
/*Nome: INSCRICAO - Tipo: VARCHAR - Tamanho: 15 -  -  */
PAR.IDENTINSCESTAD AS INSCRICAO,
/*Nome: TIPOPESSOA - Tipo: VARCHAR - Tamanho: 10 -  - */
CASE WHEN PAR.TIPPESSOA = 'J' THEN 'JURIDICA' ELSE 'FISICA' END AS TIPPESSOA,
/*Nome: CNPJ - Tipo: VARCHAR - Tamanho: 14 -  - */
PAR.CGC_CPF,
/*Nome: EMAIL1 - Tipo: VARCHAR - Tamanho: 100 -  -*/
PAR.EMAIL AS EMAIL1,
/*Nome: EMAIL2 - Tipo: VARCHAR - Tamanho: 100 -  -*/
PAR.EMAIL AS EMAIL2,
/*Nome: HOSPITAL - Tipo: VARCHAR - Tamanho: 50 -  -*/
' ' AS HOSPITAL,
/*Nome: TIPOSERVICO - Tipo: VARCHAR - Tamanho: 15 -  -*/
' ' AS TIPSERVICO,
/*Nome: LOCALSERVICO - Tipo: VARCHAR - Tamanho: 50 -  - */
' ' AS LOCALSERVICO,
/*Nome: OBSERVACAO - Tipo: BLOB - Tamanho: 8 -  -  */
'' AS OBSERVACAO,
/*Nome: SITUACAO - Tipo: VARCHAR - Tamanho: 10 - Preenchimento Obrigatório - */
CASE WHEN PAR.ATIVO = 'S' THEN 'ATIVO' ELSE 'INATIVO' END AS SITUACAO,
/*Nome: RESPONSACOBR - Tipo: VARCHAR - Tamanho: 50 -  -*/
(SELECT NOMECONTATO FROM TGFCTT CTT WHERE CON.CODIMPLANT = CODCONTATO AND PAR.CODPARC = CTT.CODPARC) AS RESPONSACOBR,
/*Nome: ENDERECOCOBR - Tipo: VARCHAR - Tamanho: 50 -  - */
ENDER.NOMEEND AS ENDERECOCOBR,
/*Nome: BAIRROCOBR - Tipo: VARCHAR - Tamanho: 40 -  -*/
BAI.NOMEBAI AS BAIRROCOBR,
/*Nome: CEPCOBR - Tipo: VARCHAR - Tamanho: 8 -  -*/
PAR.CEP AS CEPCOBR,
/*Nome: CIDADECOBR - Tipo: VARCHAR - Tamanho: 40 -  -*/
CID.NOMECID AS CIDADECOBR,
/*Nome: EMAILCOBR - Tipo: VARCHAR - Tamanho: 100 -  -*/
PAR.EMAIL AS EMAILCOBR,
/*Nome: CONTATOCOBR - Tipo: VARCHAR - Tamanho: 50 -  -*/
(SELECT NOMECONTATO FROM TGFCTT CTT WHERE CON.CODIMPLANT = CODCONTATO AND PAR.CODPARC = CTT.CODPARC) AS CONTATOCOBR,
/*Nome: PESSOACOBR - Tipo: VARCHAR - Tamanho: 10 -  -*/
CASE WHEN PAR.TIPPESSOA = 'J' THEN 'JURIDICA' ELSE 'FISICA' END AS PESSOACOBR,
/*Nome: CNPJCOBR - Tipo: VARCHAR - Tamanho: 14 -  -*/
PAR.CGC_CPF AS CNPJCOBR,
/*Nome: INSCRICAOCOBR - Tipo: VARCHAR - Tamanho: 15 -  -*/
PAR.IDENTINSCESTAD AS INSCRICAOCOBR,
/*Nome: FORMACOBR - Tipo: VARCHAR - Tamanho: 12 -  -*/
(SELECT DESCRTIPTIT FROM TGFTIT TIT WHERE TIT.CODTIPTIT = CON.TIPOTITULO) AS FORMACOBR,
/*Nome: DIACOBRA - Tipo: VARCHAR - Tamanho: 2 -  -*/
CON.DIAPAG AS DIACOBRA,
/*Nome: VALORDESCONTO - Tipo: INTEGER - Tamanho: 4 -  -*/
'' AS VALORDESCONTO,
/*Nome: VALORCOBR - Tipo: INTEGER - Tamanho: 4 -  -*/
SANKHYA.GET_VLR_CONTRATO(CON.NUMCONTRATO) AS VALORCOBR,
/*Nome: NOTA - Tipo: VARCHAR - Tamanho: 3 -  - */
  '' AS NOTA,
/*Nome: FORMAPAGAMENTO - Tipo: VARCHAR - Tamanho: 12 -  - */
CASE
  WHEN CON.TIPO = 'A' THEN 'ANUAL'
  WHEN CON.TIPO = 'M' THEN 'MENSAL'
  WHEN CON.TIPO = 'S' THEN 'SEMESTRAL'
  WHEN CON.TIPO = 'T' THEN 'TRIMESTRAL'
  WHEN CON.TIPO = 'B' THEN 'BIMESTRAL'
  WHEN CON.TIPO = 'L' THEN 'LIVRE'
  END AS FORMAPAGAMENTO,
/*Nome: FATURAMES - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório -
Obs.: Ovalor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) */
  CASE WHEN CON.TIPPAG = 'C' THEN 'T' ELSE 'F' END AS FATURAMES,
 /*Nome: CODCIDADECOBR - Tipo: INTEGER - Tamanho: 4 -  -  */
CID.CODMUNFIS AS  CODCIDADECOBR,
  /*Nome: NOMEREDUZIDO - Tipo: VARCHAR - Tamanho: 50 -  -  */
  PAR.NOMEPARC AS NOMEREDUZIDO,
  /*Nome: FLAGCOBRANCA - Tipo: VARCHAR - Tamanho: 11 -  - */
  CASE WHEN AD_PROTESTO = 'S' THEN 'SIMPLES' ELSE 'PROTESTO' END AS FLAGCOBRANCA,
  /*Nome: OBSERVACAO1 - Tipo: BLOB - Tamanho: 8 -  - */
  '' AS OBSERVACAO1,
  /*Nome: NOMEFTP - Tipo: VARCHAR - Tamanho: 80 -  -*/
  PAR.RAZAOSOCIAL AS NOMEFTP,
  /*Nome: IMPOSTO - Tipo: CHAR - Tamanho: 1 -  -
  Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) */
  '' AS IMPOSTO,
  /*Nome: CLIENTE - Tipo: CHAR - Tamanho: 1 -  -
   Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False)*/
  'T' AS CLIENTE,
  /*Nome: SISTEMA - Tipo: VARCHAR - Tamanho: 12 -  -*/
  (SELECT IDENTIFICACAO FROM TCSPRJ PROJ WHERE CON.CODPROJ = PROJ.CODPROJ) AS SISTEMA,
  /*Nome: PRIORIDADE - Tipo: VARCHAR - Tamanho: 25 -  -*/
  '' AS PRIORIDADE,
  /*Nome: TIPO_DESCR - Tipo: VARCHAR - Tamanho: 15 -  -*/
  'PADRÃO' AS TIPO_DESCR,
  /*Nome: DESCRICAO_NOTA - Tipo: VARCHAR - Tamanho: 255 -  -*/
  '' AS DESCRICAO_NOTA,
  /*Nome: ATENDIDOPOR - Tipo: INTEGER - Tamanho: 4 -  - */
  1 AS ATENDIDOPOR,
  /*Nome: TIPO_ATUALIZACAO - Tipo: VARCHAR - Tamanho: 50 -  -*/
  '' AS TIPO_ATUALIZACAO,
  /*Nome: EMPRESA - Tipo: INTEGER - Tamanho: 4 -  -*/
  2 AS EMPRESA,
  /*Nome: INADIMPLENTE - Tipo: VARCHAR - Tamanho: 1 -  -
  Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False)  */
  'F' AS INADIMPLENTE,
  /*Nome: PERIODO_RESET - Tipo: INTEGER - Tamanho: 4 -  -  */
  3 AS PERIODO_RESET,
  /*Nome: CONTATO_INADIMPLENCIA - Tipo: CHAR - Tamanho: 1 -  -
  Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) */
  'F' AS CONTATO_INADIMPLENCIA,
  /*Nome: NOME_FANTASIA - Tipo: VARCHAR - Tamanho: 80 -  -*/
  PAR.NOMEPARC AS NOME_FANTASIA,
  /*Nome: NUM_HD - Tipo: VARCHAR - Tamanho: 30 -  -*/
  '' AS NUM_HD,
  /*Nome: COD_UNIDADE - Tipo: INTEGER - Tamanho: 4 -  -*/
  CON.AMBIENTE AS COD_UNIDADE,
  /*Nome: AUTORIZA_REMOTO - Tipo: CHAR - Tamanho: 1 -  -
  Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) */
  '' AS AUTORIZA_REMOTO,
/*Nome: NOME_ENV - Tipo: VARCHAR - Tamanho: 50 -  -*/
  PAR.NOMEPARC AS NOME_ENV,
  /*Nome: ENDERECO_ENV - Tipo: VARCHAR - Tamanho: 50 -  -*/
  ENDER.NOMEEND AS ENDERECO_ENV,
  /*Nome: BAIRRO_ENV - Tipo: VARCHAR - Tamanho: 30 -  -*/
  BAI.NOMEBAI AS BAIRRO_ENV,
  /*Nome: CIDADE_ENV - Tipo: INTEGER - Tamanho: 4 -  -*/
  CID.CODMUNFIS AS CIDADE_ENV,
  /*Nome: CEP_ENV - Tipo: VARCHAR - Tamanho: 10 -  -*/
  PAR.CEP AS CEP_ENV,
  /*Nome: AUTORIZACAO_NOTA - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório -
  Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) */
  'F' AS AUTORIZACAO_NOTA,
  /*Nome: DATA_AUTORIZA_REMOTO - Tipo: DATE - Tamanho: 4 -  -*/
  '' AS DATA_AUTORIZA_REMOTO,
  /*Nome: COBRAR_ENVIO_BOLETO - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório -
   Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False)*/
  'F' AS COBRAR_ENVIO_BOLETO,
  /*Nome: VALOR_ENVIO_NOTA - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório -
   Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) */
  'F' AS VALOR_ENVIO_NOTA,
  /*Nome: FORMA_ACESSO - Tipo: VARCHAR - Tamanho: 20 -  -*/
  '' AS FORMA_ACESSO,
  /*Nome: FORMA_ACESSO_OUTROS - Tipo: VARCHAR - Tamanho: 100 -  -*/
  '' AS FORMA_ACESSO_OUTROS,
  /*Nome: RETEM_ISS - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório -
   Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) */
  CASE WHEN PAR.RETEMISS = 'S' THEN 'T' ELSE 'F' END AS RETEM_ISS,
  /*Nome: VALOR_ISS - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório - */
  /*Tenho situações como parceiro(2) - cidade BH(598) que será enviado como null por nao ter cadastro preenchido.
  Para isso será criado um campo no cadastro de cidades apenas com intuito de enviar informações que não sejam nulas
  visto que esse campo é obrigatorio no banco de destino (Atendimento)*/
  CID.AD_PERCISS AS VALOR_ISS,
  /*Nome: ACEITA_MALA_DIRETA - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório -
  Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) */
  'T' AS ACEITA_MALA_DIRETA,
  /*Nome: USA_RESET_NET - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório -
   Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) */
  'F' AS USA_RESET_NET,
  /*Nome: VERSAO_ATUALIZACAO - Tipo: VARCHAR - Tamanho: 10 -  -*/
  '' AS VERSAO_ATUALIZACAO,
  /*Nome: TIPO_CONTRATO - Tipo: VARCHAR - Tamanho: 1 -  -*/
  '' AS TIPO_CONTRATO,
  /*Nome: MAQUINA_TESTE - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório -
   Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) */
  CASE WHEN CON.AD_MAQUINATESTE = 'S' THEN 'T' ELSE 'F' END AS MAQUINA_TESTE,
  /*Nome: DATA_INATIVO - Tipo: DATE - Tamanho: 4 -  -*/
  PAR.AD_DHINATIVO AS DATA_INATIVO,
  /*Nome: VALIDADO - Tipo: CHAR - Tamanho: 1 -  -
   Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) */
  'T' AS VALIDADO,
  /*Nome: USUARIO_VALIDACAO - Tipo: VARCHAR - Tamanho: 50 -  -*/
  'INTEGR_SANKHHYA' AS USUARIO_VALIDACAO,
  /*Nome: DATA_ATUALIZACAO - Tipo: DATE - Tamanho: 4 -  -*/
  '' AS DATA_ATUALIZACAO,
  /*Nome: RETEM_PIS_COFINS_CSLL - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório -
   Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) */
  CASE WHEN (SELECT CALCULAR FROM TGFIMA IMA WHERE PAR.CODPARC = IMA.CODIGO AND TIPO = 'P') = 'S' THEN 'T' ELSE 'F' END AS RETEM_PIS_COFINS_CSLL,
  /*Nome: USA_MINHA_CONTA - Tipo: CHAR - Tamanho: 1 -  -
   Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) */
  'T' AS USA_MINHA_CONTA,
  /*Nome: RETEM_IMPOSTO_RENDA - Tipo: CHAR - Tamanho: 1 -  -
   Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) */
  CASE WHEN PAR.RETEMINSS = 'S' THEN 'T' ELSE 'F' END AS RETEM_IMPOSTO_RENDA

FROM TGFPAR PAR
INNER JOIN TSICID CID ON PAR.CODCID = CID.CODCID
INNER JOIN TSIEND ENDER ON PAR.CODEND = ENDER.CODEND
INNER JOIN TSIBAI BAI ON PAR.CODBAI = BAI.CODBAI
LEFT JOIN TCSCON CON ON CON.CODPARC = PAR.CODPARC AND CON.AD_UNIDADE = 'M'



WHERE PAR.CODPARC = 1
AND PAR.CLIENTE ='S';
