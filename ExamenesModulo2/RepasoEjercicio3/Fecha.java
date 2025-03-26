/*
De cada “fecha” se conoce la ciudad y el día.
 */
package RepasoEjercicio3;

/**
 *
 * @author Usuario
 */
public class Fecha {
    private String ciudad;
    private int dia;

    public Fecha(String ciudad, int dia) {
        this.ciudad = ciudad;
        this.dia = dia;
    }

    public String getCiudad() {
        return ciudad;
    }

    public int getDia() {
        return dia;
    }
    
    
}
