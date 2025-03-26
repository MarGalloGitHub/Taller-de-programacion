/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gallomartinianoeescuelacanto;

/**
 *
 * @author Usuario
 */
public class Estudiante {
    private String nombre;
    private String apellido;
    private int dni;

    public Estudiante(String nombre, String apellido, int dni) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
    }
    
    @Override
    public String toString(){
        String aux = nombre + apellido + dni;
        return aux;
    }
}
