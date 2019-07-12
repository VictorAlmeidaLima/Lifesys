package br.com.sankhya.lifesys;

import br.com.sankhya.extensions.eventoprogramavel.EventoProgramavelJava;
import br.com.sankhya.jape.event.PersistenceEvent;
import br.com.sankhya.jape.event.TransactionContext;
import br.com.sankhya.jape.vo.DynamicVO;
import br.com.sankhya.jape.vo.EntityVO;

import java.sql.Timestamp;
import java.util.Calendar;

import static br.com.sankhya.lifesys.utils.ErroUtils.disparaErro;

public class EventoDhInativo implements EventoProgramavelJava {
    @Override
    public void beforeInsert(PersistenceEvent persistenceEvent) throws Exception {

    }

    @Override
    public void beforeUpdate(PersistenceEvent persistenceEvent) throws Exception {
        alteraDataInativo(persistenceEvent);
    }

    @Override
    public void beforeDelete(PersistenceEvent persistenceEvent) throws Exception {

    }

    @Override
    public void afterInsert(PersistenceEvent persistenceEvent) throws Exception {

    }

    @Override
    public void afterUpdate(PersistenceEvent persistenceEvent) throws Exception {

    }

    @Override
    public void afterDelete(PersistenceEvent persistenceEvent) throws Exception {

    }

    @Override
    public void beforeCommit(TransactionContext transactionContext) throws Exception {

    }

    public void alteraDataInativo(PersistenceEvent persistenceEvent) throws Exception {
        Calendar data = Calendar.getInstance();
        long dataHoje = data.getTimeInMillis();
        Timestamp dataTimeStamp = new Timestamp(dataHoje);

        DynamicVO entidadeVO = (DynamicVO) persistenceEvent.getVo();
        DynamicVO entidadeOldVO = (DynamicVO) persistenceEvent.getOldVO();

        String ativo = entidadeVO.asString("ATIVO");
        String ativoOld = entidadeOldVO.asString("ATIVO");

        try {

            if("N".equals(ativo) && ("S".equals(ativoOld))){
                entidadeVO.setProperty("AD_DHINATIVO", dataTimeStamp);
            }
            else if ("S".equals(ativo) && ("N".equals(ativoOld))) {
                dataTimeStamp = null;
                entidadeVO.setProperty("AD_DHINATIVO", dataTimeStamp);
            }

        }
        catch (Exception e){
            disparaErro("Erro Alt:"+ e.getMessage());
        }

    }
}
