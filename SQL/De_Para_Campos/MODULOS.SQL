/*
MODULOS 
Cadastro de Serviços.


Layout: Arquivo txt de largura fixa

Arquivo de Importação: MODULOS
Descrição: Listagem de Módulos Cadastrados (produtos disponiveis para venda)

Listagem de Campos:

CODPROD
Nome: CODIGO - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório -  - Identificação no Sistema de Atendimento. 

DESCR
Nome: DESCRICAO - Tipo: VARCHAR - Tamanho: 20 -  -  

DESCR
Nome: DETALHE - Tipo: VARCHAR - Tamanho: 50 -  -  

--NOVO CAMPO NO SERVIÇO - FAZER UPDATE - VAI SER PASSADA UMA LISTA COM OS
CODIGOS
Nome: ID_APLICACAO - Tipo: VARCHAR - Tamanho: 10 -  -  

CODPROJ --
Nome: SISTEMA - Tipo: VARCHAR - Tamanho: 12 -  -  

--CRIAR CAMPO NO CADASTRO DE SERVIÇO  - UPDATE MARCADO PARA TODOS
Nome: PERMITE_TS - Tipo: CHAR - Tamanho: 1 -  - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

Obs.: Os campos devem vir na ordem em que foram apresentados acima.

*/


SELECT 
PRO.CODPROD AS CODIGO,
PRO.DESCRPROD AS DESCRICAO,
PRO.DESCRPROD AS DETALHE,
'ID_APLICACAO' AS ID_APLICACAO,
'SANKHYA' AS SISTEMA,
'PERMITE_TS' AS PERMITE_TS
FROM
TGFPRO PRO
WHERE USOPROD = 'S'