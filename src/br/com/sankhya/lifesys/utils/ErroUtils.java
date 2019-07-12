package br.com.sankhya.lifesys.utils;

public class ErroUtils {

    public static void disparaErro(String msg) throws Exception {
        String msgTratada = "<hr>" +
                "<b><span style=\"font-size: 1.2em\">" + msg + "</span></b><hr>";
        throw new Exception(msgTratada);
    }
}