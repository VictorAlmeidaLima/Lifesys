package br.com.sankhya.lifesys;

import br.com.sankhya.extensions.eventoprogramavel.EventoProgramavelJava;
import br.com.sankhya.jape.event.PersistenceEvent;
import br.com.sankhya.jape.event.TransactionContext;
import br.com.sankhya.jape.vo.DynamicVO;
import br.com.sankhya.jape.vo.EntityVO;
import br.com.sankhya.jape.wrapper.JapeFactory;
import br.com.sankhya.jape.wrapper.JapeWrapper;

import java.math.BigDecimal;

public class ValidaContatoPosto implements EventoProgramavelJava {

    JapeWrapper contatoDao = JapeFactory.dao("Contato");

    public void validaContato(PersistenceEvent event) throws Exception {
        DynamicVO vo = (DynamicVO) event.getVo();

        BigDecimal codcontato = vo.asBigDecimal("CODCONTATO");
        BigDecimal codparc = vo.asBigDecimal("CODPARC");
        String ad_unidade = vo.asString("AD_UNIDADE");

        DynamicVO contatoVO = contatoDao.findOne("CODPARC = ? AND CODCONTATO = ?", codparc, codcontato);
        String ad_tipocontato = contatoVO.asString("AD_TIPOCONTATO");

        //Se o tipo do contrato for posto e o contato for contato interno
        if("i".equals(ad_tipocontato) && "P".equals(ad_unidade)){
            throw new Exception("Contato Interno não pode ser Vinculado ao Contrato");
        }
    }



    @Override
    public void beforeInsert(PersistenceEvent persistenceEvent) throws Exception {

    }

    @Override
    public void beforeUpdate(PersistenceEvent persistenceEvent) throws Exception {

    }

    @Override
    public void beforeDelete(PersistenceEvent persistenceEvent) throws Exception {

    }

    @Override
    public void afterInsert(PersistenceEvent persistenceEvent) throws Exception {
        validaContato(persistenceEvent);
    }

    @Override
    public void afterUpdate(PersistenceEvent persistenceEvent) throws Exception {
        validaContato(persistenceEvent);
    }

    @Override
    public void afterDelete(PersistenceEvent persistenceEvent) throws Exception {

    }

    @Override
    public void beforeCommit(TransactionContext transactionContext) throws Exception {

    }
}
