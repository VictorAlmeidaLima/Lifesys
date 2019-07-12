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

public class AgendadorItemModulo implements ScheduledAction {
    @Override
    public void onTime(ScheduledActionContext scheduledActionContext) {
        String log, nomeArquivo = "";
        LogIntegracao logIntegracao = new LogIntegracao();
        BigDecimal codLayout = null;
        try{
            codLayout = BigDecimal.valueOf(77000);
            nomeArquivo = mudaNomeArquivo("#ITEM_MODULO#", codLayout);
            //Para que seja possível preencher os parâmetros sem a interface com o usuário
            //criamos uma colection e preenchemos essa colection com cada parâmetro de cada
            //"registro" (chamo de registro a configuração de linha do arquivo).
//            Collection<Map<String, Object>> params = new ArrayList<Map<String, Object>>();
//            //O primeiro "registro" é o 1.02.00, ele usa duas variáveis: "DATA INICIO" e "DATA FINAL"
//            params.add(buildParam(10200, "DATA INICIO", "01/04/2016"));
//            params.add(buildParam(10200, "DATA FINAL", "30/04/2016"));
//            //O segundo "registro" é o 1.03.00, esse usa "DATData Inicial" e "DATData Inicial"
//            params.add(buildParam(10300, "DATData Inicial", "01/04/2016"));
//            params.add(buildParam(10300, "DATData Final", "30/04/2016"));
//            //e segue...
//            params.add(buildParam(10400, "DATData Inicial", "01/04/2016"));
//            params.add(buildParam(10400, "DATData Final", "30/04/2016"));
//            params.add(buildParam(10500, "DATData Inicial", "01/04/2016"));
//            params.add(buildParam(10500, "DATData Final", "30/04/2016"));
//            params.add(buildParam(10600, "DATData Inicial", "01/04/2016"));
//            params.add(buildParam(10600, "DATData Final", "30/04/2016"));
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
