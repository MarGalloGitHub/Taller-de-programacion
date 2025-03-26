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
public class CursoPresencial extends Curso {
    private int numeroAula;
    private int cantRindenP;

    public CursoPresencial(int numeroAula, int anioCursada, int N) {
        super(anioCursada, N);
        this.numeroAula = numeroAula;
        this.cantRindenP = 0;
    }
    @Override
    public boolean puedeRendir(Alumno unAlumno){
         boolean aux = false;
         if(unAlumno != null){
            if(unAlumno.getAsistencias() >= 3) { 
                aux = true;
                cantRindenP ++;
                
            }
         }
         return aux;
     }
    @Override
     public int cantidadAlumnosQuePuedenRendir(){
         return cantRindenP;
     }
    
}
