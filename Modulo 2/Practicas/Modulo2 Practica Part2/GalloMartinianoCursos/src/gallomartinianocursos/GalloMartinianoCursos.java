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
public class GalloMartinianoCursos {

    public static void main(String[] args) {
      
        CursoPresencial cursoP = new CursoPresencial(3,2023,5);
        CursoDistancia cursoD = new CursoDistancia("httptumama",2023,6);
        
        Alumno alumno1 = new Alumno (439 , "Colo");
        Alumno alumno12 = new Alumno (450 , "fede");
        Alumno alumno2 = new Alumno (464 , "grego");
        Alumno alumno21 = new Alumno (472 , "tomi");
        
        cursoP.agregarAlumno(alumno1);       //agrego 2 alumnos
        cursoP.agregarAlumno(alumno12);
        
        
        cursoP.incrementarAsistencia(439);  //agrego 2 alumnos
        cursoP.incrementarAsistencia(439);
        cursoP.incrementarAsistencia(439);
        cursoP.aprobarAutoevaluacion(439);
        
        
        cursoP.incrementarAsistencia(450);   //acomodo sus asistencias y autoevaluaciones
        cursoP.aprobarAutoevaluacion(450);
        
        cursoD.agregarAlumno(alumno2);
        cursoD.agregarAlumno(alumno21);
        
        cursoP.incrementarAsistencia(464);
        cursoP.aprobarAutoevaluacion(464);
        
        cursoP.incrementarAsistencia(472);
        cursoP.aprobarAutoevaluacion(472);
        
        cursoP.puedeRendir(alumno1);
        
        System.out.println("cantidad que pueden rendir presencial :  " + cursoP.cantidadAlumnosQuePuedenRendir());   //veo cuantos pueden rendir de cada uno
        System.out.println("cantidad que pueden rendir a distancia :  " + cursoD.cantidadAlumnosQuePuedenRendir());
        
        
        
    }
    
}
