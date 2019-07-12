package br.com.sankhya.lifesys.utils;

import br.com.sankhya.jape.vo.DynamicVO;
import br.com.sankhya.jape.wrapper.JapeFactory;
import br.com.sankhya.jape.wrapper.JapeWrapper;
import br.com.sankhya.lifesys.agendador.AgendadorCliente;
import br.com.sankhya.modelcore.PlatformService;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Logger;

public class UtilsLifesys {

    public  static String mudaNomeArquivo(String nomeArquivo,BigDecimal codlayout) throws Exception {
        Calendar data = Calendar.getInstance();
        long dataHoje = data.getTimeInMillis();
        java.sql.Timestamp dataTimeStamp = new Timestamp(dataHoje);
        Logger logger = Logger.getLogger(UtilsLifesys.class.getSimpleName());
        String formattedDate = new SimpleDateFormat("yyyyMMddHHmm").format(dataTimeStamp);
        logger.warning("mudaNomeArquivo *Entrou*");
        try {
            nomeArquivo = "'" + nomeArquivo + formattedDate + ".txt'";

            JapeWrapper layoutDAO = JapeFactory.dao("FormatadorRemessa");

            DynamicVO layoutCliente = layoutDAO.findOne("MODULO = 'C' AND CODIGO = ?", codlayout);

            layoutDAO.prepareToUpdate(layoutCliente).set("NOMEARQ", nomeArquivo).update();
        }catch (Exception e){
            logger.warning("Erro mudaNomeArquivo:"+e.getMessage());
        }

        return nomeArquivo;
    }

    public static void geraRemessa(BigDecimal codLayout, PlatformService ps) throws Exception {
        //TELA CONFIG.INTEGRAÇÃO ATENDIMENTO
        JapeWrapper configInt = JapeFactory.dao("AD_TSIREMCONFIG");

        //SELECIONA APENAS O REGISTRO MAIS ATUAL
        DynamicVO configVO = configInt.findOne("AD_DHALTER = (SELECT MAX(AD_DHALTER) FROM AD_TSIREMCONFIG)");

        ps.set("codLayout", codLayout);
        //ps.set("emails", configVO.asString("EMAIL"));
        ps.set("caminhoFTP", configVO.asString("CAMINHOFTP"));
        ps.set("enderecoFTP", configVO.asString("ENDERECOFTP"));
        ps.set("usuarioFTP", configVO.asString("USUARIOFTP"));
        ps.set("senhaFTP", configVO.asString("SENHAFTP"));
        ps.execute();
    }

}
