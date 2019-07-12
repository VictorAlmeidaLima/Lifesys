/*
LAYOUT CIDADES

Listagem de Campos:

Nome: CODIGO - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório -  Identificação no Sistema de Atendimento.
Nome: NOME - Tipo: VARCHAR - Tamanho: 50 -  -  
Nome: UF - Tipo: CHAR - Tamanho: 2 -  -  
Nome: COD_IBGE - Tipo: VARCHAR - Tamanho: 10 -  -  

Obs.: Os campos devem vir na ordem em que foram apresentados acima.*/



SELECT 
CODCID,
RTRIM(NOMECID) AS NOMECID,
RTRIM(UFS.UF) AS UF,
CID.CODMUNFIS AS CODIBGE

FROM TSICID CID
INNER JOIN TSIUFS UFS ON CID.UF = UFS.CODUF
