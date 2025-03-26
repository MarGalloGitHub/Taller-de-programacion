/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gallomartinianogoleadoressecond;

/**
 *
 * @author Usuario
 */
public class Goleador {
    private String nombre;
    private String nombreEquipo;
    private int cantGoles;

    public Goleador(String nombre, String nombreEquipo, int cantGoles) {
        this.nombre = nombre;
        this.nombreEquipo = nombreEquipo;
        this.cantGoles = cantGoles;
    }

    public String getNombre() {
        return nombre;
    }

    public String getNombreEquipo() {
        return nombreEquipo;
    }

    public int getCantGoles() {
        return cantGoles;
    }
    
    @Override
    public String toString(){
        String aux = nombre + nombreEquipo + cantGoles;
        return aux;
    }
    
    
    
}
