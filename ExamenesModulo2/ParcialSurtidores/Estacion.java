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
public class Estacion {
    private String direccion;
    private Surtidor[] surtidores;
    private int dimL;

    public Estacion(String direccion) {
        this.direccion = direccion;
        surtidores = new Surtidor[6];
        this.dimL = 0;
    }
    
    public void agregarSurtidor(Surtidor unSurtidor){
        if(dimL <= 5){
            surtidores[dimL] = unSurtidor;
            dimL++;
        }
    }
    
    public void agregarVenta(int N, int DNI, int cantidadLitros, String formaPago, double monto){
        Venta venta1 = new Venta(DNI,cantidadLitros,monto,formaPago);
        surtidores[N - 1].agregarInfo(venta1);
    }
    
    public int numeroDeSurtidorMayorRecaudacion(){
        int aux = 0;
        double maxRecaudo = -1;
        int i;
        for(i=0 ; i <= (dimL - 1) ; i++){
            if(surtidores[i].montoTotal() > maxRecaudo){
                maxRecaudo = surtidores[i].montoTotal();
                aux = (i + 1);
            }
        }
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = "Estacion de servicio Pollos Hermanos " + " - Direccion:  " + this.direccion + ", cuenta con 6 surtidores  ";
        int i;
        for(i=0 ; i <= (dimL - 1); i++){
            aux+= "\n" + "Surtidor" + (i+1)+ ":  " + surtidores[i].toString();
        }
        return aux;
    }
}
