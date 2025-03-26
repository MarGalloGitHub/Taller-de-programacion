/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalUnlpSubsidios;

/**
 *
 * @author Usuario
 */
public class Bien {
    private String descripcion;
    private int cantidad;
    private double costoXunidad;

    public Bien(String descripcion, int cantidad, double costoXunidad) {
        this.descripcion = descripcion;
        this.cantidad = cantidad;
        this.costoXunidad = costoXunidad;
    }
    
    public double costoFinalBien(){
        double aux = this.cantidad * this.costoXunidad;
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = this.descripcion;
        return aux;
    }
}
