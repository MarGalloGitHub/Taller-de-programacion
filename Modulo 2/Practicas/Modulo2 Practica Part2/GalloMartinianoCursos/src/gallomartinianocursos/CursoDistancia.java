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
public class CursoDistancia extends Curso {
    private String link;
    private int cantRinden;

    public CursoDistancia(String link, int anioCursada, int N) {
        super(anioCursada, N);
        this.link = link;
        this.cantRinden  = 0;
    }
     @Override
     public boolean puedeRendir(Alumno unAlumno){
         boolean aux = false;
         if(unAlumno != null){
            if((unAlumno.getAsistencias() >= 1)  && (unAlumno.getCantEvaluacionesAprobadas() >= 3)){
                aux = true;
                cantRinden++;
            }
         }
         return aux;
     }
     
     @Override
     public int cantidadAlumnosQuePuedenRendir(){
         return cantRinden;
     }
    
    
}
