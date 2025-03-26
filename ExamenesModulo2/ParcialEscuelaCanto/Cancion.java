/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialEscuelaCanto;

/**
 *
 * @author Usuario
 */
public class Cancion {
    private String nombre;
    private String compositor;
    private int identificador;
    private Estudiante estudianteGanador;
    private double puntaje;

    public Cancion(String nombre, String compositor, int identificador) {
        this.nombre = nombre;
        this.compositor = compositor;
        this.identificador = identificador;
        this.puntaje = 0;
        this.estudianteGanador = null; // aun no tiene un ganador
    }

    public String getNombre() {
        return nombre;
    }

    public String getCompositor() {
        return compositor;
    }

    public int getIdentificador() {
        return identificador;
    }

    public double getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(double puntaje) {
        this.puntaje = puntaje;
    }

    public Estudiante getEstudianteGanador() {
        return estudianteGanador;
    }
    

    public void setEstudianteGanador(Estudiante estudianteGanador) {
        this.estudianteGanador = estudianteGanador;
    }
    
    
    
    
}
