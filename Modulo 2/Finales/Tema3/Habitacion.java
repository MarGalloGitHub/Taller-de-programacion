/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tema3;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.GeneradorAleatorio;
public class Habitacion {
    private double costoXnoche;
    private boolean ocupada;
    private Cliente cliente;
            
    public Habitacion() {
        GeneradorAleatorio.iniciar();
        this.costoXnoche = 8000 - GeneradorAleatorio.generarDouble(6000) ; // preguntar si esta bien arrancar generador en el constructor
        this.ocupada = false;
        this.cliente = null;
    }

    public double getCostoXnoche() {
        return costoXnoche;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCostoXnoche(double costoXnoche) {
        this.costoXnoche = costoXnoche;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    
    
}
