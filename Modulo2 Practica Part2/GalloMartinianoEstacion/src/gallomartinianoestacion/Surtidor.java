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
public class Surtidor {
    private String nombreCombustible;
    private double precio;
    private Venta [] ventas;
    private int dimL;

    public Surtidor(String nombreCombustible, double precio, int V) {
        this.nombreCombustible = nombreCombustible;
        this.precio = precio;
        this.ventas = new Venta[V];  /* no inicializo porque lo hace java
                                        pero igualmente el array esta vacio, sin surtidores, con todo en 
                                        null
                                    */
        this.dimL = 0;
    }
    
    public void agregarVenta(Venta V){
        ventas[dimL] = V;
        dimL ++;
    }
    
    public double obtenerMontoTotal(){
        int i;
        double aux = 0;
        for(i = 0 ; i < dimL ; i++){
            if(ventas[i] != null){
                aux += ventas[i].montoVenta();
            }
        }
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = nombreCombustible + precio; 
        String aux2 = "";
        int i;
        for(i = 0 ; i < dimL ; i++){
           aux2 +=  ventas[i].toString();
        }
        aux += aux2;
         return aux;
    }
}
