package br.com.sankhya.lifesys.agendador;

import br.com.sankhya.lifesys.utils.LogIntegracao;
import br.com.sankhya.lifesys.utils.UtilsLifesys;
import br.com.sankhya.modelcore.PlatformService;
import br.com.sankhya.modelcore.PlatformServiceFactory;
import org.cuckoo.core.ScheduledAction;
import org.cuckoo.core.ScheduledActionContext;

import java.math.BigDecimal;

import static br.com.sankhya.lifesys.utils.UtilsLifesys.*;

public class AgendadorVinculoCliente implements ScheduledAction {
    @Override
    public void onTime(ScheduledActionContext scheduledActionContext) {

        String log, nomeArquivo = "";
        LogIntegracao logIntegracao = new LogIntegracao();
        BigDecimal codLayout = null;

        try{
            codLayout = BigDecimal.valueOf(79100);
            nomeArquivo = mudaNomeArquivo("#VINCULO_CLIENTE#", codLayout);

            PlatformService ps = (PlatformService) PlatformServiceFactory.getInstance()
                    .lookupService("@core:edi.comercial.service");

            //METODO RESPONSÁVEL POR GERAR O ARQUIVO DE INTEGRAÇÃO
            UtilsLifesys.geraRemessa(codLayout, ps);
            //
            logIntegracao.salvaLog(codLayout,nomeArquivo,"Arquivo Gerado com Sucesso","S" );

        } catch (Exception e){

            logIntegracao.salvaLog(codLayout,nomeArquivo,"Erro ao Gerar Arquivo","N" );
            RuntimeException re = new RuntimeException(e);
            throw re;

        }
    }


}
