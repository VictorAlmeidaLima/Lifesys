package br.com.sankhya.lifesys.Exclusao;

import br.com.sankhya.lifesys.utils.LogIntegracao;
import br.com.sankhya.lifesys.utils.UtilsLifesys;
import br.com.sankhya.modelcore.PlatformService;
import br.com.sankhya.modelcore.PlatformServiceFactory;
import org.cuckoo.core.ScheduledAction;
import org.cuckoo.core.ScheduledActionContext;

import java.math.BigDecimal;

import static br.com.sankhya.lifesys.utils.UtilsLifesys.mudaNomeArquivo;

public class AgendadorContratoExclusao implements ScheduledAction {
    @Override
    public void onTime(ScheduledActionContext scheduledActionContext) {

        String log, nomeArquivo = "";
        LogIntegracao logIntegracao = new LogIntegracao();
        BigDecimal codLayout = null;

        try{
            codLayout = BigDecimal.valueOf(81000);
            nomeArquivo = mudaNomeArquivo("#CONTRATOS_EXC#", codLayout);

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
