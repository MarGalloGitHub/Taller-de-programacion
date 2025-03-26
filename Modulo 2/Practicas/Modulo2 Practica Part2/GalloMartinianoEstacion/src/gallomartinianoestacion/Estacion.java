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
public class Estacion {
    private String direccion;
    private Surtidor [] surtidores;
    private int dimL;

    public Estacion(String direccion) {
        this.direccion = direccion;
        this.surtidores = new Surtidor[6];     /* no inicializo porque lo hace java
                                                pero igualmente el array esta vacio, sin surtidores, con todo en null
                                              */
        this.dimL = 0;
    
    
    }
    
    public void agregarSurtidor(Surtidor unSurtidor){
        surtidores[dimL] = unSurtidor;
        dimL += 1;
    }
    
    public void generarVentaYagregar(int N , int dni, int cantLitros ,double pago , String formadePago){
    Venta vent = new Venta(dni , cantLitros , pago , formadePago );
    surtidores[N-1].agregarVenta(vent);
    }
    
    public int obtenerNumeroSurtidor(){
        int i;
        double max = -1;
        int surtMax = 0;
        for(i = 0 ; i < dimL ; i++)
            if((surtidores[i] != null )&& (surtidores[i].obtenerMontoTotal() > max)){
                max = surtidores[i].obtenerMontoTotal();
                surtMax = i;
            }
        return surtMax;      // en caso de que esten todos vacios  
    }
    
    @Override
    public String toString(){
       String aux =  "Estacion de servicio : " + direccion + "cantidad de surtidores :" + dimL;
       String aux2 = "";
       int i;
       for(i=0 ; i < dimL ; i++){
           aux2 += "\n" + "Surtidor  " + (i +1) + surtidores[i].toString();
       }
       aux += aux2;
       
       return aux;
    }
}
