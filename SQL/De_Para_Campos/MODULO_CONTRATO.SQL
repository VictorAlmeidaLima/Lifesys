/*
MODULOS_CONTRATO

Layout: Arquivo txt de largura fixa

Arquivo de Importação: MODULOS_CONTRATO
Descrição: Listagem de módulos contratados (vinculo entre contrato e módulo)

Listagem de Campos:

CODPROD
Nome: COD_MODULO - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório -

COD_EXT
Nome: CLIENTE - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório -

AD_IDENTIFICACAO - TCSPSC
Está escrito em JS porem não bate com o calculo realizado no sistema de atendimento
Nome: COD_IDENTIFICACAO - Tipo: VARCHAR - Tamanho: 15 -  -

--branco
Nome: NUM_HD - Tipo: VARCHAR - Tamanho: 10 -  -

--Qtd. Prevista:
Nome: QUANTIDADE - Tipo: INTEGER - Tamanho: 4 -  -  --qtd modulos que o cliente contratou

--branco
Nome: MAC - Tipo: VARCHAR - Tamanho: 20 -  -

--Número de usuários:
Nome: QUANT_USUARIOS - Tipo: INTEGER - Tamanho: 4 -  -

Obs.: Os campos devem vir na ordem em que foram apresentados acima.
*/



SELECT
PSC.CODPROD AS COD_MODULO,
CON.CODPARC AS CLIENTE,
PSC.AD_IDENTIFICACAO AS COD_IDENTIFICACAO,
'NUM_HD' AS NUM_HD,
PSC.QTDEPREVISTA AS QUANTIDADE,
'MAC' AS MAC,
PSC.NUMUSUARIOS,


FROM TCSPSC PSC
INNER JOIN TCSCON CON ON PSC.NUMCONTRATO = CON.NUMCONTRATO