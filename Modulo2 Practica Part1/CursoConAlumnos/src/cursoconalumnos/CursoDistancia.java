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
public class CursoDistancia extends Curso{
    private String linkAula;

    public CursoDistancia(String linkAula, int añoCursada, int N) {
        super(añoCursada, N);
        this.linkAula = linkAula;
    }
    
    @Override
    public boolean puedeRendir(Alumno unAlumno){
       boolean aux = false;
       if((unAlumno.getCantAprobadas() > 3) && (unAlumno.getAsistencias() >= 1))
          aux = true;
       return aux;
    }
    
    @Override
    public int cantidadDeAlumnosQuePuedeRendir(){
        int i;
        int cant = 0;
        for (i = 0 ; i < this.getDimL() ; i++ )
            if(this.puedeRendir(this.getInfoAlumnos()[i]))
                cant += 1;
        return cant;
    }
}
