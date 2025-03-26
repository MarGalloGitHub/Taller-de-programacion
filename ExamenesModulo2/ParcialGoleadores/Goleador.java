/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialGoleadores;

/**
 *
 * @author Usuario
 */
public class Goleador {
    private String nombre;
    private String nombreEquipo;
    private int cantidadGoles;

    public Goleador(String nombre, String nombreEquipo, int cantidadGoles) {
        this.nombre = nombre;
        this.nombreEquipo = nombreEquipo;
        this.cantidadGoles = cantidadGoles;
    }

    public String getNombre() {
        return nombre;
    }

    public String getNombreEquipo() {
        return nombreEquipo;
    }

    public int getCantidadGoles() {
        return cantidadGoles;
    }
    
    @Override
    public String toString(){
        String aux = "Nombre: " + this.nombre + ",nombre de equipo: " +this.nombreEquipo + ", cantidad de goles" +this.cantidadGoles;
        return aux;
    }
}
