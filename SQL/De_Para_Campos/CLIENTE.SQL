/*
Listagem de Campos:

Nome: CODIGO - Tipo: INTEGER - Tamanho: 4 - Preenchimento Obrigatório - Identificação no Sistema de Atendimento. (codext)
Nome: NOME - Tipo: VARCHAR - Tamanho: 80 -  -  razao social

--PEGAR DO CONTRATO
Nome: RESPONSAVEL - Tipo: VARCHAR - Tamanho: 50 -  -  

Nome: CONTATO - Tipo: VARCHAR - Tamanho: 50 -  -  RESPONSAVEL

Nome: ENDERECO - Tipo: VARCHAR - Tamanho: 50 -  -   
Nome: BAIRRO - Tipo: VARCHAR - Tamanho: 40 -  -  
Nome: CEP - Tipo: VARCHAR - Tamanho: 8 -  -  
Nome: CIDADE - Tipo: INTEGER - Tamanho: 4 -  -  
Nome: CIDADEDESC - Tipo: VARCHAR - Tamanho: 40 -  -  

Nome: INSCRICAO - Tipo: VARCHAR - Tamanho: 15 -  -  
Nome: TIPOPESSOA - Tipo: VARCHAR - Tamanho: 10 -  -  
Nome: CNPJ - Tipo: VARCHAR - Tamanho: 14 -  -  
Nome: EMAIL1 - Tipo: VARCHAR - Tamanho: 100 -  -  
Nome: EMAIL2 - Tipo: VARCHAR - Tamanho: 100 -  -  

Nome: HOSPITAL - Tipo: VARCHAR - Tamanho: 50 -  -   BRANCO


-->BRANCO
Nome: TIPOSERVICO - Tipo: VARCHAR - Tamanho: 15 -  -  
Nome: LOCALSERVICO - Tipo: VARCHAR - Tamanho: 50 -  -  
Nome: OBSERVACAO - Tipo: BLOB - Tamanho: 8 -  -  
-->

Nome: SITUACAO - Tipo: VARCHAR - Tamanho: 10 - Preenchimento Obrigatório -  


------> REPETIR A INFORMAÇÃO
Nome: RESPONSACOBR - Tipo: VARCHAR - Tamanho: 50 -  -  
Nome: ENDERECOCOBR - Tipo: VARCHAR - Tamanho: 50 -  -  
Nome: BAIRROCOBR - Tipo: VARCHAR - Tamanho: 40 -  -  
Nome: CEPCOBR - Tipo: VARCHAR - Tamanho: 8 -  -  

Nome: CIDADECOBR - Tipo: VARCHAR - Tamanho: 40 -  -  
Nome: EMAILCOBR - Tipo: VARCHAR - Tamanho: 100 -  -  
Nome: CONTATOCOBR - Tipo: VARCHAR - Tamanho: 50 -  -  
Nome: PESSOACOBR - Tipo: VARCHAR - Tamanho: 10 -  -  
Nome: CNPJCOBR - Tipo: VARCHAR - Tamanho: 14 -  -  
Nome: INSCRICAOCOBR - Tipo: VARCHAR - Tamanho: 15 -  -  
Nome: FORMACOBR - Tipo: VARCHAR - Tamanho: 12 -  -  TCSCON.TIPOTITULO(DESCRICAO)
Nome: CODCIDADECOBR - Tipo: INTEGER - Tamanho: 4 -  -  
----->

tcscon - -> cliente sendo Unidade = Matriz
Nome: DIACOBRA - Tipo: VARCHAR - Tamanho: 2 -  -  TCSCON.DIAPAG
Nome: FORMAPAGAMENTO - Tipo: VARCHAR - Tamanho: 12 -  - TCSCON (Periodicidade do Faturamento)
-->

--> BRANCO
Nome: VALORDESCONTO - Tipo: INTEGER - Tamanho: 4 -  -  
-->

--VALOR MENSAL DO CONTRATO (MATRIZ)
Nome: VALORCOBR - Tipo: INTEGER - Tamanho: 4 -  -  

-->branco
Nome: NOTA - Tipo: VARCHAR - Tamanho: 3 -  -  

(booleam) TCSCON - Tipo de Pagamento
Qunado for Mes corrente = T
Nome: FATURAMES - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 



Nome: NOMEREDUZIDO - Tipo: VARCHAR - Tamanho: 50 -  -  Nome parceiro

Protesta titulo para o parceiro?: se marcar - Simples se não Protesto
Nome: FLAGCOBRANCA - Tipo: VARCHAR - Tamanho: 11 -  -  

--BRANCO
Nome: OBSERVACAO1 - Tipo: BLOB - Tamanho: 8 -  -  BRANCO

--Razão Social
Nome: NOMEFTP - Tipo: VARCHAR - Tamanho: 80 -  -  Razão Social

--BRANCO
Nome: IMPOSTO - Tipo: CHAR - Tamanho: 1 -  - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

'T'
Nome: CLIENTE - Tipo: CHAR - Tamanho: 1 -  - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

TCSCON.CODPROJ - DESCRICAO 
Nome: SISTEMA - Tipo: VARCHAR - Tamanho: 12 -  -  

--BRANCO
Nome: PRIORIDADE - Tipo: VARCHAR - Tamanho: 25 -  -  

'PADRÃO'
Nome: TIPO_DESCR - Tipo: VARCHAR - Tamanho: 15 -  -  

--BRANCO
Nome: DESCRICAO_NOTA - Tipo: VARCHAR - Tamanho: 255 -  -  

FIXO NUMERO 1
Nome: ATENDIDOPOR - Tipo: INTEGER - Tamanho: 4 -  -  

--BRANCO
Nome: TIPO_ATUALIZACAO - Tipo: VARCHAR - Tamanho: 50 -  -  

NUMERO FIXO 2
Nome: EMPRESA - Tipo: INTEGER - Tamanho: 4 -  -  

--F - 
Nome: INADIMPLENTE - Tipo: VARCHAR - Tamanho: 1 -  - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False)  
3 FIXO
Nome: PERIODO_RESET - Tipo: INTEGER - Tamanho: 4 -  -  

F
Nome: CONTATO_INADIMPLENCIA - Tipo: CHAR - Tamanho: 1 -  - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

NOME PARCEIRO
Nome: NOME_FANTASIA - Tipo: VARCHAR - Tamanho: 80 -  -  

--BRANCO
Nome: NUM_HD - Tipo: VARCHAR - Tamanho: 30 -  -  

TCSCON Nro.Posto:
Nome: COD_UNIDADE - Tipo: INTEGER - Tamanho: 4 -  -  

--BRANCO
Nome: AUTORIZA_REMOTO - Tipo: CHAR - Tamanho: 1 -  - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

-- ENVIAR A MESMA INFORMAÇÃO
Nome: NOME_ENV - Tipo: VARCHAR - Tamanho: 50 -  -  
Nome: ENDERECO_ENV - Tipo: VARCHAR - Tamanho: 50 -  -  
Nome: BAIRRO_ENV - Tipo: VARCHAR - Tamanho: 30 -  -  
Nome: CIDADE_ENV - Tipo: INTEGER - Tamanho: 4 -  -  
Nome: CEP_ENV - Tipo: VARCHAR - Tamanho: 10 -  -  
-----
F FIXO
Nome: AUTORIZACAO_NOTA - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

--BRANCO NULL
Nome: DATA_AUTORIZA_REMOTO - Tipo: DATE - Tamanho: 4 -  -  

F FIXO
Nome: COBRAR_ENVIO_BOLETO - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

F FIXO
Nome: VALOR_ENVIO_NOTA - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

--->BRANCO
Nome: FORMA_ACESSO - Tipo: VARCHAR - Tamanho: 20 -  -  
Nome: FORMA_ACESSO_OUTROS - Tipo: VARCHAR - Tamanho: 100 -  -  
---->

--PARCEIRO Retém ISS:
Nome: RETEM_ISS - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

--PERCENTUAL ISS - VINCULO ENTRE A CIDADE DO PARCEIRO aba aliquota de Iss
Nome: VALOR_ISS - Tipo: INTEGER - Tamanho: 2,2 - Preenchimento Obrigatório -  

T FIXO
Nome: ACEITA_MALA_DIRETA - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

F FIXO
Nome: USA_RESET_NET - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

--BRANCO
Nome: VE\SAO_ATUALIZACAO - Tipo: VARCHAR - Tamanho: 10 -  -  

--BRANCO NULL
Nome: TIPO_CONTRATO - Tipo: VARCHAR - Tamanho: 1 -  -  

-CADASTRO CONTRATO  CRIAR CAMPO  - UPDATE EM TODOS COMO FALSE - Máquina de teste
Nome: MAQUINA_TESTE - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

--criar campo para salvar a data quando desmarcar ativo no cadastro de parceiros
Nome: DATA_INATIVO - Tipo: DATE - Tamanho: 4 -  -  

T fixo
Nome: VALIDADO - Tipo: CHAR - Tamanho: 1 -  - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

Nome usuário fixo GABI
Nome: USUARIO_VALIDACAO - Tipo: VARCHAR - Tamanho: 50 -  -  

--BRANCO NULL
Nome: DATA_ATUALIZACAO - Tipo: DATE - Tamanho: 4 -  -  

--TABELA DE IMPOSTO - VINCULO CLIENTE - MARCADO O CAMPO CALCULAR = T
Nome: RETEM_PIS_COFINS_CSLL - Tipo: CHAR - Tamanho: 1 - Preenchimento Obrigatório - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

--T FIXO
Nome: USA_MINHA_CONTA - Tipo: CHAR - Tamanho: 1 -  - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

--Calcula IRF: PARCEIRO
Nome: RETEM_IMPOSTO_RENDA - Tipo: CHAR - Tamanho: 1 -  - Obs.: O valor do campo deve ser T ou F - T para Verdade(True) e F para Falso (False) 

Obs.: Os campos devem vir na ordem em que foram apresentados acima.
*/


SELECT 
PAR.CODPARC AS CODIGO,
PAR.NOMEPARC AS NOME,
--RESPONSAVEL,
--CONTATO,
ENDER.NOMEEND AS ENDERECO,
BAI.NOMEBAI AS BAIRRO,
PAR.CEP,
CID.NOMECID AS CIDADE,
--CIDADEDESC,
PAR.IDENTINSCESTAD AS INSCRICAO,
PAR.TIPPESSOA,
PAR.CGC_CPF,
PAR.EMAIL AS EMAIL1,
--EMAIL2,
--HOSPITAL,
--TIPOSERVICO,
--LOCALSERVICO,
PAR.OBSERVACOES AS OBSERVACAO,
PAR.SITUACAO,


FROM TGFPAR PAR
INNER JOIN TSICID CID ON PAR.CODCID = CID.CODCID
INNER JOIN TSIEND ENDER ON PAR.CODEND = ENDER.CODEND
INNER JOIN TSIBAI BAI ON PAR.CODBAI = BAI.CODBAI


WHERE PAR.CODPARC = 566

