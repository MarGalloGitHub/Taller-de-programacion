/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.GeneradorAleatorio;
public class Habitacion {
    private double costoXnoche;
    private boolean ocupada;
    private Cliente alguien;
    
    public Habitacion() {
        GeneradorAleatorio.iniciar();
        this.costoXnoche = GeneradorAleatorio.generarInt(8000);  // como hacer un subrango???
        this.ocupada = false;
    }
    
    public double getCostoXnoche() {
        return costoXnoche;
    }

    public boolean estaOcupada() {
        return ocupada;
    }

    public Cliente getAlguien() {
        return alguien;
    }

    public void setCostoXnoche(double costoXnoche) {
        this.costoXnoche = costoXnoche;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public void setAlguien(Cliente alguien) {
        this.alguien = alguien;
    }
}
    
    
    
