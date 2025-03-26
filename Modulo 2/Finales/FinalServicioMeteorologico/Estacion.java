/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalServicioMeteorologico;

/**
 *
 * @author Usuario
 */
public class Estacion {
    private String nombre;
    private int coordenadaLatitud;
    private int coordenadaLongitud;

    public Estacion(String nombre, int coordenadaLatitud, int coordenadaLongitud) {
        this.nombre = nombre;
        this.coordenadaLatitud = coordenadaLatitud;
        this.coordenadaLongitud = coordenadaLongitud;
    }
    
    

    public String getNombre() {
        return nombre;
    }

    public int getCoordenadaLatitud() {
        return coordenadaLatitud;
    }

    public int getCoordenadaLongitud() {
        return coordenadaLongitud;
    }
    
    
}
