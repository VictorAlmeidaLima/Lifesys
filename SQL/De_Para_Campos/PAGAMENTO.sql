/*
Layout: Arquivo txt de largura fixa

Arquivo de Importação: PAGAMENTO
Descrição: Informações de pagamento Pagos e Abertos

Listagem de Campos:

CRIAR ARQUIVO DE PAGAMENTO_EXC POIS NO SISTEMA DE ATENDIMENTO
ELES IRAM SETAR A SITUAÇÃO COMO CANCELADO.

APENAS RECEITAS.


--CRIAR CÓDIGO EXTERNO
Nome: CODIGO - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório -   - Identificação no Sistema de Atendimento.

COD EXTERNO CLIENTE 
Nome: CLIENTE - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório -  



Projeto: MOV FIN
quando for Nefrodata = ACD
Nome: SISTEMA - Tipo: VARCHAR - Tamanho: 15 - Preenchimento Obrigatório -

 Dtvenc
Nome: DATAVENC - Tipo: DATE - Tamanho: 4 - Preenchimento Obrigatório -

-- verificar mais tarde - com o fernando
Nome: NUMEROBOLETA - Tipo: VARCHAR - Tamanho: 15 -  -

DHBAIXA
Nome: DATAPAGTO - Tipo: DATE - Tamanho: 4 -  -

VLRDESDOB
Nome: VALOR - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório -

VLRBAIXA
Nome: VALORPAGO - Tipo: INTEGER - Tamanho: 4 -  -

-- a verificar**********
Nome: SITUACAO - Tipo: VARCHAR - Tamanho: 10 -  -

Vlr Multa:
Nome: VALOR_MULTA - Tipo: INTEGER - Tamanho: 4 -  -

Vlr Juros:
Nome: VALOR_JUROS - Tipo: INTEGER - Tamanho: 4 -  -

Valor Líquido:
Nome: VALOR_PAGAR - Tipo: INTEGER - Tamanho: 4 -  -

usuario que lançou o registro financeiro
Nome: USUARIO - Tipo: VARCHAR - Tamanho: 10 -  -

--branco null
Nome: FORMA_PGTO - Tipo: VARCHAR - Tamanho: 2 -  -

Nro Nota:
Nome: NUM_NOTA - Tipo: INTEGER - Tamanho: 4 -  -

Tipo de Título: (Descrição)
Nome: TIPO_COBRANCA - Tipo: VARCHAR - Tamanho: 10 -  -

--branco
Nome: REFERENCIA_NOTA - Tipo: VARCHAR - Tamanho: 20 -  -

Dt. Negociação:
Nome: DATA_GERACAO - Tipo: DATE - Tamanho: 4 -  -

VERICAR VINCULO NA TGFCAB SE A NOTA ESTA CANCELADA OU NÃO
Nome: SITUACAO_NOTA - Tipo: VARCHAR - Tamanho: 10 -  -

TGFCAB VINCULO DA SERIE
Nome: SERIE_NOTA - Tipo: VARCHAR - Tamanho: 1 -  -

NULL
Nome: CODIGO_INTERNET - Tipo: VARCHAR - Tamanho: 30 -  -
--BRANCO
Nome: DATA_IMPRESSAO - Tipo: DATE - Tamanho: 4 -  -
--BRANCO
Nome: HORA_IMPRESSAO - Tipo: TIME - Tamanho: 4 -  -

--OBSERVAÇÃO DA NOTA
Nome: DESCRICAO_NOTA - Tipo: VARCHAR - Tamanho: 255 -  -

--BRANCO
Nome: IMPRESSO - Tipo: VARCHAR - Tamanho: 1 -  -

--BRANCO 0000
Nome: ALIQUOTA_ISS - Tipo: INTEGER - Tamanho: 4 -  -
Nome: IRRF - Tipo: INTEGER - Tamanho: 4 -  -
Nome: PIS_COFINS - Tipo: INTEGER - Tamanho: 4 -  -
Nome: BASE_CALCULO - Tipo: INTEGER - Tamanho: 4 -  -
---->

VINCULO ENTRE UM REGISTRO FINANCEIRO E OUTRO QUE RENEGOCIADO / REGERADO
SE FOR DIFERENTE SIGNIFCA QUE FOI REGENERADO IGUAL = PRIMEIRA VEZ
--BRANCO
Nome: COD_AGRUPAMENTO - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório -

VALOR LIQUIDO DA NOTA - TGCAB
Nome: VALOR_NOTA - Tipo: INTEGER - Tamanho: 4 -  -

--BRANCO
Nome: OBS_NOTA - Tipo: VARCHAR - Tamanho: 1000 -  -

-- VAZIO
Nome: REGERADO - Tipo: VARCHAR - Tamanho: 1 -  -

DTVENC
Nome: DATAVENC_ORIG - Tipo: DATE - Tamanho: 4 -  -

Nosso Número:
Nome: NOSSO_NUMERO - Tipo: VARCHAR - Tamanho: 20 -  -

VLRDESDOB
Nome: VALOR_GERADO - Tipo: INTEGER - Tamanho: 4 -  -

--BRANCO
Nome: PIS - Tipo: INTEGER - Tamanho: 4 -  -
Nome: COFINS - Tipo: INTEGER - Tamanho: 4 -  -
Nome: CSLL - Tipo: INTEGER - Tamanho: 4 -  -
---
F FIXO
Nome: VENC_ALTERADO - Tipo: CHAR - Tamanho: 1 -  - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False)

Obs.: Os campos devem vir na ordem em que foram apresentados acima.

*/


SELECT

FIN.NUFIN AS CODIGO,
PAR.AD_CODEXT AS CLIENTE,
(SELECT IDENTIFICACAO FROM TCSPRJ PROJ WHERE FIN.CODPROJ = PROJ.CODPROJ) AS SISTEMA,
FIN.DTVENC,
FIN.NUMDUPL AS NUMEROBOLETA,
FIN.DHBAIXA AS DATA_PAGAMENTO,
FIN.VLRDESDOB AS VALOR,
FIN.VLRBAIXA AS VALORPAGO,
CASE WHEN DHBAIXA IS NULL THEN 'Aberto' ELSE 'Pago' END AS SITUACAO,
FIN.VLRMULTA AS VALOR_MULTA,
FIN.VLRJURO AS VALOR_JUROS,
FIN.VLRDESDOB AS VALOR_PAGAR,
USU.NOMEUSU AS USUARIO,
' ' AS FORMA_PGTO,
FIN.NUMNOTA AS NUM_NOTA,
(SELECT DESCRTIPTIT FROM TGFTIT TIT WHERE TIT.CODTIPTIT = FIN.CODTIPTIT) AS TIPO_COBRANCA,
' ' AS REFERENCIA_NOTA,
FIN.DTALTER AS DATA_GERACAO,
CASE WHEN CAB.STATUSNFSE = 'A' THEN 'Normal' ELSE '' END AS SITUACAO_NOTA,
CAB.SERIENOTA AS SERIE_NOTA,
' ' AS CODIGO_INTERNET,
' ' AS DATA_IMPRESSAO,
' ' AS HORA_IMPRESSAO,
CAB.OBSERVACAO AS DESCRICAO_NOTA,
' ' AS IMPRESSO,
' ' AS ALIQISS,
' ' AS IRRF,
' ' AS PIS_COFINS,
' ' AS BASE_CALCULO,
FIN.NUFIN AS COD_AGRUPAMENTO,
CAB.VLRNOTA AS VALOR_NOTA,
CAB.OBSERVACAO AS OBS_NOTA,
' ' AS REGERADO,
FIN.DTVENC AS DATAVENC_ORIG,
FIN.NOSSONUM AS NOSSO_NUMERO,
FIN.VLRDESDOB AS VALOR_GERADO,
' ' AS PIS,
' ' AS COFINS,
' ' AS CSLL,
'F' AS VENC_ALTERADO


FROM TGFFIN FIN
LEFT JOIN TSIUSU USU ON USU.CODUSU = FIN.CODUSU
INNER JOIN TGFPAR PAR ON PAR.CODPARC = FIN.CODPARC
LEFT JOIN TGFCAB CAB ON FIN.NUNOTA = CAB.NUNOTA
WHERE RECDESP = 1
