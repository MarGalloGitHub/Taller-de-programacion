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
public abstract class Curso {
    private int anioCursada;
    private Alumno[] infoAlumnos;
    private int dF;
    private int dimL;
    private int alumnosPueden;

    public Curso(int anioCursada , int N) {
        this.anioCursada = anioCursada;
        this.infoAlumnos = new Alumno[N];
        this.dF = (N);
        this.dimL = 0;
        this.alumnosPueden = 0;
    }
    
    public boolean agregarAlumno (Alumno unAlumno){
        boolean aux = false;
        if(infoAlumnos[dimL] == null){
            infoAlumnos[dimL] = unAlumno;
            if(dimL < dF){
                dimL ++;
            }
            aux = true;
        }   
        return aux;
    }
    
    public void incrementarAsistencia(int dni){
        int i = 0;
        while((infoAlumnos[i] != null)&&(infoAlumnos[i].getDni() != dni) && (i < dimL))
            i++;
        if ((infoAlumnos[i] != null) && (infoAlumnos[i].getDni() == dni))
            infoAlumnos[i].subirAsistencia();      
    }
    
    public void aprobarAutoevaluacion(int dni){
        int i = 0;
        while((infoAlumnos[i] != null) &&(infoAlumnos[i].getDni() != dni) && (i < dimL))
            i++;
        if((infoAlumnos[i] != null) && (infoAlumnos[i].getDni() == dni))
            infoAlumnos[i].subirCantAutoEvaluaciones();
    }
   
    public abstract boolean puedeRendir(Alumno unAlumno);
    
    
    public abstract int cantidadAlumnosQuePuedenRendir();
      
}
