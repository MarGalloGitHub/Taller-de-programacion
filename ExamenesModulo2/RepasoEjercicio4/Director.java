/*
Del director se 
conoce el nombre, DNI, edad y la antigüedad (un número entero).
 */
package RepasoEjercicio4;

/**
 *
 * @author Usuario
 */
public class Director {
    private String nombre;
    private int DNI;
    private int edad;
    private int antiguedad;

    public Director(String nombre, int DNI, int edad, int antiguedad) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
        this.antiguedad = antiguedad;
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

    public int getAntiguedad() {
        return antiguedad;
    }
    
    
    @Override
    public String toString(){
        String aux = "Nombre del director: " + this.nombre + ", su DNI es  " + this.DNI + ", su edad es  " + this.edad + ", y tiene una antiguedad de  " +  this.antiguedad + "  años";
        return aux;
    }
    
}
