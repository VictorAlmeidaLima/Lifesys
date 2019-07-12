package br.com.sankhya.lifesys;

import br.com.sankhya.extensions.eventoprogramavel.EventoProgramavelJava;
import br.com.sankhya.jape.dao.EntityDAO;
import br.com.sankhya.jape.event.ModifingFields;
import br.com.sankhya.jape.event.PersistenceEvent;
import br.com.sankhya.jape.event.TransactionContext;
import br.com.sankhya.jape.vo.DynamicVO;
import br.com.sankhya.jape.vo.EntityVO;

import br.com.sankhya.jape.wrapper.JapeFactory;
import br.com.sankhya.jape.wrapper.JapeWrapper;
import br.com.sankhya.jape.wrapper.fluid.FluidUpdateVO;
import br.com.sankhya.jape.wrapper.fluid.FluidVO;
import com.sankhya.util.XMLUtils;
import com.sankhya.util.XMLUtils.SimpleXPath;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.logging.Logger;

public class EventoClienteIntegracao implements EventoProgramavelJava {

    Logger log = Logger.getLogger(EventoClienteIntegracao.class.getSimpleName());


    @Override
    public void beforeInsert(PersistenceEvent persistenceEvent) throws Exception {

    }

    @Override
    public void beforeUpdate(PersistenceEvent persistenceEvent) throws Exception {
        AlteraDhInativo(persistenceEvent);
    }

    @Override
    public void beforeDelete(PersistenceEvent persistenceEvent) throws Exception {

    }

    @Override
    public void afterInsert(PersistenceEvent persistenceEvent) throws Exception {

    }

    @Override
    public void afterUpdate(PersistenceEvent persistenceEvent) throws Exception {

     //   AlteraDhInativo(persistenceEvent);
    }

    @Override
    public void afterDelete(PersistenceEvent persistenceEvent) throws Exception {

    }

    @Override
    public void beforeCommit(TransactionContext transactionContext) throws Exception {

    }




    //********METODOS**********


    private void AlteraDhInativo(PersistenceEvent persistenceEvent) throws Exception {
        //Metodo Criado para realizar o update no campo AD_DHINATIVO quando o Campo Ativo for passado para 'N'

        DynamicVO ClienteVO = (DynamicVO) persistenceEvent.getVo();
        DynamicVO ClienteOldVO = (DynamicVO) persistenceEvent.getOldVO();

        JapeWrapper ClienteDao = new JapeFactory().dao("Parceiro");

        EntityDAO targetDAO = persistenceEvent.getTargetDAO();

        Calendar data = Calendar.getInstance();
        long dataHoje = data.getTimeInMillis();
        Timestamp dataTimeStamp = new Timestamp(dataHoje);

        if("N".equals(ClienteVO.asString("ATIVO")) && ("S".equals(ClienteOldVO.asString("ATIVO")))){
            this.log.warning("------>Inside first IF<------");
            try {

                ClienteVO.setProperty("AD_DHINATIVO", dataTimeStamp);

            }catch (Exception e){
                this.log.warning("Error------>"+e.getMessage()+"<------");
            }
        }
        else if ("S".equals(ClienteVO.asString("ATIVO")) && ("N".equals(ClienteOldVO.asString("ATIVO")))){
            this.log.warning("------>Inside first ELSE IF<------");

            dataTimeStamp = null;
            ClienteVO.setProperty("AD_DHINATIVO", dataTimeStamp);
//            FluidUpdateVO ClienteUpdateVO = ClienteDao.prepareToUpdate(ClienteVO);
//            ClienteUpdateVO.set("AD_DHINATIVO", dataTimeStamp);
//            ClienteUpdateVO.update();
        }else
            this.log.warning("------>ELSE<------");
    }

}
