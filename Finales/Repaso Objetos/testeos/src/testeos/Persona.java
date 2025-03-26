/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testeos;

/**
 *
 * @author Usuario
 */
public class Persona {
    private String nombre;
    private int dni;

    public Persona(String nombre, int dni) {
        this.nombre = nombre;
        this.dni = dni;
    }
    
    @Override
    public String toString(){
        String dato = "Nombre:" + this.nombre + "|"+ "Dni:" + this.dni;
        return dato;
    }
}
