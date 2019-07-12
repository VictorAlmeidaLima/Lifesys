package br.com.sankhya.lifesys.utils;

import br.com.sankhya.jape.wrapper.JapeFactory;
import br.com.sankhya.jape.wrapper.JapeWrapper;
import br.com.sankhya.jape.wrapper.fluid.FluidCreateVO;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Calendar;

public class LogIntegracao {

    public void salvaLog(BigDecimal cod,String nomeArq, String log, String sucesso){

        JapeWrapper logDAO = JapeFactory.dao("AD_TSIREMLOG");

        Calendar data = Calendar.getInstance();
        long dataHoje = data.getTimeInMillis();
        java.sql.Timestamp dataTimeStamp = new Timestamp(dataHoje);

        try {
            FluidCreateVO fluidCreateLogVO = logDAO.create();

            fluidCreateLogVO.set("CODLAYOUT", cod);
            fluidCreateLogVO.set("NOMEARQ", nomeArq);
            fluidCreateLogVO.set("DTEXEC", dataTimeStamp);
            fluidCreateLogVO.set("LOG", log);
            fluidCreateLogVO.set("SUCESSO", sucesso);
            fluidCreateLogVO.save();

        }catch(Exception e){
            RuntimeException re = new RuntimeException(e);
            throw re;
        }
    }
}
