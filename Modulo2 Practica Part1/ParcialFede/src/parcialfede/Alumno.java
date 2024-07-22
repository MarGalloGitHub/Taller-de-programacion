/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialfede;

/**
 *
 * @author Usuario
 */
public class Alumno {
    private String nombre;
    private int edad;
    private String instrumento;
    private double puntaje;

    public Alumno(String nombre, int edad, String instrumento) {
        this.nombre = nombre;
        this.edad = edad;
        this.instrumento = instrumento;
        this.puntaje = -1;
    }

    public void setPuntaje(double puntaje) {
        this.puntaje = puntaje;
    }

    public String getNombre() {
        return nombre;
    }
    
    
    
}
