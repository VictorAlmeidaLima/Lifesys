package br.com.sankhya.lifesys.Acoes;

import br.com.sankhya.extensions.actionbutton.AcaoRotinaJava;
import br.com.sankhya.extensions.actionbutton.ContextoAcao;
import br.com.sankhya.extensions.actionbutton.Registro;
import br.com.sankhya.jape.vo.DynamicVO;
import br.com.sankhya.jape.wrapper.JapeFactory;
import br.com.sankhya.jape.wrapper.JapeWrapper;
import br.com.sankhya.lifesys.utils.ErroUtils;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.logging.Logger;

public class ReiniciarIntegracaoPorModulo implements AcaoRotinaJava {
    Logger log = Logger.getLogger(ReiniciarIntegracaoPorModulo.class.getSimpleName());

    @Override
    public void doAction(ContextoAcao contextoAcao) throws Exception {
        try {
            reiniciaIntegracao(contextoAcao);
        }
        catch (Exception e){
            ErroUtils.disparaErro("Erro: "+e.getMessage());
        }
    }

    public void reiniciaIntegracao(ContextoAcao contextoAcao) throws Exception {

        JapeWrapper logIntegracao = JapeFactory.dao("AD_TSIREMLOG");
        JapeWrapper layoutIntegracao = JapeFactory.dao("FormatadorRemessa");

        BigDecimal p_codlayout = new BigDecimal((String) contextoAcao.getParam("CODLAYOUT"));

        String textoConfirmar = "Ao confirmar Todos os Logs serão Apagados e a Integração enviará todos os registros novamente ";

           if (contextoAcao.confirmarSimNao("Reiniciar Integração", textoConfirmar, 0)) {

               //Exclui Todos os Registros
               logIntegracao.deleteByCriteria("SUCESSO IN ('S','N') AND CODLAYOUT = ?",p_codlayout);


               Collection<DynamicVO> layoutVOs = layoutIntegracao.find("MODULO ='C' AND CODPAI IN (70000,80000)");


               Timestamp dataTimeStamp = Timestamp.valueOf("1900-01-01 00:00:00");

               for (DynamicVO layout : layoutVOs) {
                   Registro logIntegracaoNovo = contextoAcao.novaLinha("AD_TSIREMLOG");
                   logIntegracaoNovo.setCampo("DTEXEC", dataTimeStamp);
                   logIntegracaoNovo.setCampo("SUCESSO", "S");
                   logIntegracaoNovo.setCampo("LOG", "Registro inicial");
                   logIntegracaoNovo.setCampo("CODLAYOUT", layout.asBigDecimal("CODIGO"));
                   logIntegracaoNovo.setCampo("NOMEARQ", layout.asString("NOMEARQ"));
                   logIntegracaoNovo.save();
               }

               contextoAcao.setMensagemRetorno("Integração do Módulo "+p_codlayout+" Reiniciada com Sucesso !");
           }


    }
}
