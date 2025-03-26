/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalfabricaautomotriz;

/**
 *
 * @author Usuario
 */
public class Empleado {
    private String nombre;
    private String apellido;
    private int antiguedad;

    public Empleado(String nombre, String apellido, int antiguedad) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.antiguedad = antiguedad;
    }
    
    public int getAntiguedad(){
        return this.antiguedad;
    }
    
    @Override
    public String toString(){
        String valor = "Nombre: " + this.nombre + " | Apellido: " + this.apellido + " | Antiguedad: " + this.antiguedad;
        return valor;
    }
    
}
