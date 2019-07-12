package br.com.sankhya.lifesys.Acoes;

import br.com.sankhya.extensions.actionbutton.AcaoRotinaJava;
import br.com.sankhya.extensions.actionbutton.ContextoAcao;
import br.com.sankhya.extensions.actionbutton.Registro;
import br.com.sankhya.lifesys.utils.LogIntegracao;
import br.com.sankhya.lifesys.utils.UtilsLifesys;
import br.com.sankhya.modelcore.PlatformService;
import br.com.sankhya.modelcore.PlatformServiceFactory;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import static br.com.sankhya.lifesys.utils.UtilsLifesys.mudaNomeArquivo;

public class enviarArquivoPosto implements AcaoRotinaJava {


    public void geraArquivo(){
        String log, nomeArquivo = "";
        LogIntegracao logIntegracao = new LogIntegracao();
        BigDecimal codLayout = null;
        try{
            codLayout = BigDecimal.valueOf(71000);
            nomeArquivo = mudaNomeArquivo("#CLIENTE#", codLayout);

            PlatformService ps = (PlatformService) PlatformServiceFactory.getInstance()
                    .lookupService("@core:edi.comercial.service");

            //METODO RESPONSÁVEL POR GERAR O ARQUIVO DE INTEGRAÇÃO
            UtilsLifesys.geraRemessa(codLayout, ps);
            //
            logIntegracao.salvaLog(codLayout,nomeArquivo,"Arquivo Gerado com Sucesso","S" );

        } catch (Exception e){

            RuntimeException re = new RuntimeException(e);
            logIntegracao.salvaLog(codLayout,nomeArquivo,"Erro ao Gerar Arquivo","N" );
            throw re;

        }
    }

    private Map<String, Object> buildParam(long codigo, String nome, Object valor){

        Map<String, Object> param = new HashMap<String, Object>();

        param.put("codigo", new BigDecimal(codigo));
        param.put("nome", nome);
        param.put("valor", valor);

        return param;

    }

    @Override
    public void doAction(ContextoAcao contextoAcao) throws Exception {

        Calendar data = Calendar.getInstance();
        long dataHoje = data.getTimeInMillis();
        Timestamp dataTimeStamp = new Timestamp(dataHoje);

        Registro[] linhas = contextoAcao.getLinhas();
        for(Registro linha: linhas){

            linha.setCampo("AD_DHALTER",dataTimeStamp);
            linha.save();

        }

        geraArquivo();
        contextoAcao.setMensagemRetorno("Registros Enviados.");
    }
}
