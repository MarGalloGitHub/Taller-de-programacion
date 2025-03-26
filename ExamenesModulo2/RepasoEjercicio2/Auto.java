/*
De los autos se conoce 
nombre del dueño y patente.
 */
package RepasoEjercicio2;

/**
 *
 * @author Usuario
 */
public class Auto {
    private String nombreDueño;
    private int patente;

    public Auto(String nombreDueño, int patente) {
        this.nombreDueño = nombreDueño;
        this.patente = patente;
    }

    public String getNombreDueño() {
        return nombreDueño;
    }

    public int getPatente() {
        return patente;
    }
    
    @Override
    public String toString(){
       String aux = "Nombre del dueño del auto" + this.nombreDueño + ", y la patente del auto es: " + this.patente ;
       return aux;
    }
    
}
