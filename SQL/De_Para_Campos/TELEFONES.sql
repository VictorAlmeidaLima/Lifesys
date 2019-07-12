/*
O Arquivo TELEFONE, refere aos telefones de contato do cliente

Layout: Arquivo txt de largura fixa

Arquivo de Importação: TELEFONES
Descrição: Listagem de telefones de Clientes Cadastrados

****TELEFONE, DROP NA TABELA E SERÁ INCLUIDO NOVOS REGISTROS  PARA O ID DO TELEFONE

Listagem de Campos:

COD_EXT
Nome: CLIENTE - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório -  

*****
Nome: ID - Tipo: SMALLINT - Tamanho: 2 - Preenchimento Obrigatório -  - Identificação no Sistema de Atendimento. 

ISNULL(TELEFONE,CELULAR)
TELEFONE|CELULAR
Nome: TELEFONE - Tipo: VARCHAR - Tamanho: 15 - Preenchimento Obrigatório -  

Cargo:
Nome: LOCAL - Tipo: VARCHAR - Tamanho: 20 -  -  

Ramal:
Nome: RAMAL - Tipo: INTEGER - Tamanho: 4 -  -  

Nome Contato:
Nome: CONTATO - Tipo: VARCHAR - Tamanho: 50 -  -  

DHALTER
Nome: DATA_ATUALIZACAO - Tipo: DATE - Tamanho: 4 -  -  

Obs.: Os campos devem vir na ordem em que foram apresentados acima.
*/

SELECT 
PAR.CODPARC AS CLIENTE,
CTT.CODCONTATO AS ID,
CTT.TELEFONE,
--LOCAL,
CTT.RAMAL,
CTT.NOMECONTATO
--DATA_ATUALIZACAO

FROM TGFPAR PAR
LEFT JOIN TGFCTT CTT ON PAR.CODPARC = CTT.CODPARC
ORDER BY PAR.CODPARC,CTT.CODCONTATO