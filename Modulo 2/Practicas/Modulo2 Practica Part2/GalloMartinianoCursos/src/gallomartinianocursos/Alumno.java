/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gallomartinianocursos;

/**
 *
 * @author Usuario
 */
public class Alumno {
    private int dni;
    private String nombre;
    private int asistencias;
    private int cantEvaluacionesAprobadas;

    public Alumno(int dni, String nombre) {
        this.dni = dni;
        this.nombre = nombre;
        this.asistencias = 0;
        this.cantEvaluacionesAprobadas = 0;
    }
    
    public void subirAsistencia(){
        this.asistencias ++;
    }

    public int getDni() {
        return dni;
    }
    
    public void subirCantAutoEvaluaciones(){
        this.cantEvaluacionesAprobadas += 1;
    }

    public int getAsistencias() {
        return asistencias;
    }

    public int getCantEvaluacionesAprobadas() {
        return cantEvaluacionesAprobadas;
    }
    
    
}
