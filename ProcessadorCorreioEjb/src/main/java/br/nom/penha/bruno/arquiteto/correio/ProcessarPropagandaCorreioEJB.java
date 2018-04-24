package br.nom.penha.bruno.arquiteto.correio;

import javax.ejb.Stateless;

/**
 *
 */
@Stateless
public class ProcessarPropagandaCorreioEJB implements ProcessarPropagandaCorreio {

    @Override
    public void enviarMensagem(String mensagem) {
        System.out.println("Enviando mensagem " + mensagem);
    }
    
}
