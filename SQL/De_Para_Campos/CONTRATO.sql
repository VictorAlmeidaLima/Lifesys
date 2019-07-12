/*
CONTRATO

Layout: Arquivo txt de largura fixa

Arquivo de Importação: CONTRATO
Descrição: Listagem de Contrato de Clientes

Listagem de Campos:



COD_EXT
Nome: CLIENTE - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório -  - Identificação no Sistema de Atendimento.

CODPROJ
Nome: SISTEMA - Tipo: VARCHAR - Tamanho: 12 - Preenchimento Obrigatório -

RESP CONTRATO 
Nome: RESPONSAVEL - Tipo: VARCHAR - Tamanho: 50 -  -  

Nro. Contrato:
Nome: NUMERO - Tipo: VARCHAR - Tamanho: 10 -  -  

Responsável Técnico da Contratante:
Nome: ASSINADO - Tipo: VARCHAR - Tamanho: 50 -  -  

Data do contrato:
Nome: DATASS - Tipo: DATE - Tamanho: 4 -  -  

Data do contrato:
Nome: DATAADESAO - Tipo: DATE - Tamanho: 4 -  -  

Valor Adesão:
Nome: VALORADESAO - Tipo: INTEGER - Tamanho: 4 -  -  

VALOR CONTRATO - RODAPÉ
Nome: VALORMENSA - Tipo: INTEGER - Tamanho: 4 -  -  

-- QUANDO FOR INATIVO - TRIGER DE DATA
Nome: DATA_ENCERRAMENTO - Tipo: DATE - Tamanho: 4 -  -  

---Responsável Técnico da Contratante: (CONTATO)
Nome: CPF_RESPONSAVEL - Tipo: VARCHAR - Tamanho: 12 -  -  
Nome: CPF_ASSINADO - Tipo: VARCHAR - Tamanho: 12 -  -  

Moeda: CONCATENAR Moeda alternativa para reajuste:
QUANDO FOR DIFERENTE
Nome: INDICE_REAJUSTE - Tipo: VARCHAR - Tamanho: 20 -  -  

AD_TESTEMUNHA
Nome: TESTEMUNHA - Tipo: VARCHAR - Tamanho: 50 -  -  

AD_CPFTESTEMUNHA
Nome: CPF_TESTEMUNHA - Tipo: VARCHAR - Tamanho: 20 -  -  

APENAS NA INCLUSÃO DE NOVOS CONTRATOS - PRIMEIRO FATUR
Nome: INICIO_PAGAMENTO - Tipo: DATE - Tamanho: 4 -  -  

Banco de Dados:
Nome: BANCO_DADOS - Tipo: VARCHAR - Tamanho: 30 -  -  

Obs.: Os campos devem vir na ordem em que foram apresentados acima.

*/

SELECT 
CON.CODPARC AS CLIENTE,
'SANKHYA' AS SISTEMA,
CTT.NOMECONTATO AS RESPONSAVEL,
CON.NUMCONTRATO AS NUMERO,
'ASSINADO' AS ASSINADO,
'DATASS' AS DATASS,
CON.DTCONTRATO,
ISNULL(CON.AD_VRADESAO,0) AS VALORADESAO,
'VALORMENSA' AS VALORMENSA,
DTTERMINO AS DATA_ENCERRAMENTO,
'CPF_RESPONSAVEL' AS CPF_RESPONSAVEL,
'CPF_ASSINADO' AS CPF_ASSINADO,
COT.COTACAO AS INDICE_REAJUSTE,
'TESTEMUNHA' AS TESTEMUNHA,
'CPF_TESTEMUNHA' AS CPF_TESTEMUNHA,
'INICIO_PAGAMENTO' AS INICIO_PAGAMENTO,
AD_TIPBANCO AS BANCO_DADOS


FROM TCSCON CON
LEFT JOIN TGFCTT CTT ON CON.CODPARC = CTT.CODPARC AND  CON.CODIMPLANT = CTT.CODCONTATO 
LEFT JOIN TSIMOE MOE ON CON.CODMOEDA = CON.CODMOEDA
INNER JOIN TSICOT COT ON MOE.CODMOEDA = COT.CODMOEDA