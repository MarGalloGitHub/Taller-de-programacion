/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialSurtidores;

/**
 *
 * @author Usuario
 */
public class Venta {
    private int DNI;
    private int cantidadLitros;
    private double montoAbonado;
    private String metodoPago;

    public Venta(int DNI, int cantidadLitros, double montoAbonado, String metodoPago) {
        this.DNI = DNI;
        this.cantidadLitros = cantidadLitros;
        this.montoAbonado = montoAbonado;
        this.metodoPago = metodoPago;
    }

    public double getMontoAbonado() {
        return montoAbonado;
    }
    
    @Override
    public String toString(){
        String aux = "DNI del cliente:  " + this.DNI + "- cantidad de litros:  " + this.cantidadLitros + "- monto abonado:  " + this.montoAbonado + "- metodo de pago:  " + this.metodoPago;
        return aux;
    }
}
