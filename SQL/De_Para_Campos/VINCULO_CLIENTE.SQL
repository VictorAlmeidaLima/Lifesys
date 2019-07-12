/*Layout: Arquivo txt de largura fixa

Arquivo de Importação: VINCULO_CLIENTE
Descrição: Relacionamento entre posto de coleta e matriz, relacionamento entre clientes

Listagem de Campos:

Nome: CODIGO - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório -  - Identificação no Sistema de Atendimento. 
Nome: CLIENTE - Tipo: INTEGER - Tamanho: 4 -  -  
Nome: CLIENTE_VINCULADO - Tipo: INTEGER - Tamanho: 4 -  -  

Obs.: Os campos devem vir na ordem em que foram apresentados acima.
*/


SELECT 
PAR.CODPARC AS CODIGO,
PAR.CODPARC AS CLIENTE,
PAR.CODPARCMATRIZ AS CLIENTE_VINCULADO
FROM TGFPAR PAR 
