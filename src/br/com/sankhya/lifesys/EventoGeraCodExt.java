package br.com.sankhya.lifesys;

import br.com.sankhya.extensions.eventoprogramavel.EventoProgramavelJava;
import br.com.sankhya.jape.event.PersistenceEvent;
import br.com.sankhya.jape.event.TransactionContext;
import br.com.sankhya.jape.vo.DynamicVO;
import br.com.sankhya.jape.vo.EntityVO;
import br.com.sankhya.jape.wrapper.JapeFactory;

import java.math.BigDecimal;

public class EventoGeraCodExt implements EventoProgramavelJava {

    private void geraCodExt(PersistenceEvent persistenceEvent) throws Exception {

        //O parametro deve estar ligado para gerar o código Ext
        if("S".equals(JapeFactory.dao("ParametroSistema").findOne("CHAVE = 'GERARCODEXTAUTO'").asString("LOGICO"))) {

            try {
                //Obtenho o ultimo código gerado
                DynamicVO parametroSistema = JapeFactory.dao("ParametroSistema").findOne("CHAVE = 'ULTCODEXT'");
                BigDecimal ultCodExt = parametroSistema.asBigDecimal("INTEIRO");
                //Só pode gerar CODext para Contatos com o tipo = 'P'
                DynamicVO parceiroVO = (DynamicVO) persistenceEvent.getVo();

                codExtMais1(parametroSistema, ultCodExt, parceiroVO);

            }catch (Exception e){
                throw new Exception("Erro "+e.getMessage());
            }
        }
    }

    private void codExtMais1(DynamicVO parametroSistema, BigDecimal ultCodExt, DynamicVO parceiroVO) throws Exception {
        try {
            ultCodExt = ultCodExt.add(BigDecimal.ONE);
            parceiroVO.setProperty("AD_CODEXT", ultCodExt);
            //Altero o parametro para o ultimo cod_ext gerado.
            JapeFactory.dao("ParametroSistema").prepareToUpdate(parametroSistema).set("INTEIRO", ultCodExt).update();
        }catch(Exception e){
            throw new Exception("Erro ao gerar Cód.Externo."+e.getMessage());
        }
    }


    @Override
    public void beforeInsert(PersistenceEvent persistenceEvent) throws Exception {
        geraCodExt(persistenceEvent);
    }

    @Override
    public void beforeUpdate(PersistenceEvent persistenceEvent) throws Exception {

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
}
