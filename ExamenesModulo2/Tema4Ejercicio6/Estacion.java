/*
De la estación, interesa conocer: nombre, y latitud y longitud donde se encuentra.
 */
package Tema4Ejercicio6;

/**
 *
 * @author Usuario
 */
public class Estacion {
    private String nombre;
    private double latitud;
    private double longitud;
    
    public Estacion(String nombre, double latitud, double longitud) {
        this.nombre = nombre;
        this.latitud = latitud;
        this.longitud = longitud;
    }
    
    @Override
    public String toString(){
        String aux = this.nombre + "( " + this.latitud + " S   ,   " + this.longitud + "  O    ): " + "\n";
        return aux;              
    }
}
