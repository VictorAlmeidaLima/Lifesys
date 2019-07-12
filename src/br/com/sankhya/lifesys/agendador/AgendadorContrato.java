package br.com.sankhya.lifesys.agendador;

import br.com.sankhya.lifesys.utils.LogIntegracao;
import br.com.sankhya.lifesys.utils.UtilsLifesys;
import br.com.sankhya.modelcore.PlatformService;
import br.com.sankhya.modelcore.PlatformServiceFactory;
import org.cuckoo.core.ScheduledAction;
import org.cuckoo.core.ScheduledActionContext;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import static br.com.sankhya.lifesys.utils.UtilsLifesys.mudaNomeArquivo;

public class AgendadorContrato implements ScheduledAction {
    @Override
    public void onTime(ScheduledActionContext scheduledActionContext) {
        String log, nomeArquivo = "";
        LogIntegracao logIntegracao = new LogIntegracao();
        BigDecimal codLayout = null;
        try{
            codLayout = BigDecimal.valueOf(73000);
            nomeArquivo = mudaNomeArquivo("#CONTRATOS#", codLayout);

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
}
