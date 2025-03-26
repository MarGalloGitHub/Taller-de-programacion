/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialEscuelaCanto;

/**
 *
 * @author Usuario
 */
public class Estudiante {
    private String nombre;
    private String apellido;
    private int DNI;

    public Estudiante(String nombre, String apellido, int DNI) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.DNI = DNI;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public int getDNI() {
        return DNI;
    }
    
    @Override
    public String toString(){
        String aux = "La informacion de el estudiante ganador es:  " + "Nombre: " + this.nombre + "'n" + "Apellido: " + this.apellido + "\n" + "DNI: " + this.DNI;
        return aux;
    }
}
