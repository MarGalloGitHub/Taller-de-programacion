/*
 De los coristas se conoce 
el nombre, DNI, edad y el tono fundamental (un número entero).
 */
package RepasoEjercicio4;

/**
 *
 * @author Usuario
 */
public class Corista {
  private String nombre;
  private String DNI;
  private int edad;
  private int tonoFundamental;

    public Corista(String nombre, String DNI, int edad, int tonoFundamental) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
        this.tonoFundamental = tonoFundamental;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }
  
    @Override
    public String toString(){
        String aux = "\n" + "Su nombre es : " + this.nombre + ", su DNI es  " + this.DNI + ", tiene una edad de  " + this.edad + "  años" + " y su tono fundamental es  " + this.tonoFundamental;
        return aux;
    }
    
}
