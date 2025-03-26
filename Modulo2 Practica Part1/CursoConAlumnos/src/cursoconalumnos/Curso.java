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
public abstract class Curso {
    private int añoCursada;
    private Alumno[] infoAlumnos;
    private int cantAlumnos;
    private int dimL;

    public Curso(int añoCursada , int N) {
        this.añoCursada = añoCursada;
        this.infoAlumnos = new Alumno[N];  // no inicializo porque lo hace java
        this.cantAlumnos = N;
        this.dimL = 0;
    }
    
    
    public boolean agregarAlumno(Alumno unAlumno){
        boolean aux = false;
        int i = 0;
        while((infoAlumnos[i] != null) && (i < cantAlumnos))
            i++;
        if((infoAlumnos[i] == null) && (i < cantAlumnos)){
            infoAlumnos[i] = unAlumno;
            dimL += 1;
            aux = true;
        }
        return aux;
    }
    
    public void incrementarAsistencia(int unDNI){
        int i = 0;
        while((infoAlumnos[i].getDni()!= unDNI)&& (i < cantAlumnos))
            i++;
        if((infoAlumnos[i].getDni()== unDNI)&& (i < cantAlumnos)) 
            infoAlumnos[i].aumentarAsistencias();
            
    }       
    
    public void aprobarAutoevaluacion (int unDNI){
        int i = 0;
        while((infoAlumnos[i].getDni()!= unDNI)&& (i < cantAlumnos))
            i++;
        if((infoAlumnos[i].getDni()== unDNI)&& (i < cantAlumnos)) 
            infoAlumnos[i].aumentarEvaluaciones();
    }

    public int getDimL() {
        return dimL;
    }

    public Alumno[] getInfoAlumnos() {
        return infoAlumnos;
    }
   
    
    
    public abstract boolean puedeRendir (Alumno unAlumno);
   
    public abstract int cantidadDeAlumnosQuePuedeRendir();
     
    
}
