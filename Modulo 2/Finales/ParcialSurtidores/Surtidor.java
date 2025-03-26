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
public class Surtidor {
    private String combustible;
    private double precioXlitro;
    private int capacidadVentas;
    private Venta[] informacionVentas;
    private int dimL;
    

    public Surtidor(String combustible, double precioXlitro, int capacidadVentas) {
        this.combustible = combustible;
        this.precioXlitro = precioXlitro;
        this.capacidadVentas = capacidadVentas;
        informacionVentas = new Venta[capacidadVentas];
        dimL = 0;
    }

    public String getCombustible() {
        return combustible;
    }

    public double getPrecioXlitro() {
        return precioXlitro;
    }

    public int getCapacidadVentas() {
        return capacidadVentas;
    }

    public void agregarInfo(Venta venta1){    // preguntar si esta bien hacer esto
        if(dimL <= (capacidadVentas - 1)){
            informacionVentas[dimL] = venta1;
            dimL++;
        }
    }
    
    public double montoTotal(){
        double aux = 0;
        int i;
        for(i=0 ; i <= (dimL - 1); i++){
            aux += informacionVentas[i].getMontoAbonado();
        }   
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = "Combustible: " + this.combustible + "- Precio x Litro: " + this.precioXlitro;
        int i;
        aux+= "Informacion de ventas :  " + "\n";
        for(i=0 ; i<= (dimL - 1); i++){
            aux+= "Venta numero " +(i+1) + ":  " + informacionVentas[i].toString();
        }
        return aux;
    }
    
}
