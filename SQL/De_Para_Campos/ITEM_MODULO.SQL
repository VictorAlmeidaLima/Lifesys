/*
ITEM_MODULO

Layout: Arquivo txt de largura fixa


COMPONENTES - CADASTRO DE SERVIÇO

Arquivo de Importação: ITEM_MODULO
Descrição: Informações complementares ao módulos, maquinas de interfaceamento.

--UTILIZAR A ABA COMPONENTES PARA CADASTRAR MÁQUINAS VINCULADAS 
A UM SERVIÇO

Listagem de Campos:

--ATENTAR A CADASTRAR NA ORDEM DO ATENDIMENTO
Nome: CODIGO - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório -   - Identificação no Sistema de Atendimento.
CODPROD
Nome: MODULO - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório -  
DESCR 
Nome: DESCRICAO - Tipo: VARCHAR - Tamanho: 50 -  -  

Obs.: Os campos devem vir na ordem em que foram apresentados acima.
*/

SELECT 
OCC.NUMCONTRATO AS CODIGO,
OCC.CODPROD AS MODULO,
OCC.DESCRICAO
FROM
TCSOCC OCC