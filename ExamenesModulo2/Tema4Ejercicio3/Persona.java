/*
 se caracterizan por nombre, DNI y edad;
 */
package Tema4Ejercicio3;

/**
 *
 * @author Usuario
 */
public class Persona {
    private String nombre;
    private int DNI;
    private int edad;

    public Persona(String nombre, int DNI, int edad) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
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
    
    /*
    Personas “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años”
    */

    @Override
    public String toString(){
        String aux = "Mi nombre es :  " + this.nombre + "  mi dni es:  " + this.DNI + "  y tengo  " + this.edad + "  años  ";
        return aux;
    }
    
}
