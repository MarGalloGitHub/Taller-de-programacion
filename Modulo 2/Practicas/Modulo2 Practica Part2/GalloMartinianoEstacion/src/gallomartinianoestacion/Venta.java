/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gallomartinianoestacion;

/**
 *
 * @author Usuario
 */
public class Venta {
    private int dni;
    private int cantLitros;
    private double monto;
    private String medio;

    public Venta(int dni, int cantLitros, double monto, String medio) {
        this.dni = dni;
        this.cantLitros = cantLitros;
        this.monto = monto;
        this.medio = medio;
    }

    public double montoVenta(){
        double aux = (monto * cantLitros);
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = dni + cantLitros + monto + medio;
        return aux;
    }
    
    
}
