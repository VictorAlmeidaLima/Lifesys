package br.com.sankhya.lifesys;

import br.com.sankhya.extensions.eventoprogramavel.EventoProgramavelJava;
import br.com.sankhya.jape.event.PersistenceEvent;
import br.com.sankhya.jape.event.TransactionContext;
import br.com.sankhya.jape.vo.DynamicVO;
import br.com.sankhya.jape.wrapper.JapeFactory;
import br.com.sankhya.jape.wrapper.JapeWrapper;
import br.com.sankhya.jape.wrapper.fluid.FluidUpdateVO;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.logging.Logger;

import static br.com.sankhya.lifesys.utils.ErroUtils.disparaErro;

public class EventoAltPrecoContrato implements EventoProgramavelJava {
    Logger log = Logger.getLogger(EventoClienteIntegracao.class.getSimpleName());

    @Override
    public void beforeInsert(PersistenceEvent persistenceEvent) throws Exception {
        alteraDataAlteracao(persistenceEvent);
    }

    @Override
    public void beforeUpdate(PersistenceEvent persistenceEvent) throws Exception {
        alteraDataAlteracao(persistenceEvent);
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

    public void alteraDataAlteracao(PersistenceEvent persistenceEvent) throws Exception {
        Calendar data = Calendar.getInstance();
        long dataHoje = data.getTimeInMillis();
        Timestamp dataTimeStamp = new Timestamp(dataHoje);

        try {
            DynamicVO entidadeVO = (DynamicVO) persistenceEvent.getVo();

            BigDecimal numcontrato = entidadeVO.asBigDecimal("NUMCONTRATO");

            JapeWrapper contratoDao = JapeFactory.dao("Contrato");

            DynamicVO contratoVO = contratoDao.findOne("NUMCONTRATO = ?", numcontrato);

            FluidUpdateVO fluidUpdateVO = contratoDao.prepareToUpdate(contratoVO);
            fluidUpdateVO.set("AD_DHALTER",dataTimeStamp);
            fluidUpdateVO.update();


        }
        catch (Exception e){
            disparaErro("Erro Alt:"+ e.getMessage());
        }

    }

}
