/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cursoconalumnos;

/**
 *
 * @author Usuario
 */
public class Alumno {
    private int dni;
    private String nombre;
    private int asistencias;
    private int cantAprobadas;

    public Alumno(int dni, String nombre) {
        this.dni = dni;
        this.nombre = nombre;
        this.asistencias = 0;
        this.cantAprobadas = 0;
    }

    public int getDni() {
        return dni;
    }

    public String getNombre() {
        return nombre;
    }

    public int getAsistencias() {
        return asistencias;
    }

    public int getCantAprobadas() {
        return cantAprobadas;
    }
    
    public void aumentarAsistencias(){
        asistencias += 1;
    }
    
    public void aumentarEvaluaciones(){
        cantAprobadas += 1;
    }
}
