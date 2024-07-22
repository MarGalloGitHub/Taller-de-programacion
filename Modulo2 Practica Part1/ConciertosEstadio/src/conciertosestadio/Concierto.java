/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conciertosestadio;

/**
 *
 * @author Usuario
 */
public class Concierto {
    private String nombreArtista;
    private double precioEntrada;
    private int cantEntradasVendidas;

    public Concierto(String nombreArtista, double precioEntrada, int cantEntradasVendidas) {
        this.nombreArtista = nombreArtista;
        this.precioEntrada = precioEntrada;
        this.cantEntradasVendidas = cantEntradasVendidas;
    }

    public String getNombreArtista() {
        return nombreArtista;
    }

    public double getPrecioEntrada() {
        return precioEntrada;
    }

    public int getCantEntradasVendidas() {
        return cantEntradasVendidas;
    }
    
    @Override
    public String toString(){
       String aux = nombreArtista + precioEntrada + cantEntradasVendidas;
       return aux;
    }
    
    public double calcularGananciaConcierto(){
        double aux = ((cantEntradasVendidas * precioEntrada) / 2);
        return aux;
    }
}
