/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalAgenciaFutbol;

/**
 *
 * @author Usuario
 */
public class Apuesta {
    private String nombreCliente;
    private int dniCliente;
    private int idPartido;
    private String queAposto;
    private double montoApostado;

    public Apuesta(String nombreCliente, int dniCliente, int idPartido, String queAposto, double montoApostado) {
        this.nombreCliente = nombreCliente;
        this.dniCliente = dniCliente;
        this.idPartido = idPartido;
        this.queAposto = queAposto;
        this.montoApostado = montoApostado;
    }

    public String getQueAposto() {
        return queAposto;
    }

    public int getIdPartido() {
        return idPartido;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public int getDniCliente() {
        return dniCliente;
    }

    public double getMontoApostado() {
        return montoApostado;
    }
    
    
    
}
