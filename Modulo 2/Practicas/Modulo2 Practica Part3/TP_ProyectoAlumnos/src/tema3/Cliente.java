/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Usuario
 */
public class Cliente {
    private String nombre;
    private int DNI;
    private int edad;
    
    public Cliente(String unNombre , int unDNI, int unaEdad){
        nombre = unNombre;
        DNI= unDNI;
        edad = unaEdad;
    }

    public String getNombre() {
        return nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    @Override
    public String toString(){
        String aux = "Info cliente : " + nombre + DNI + edad;
        return aux;
    }
    
}
