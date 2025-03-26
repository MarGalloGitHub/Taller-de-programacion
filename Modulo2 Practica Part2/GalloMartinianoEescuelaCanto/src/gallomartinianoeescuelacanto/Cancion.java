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
public class Cancion {
    private String nombre;
    private String compositor;
    private int numeroIdentificador;
    private Estudiante mejorInterpretacion;
    private double puntajeDado;

    public Cancion(String nombre, String compositor, int numeroIdentificador) {
        this.nombre = nombre;
        this.compositor = compositor;
        this.numeroIdentificador = numeroIdentificador;
        this.mejorInterpretacion = null;
        this.puntajeDado = 0;
    }

    public int getNumeroIdentificador() {
        return numeroIdentificador;
    }

    public void setNumeroIdentificador(int numeroIdentificador) {
        this.numeroIdentificador = numeroIdentificador;
    }

    public void setMejorInterpretacion(Estudiante mejorInterpretacion) {
        this.mejorInterpretacion = mejorInterpretacion;
    }

    public Estudiante getMejorInterpretacion() {
        return mejorInterpretacion;
    }

    public double getPuntajeDado() {
        return puntajeDado;
    }
    
    
    
}
