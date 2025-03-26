/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialfede;

/**
 *
 * @author Usuario
 */
public class Concurso {
    private Alumno [][] concurso;
    private int cantColumnas;
    
    public Concurso (int N){
        this.concurso = new Alumno[5][N]; // no inicializo lo hace java
        this.setCantColumnas(N);
    }
    
    public void inscribirAlumno(Alumno unAlumno, int Genero){
        int i= 0;
        while((concurso[Genero][i]!= null) && (i < cantColumnas))
             i++;
        if(i < cantColumnas)
            concurso[Genero][i] = unAlumno;
            
    }
    
    public void asignarPuntaje(double puntaje , String nombre){
        int i= 0;
        int j=0;
        while((!(concurso[i][j].getNombre().equals(nombre))) && (i < 5)){
            
            while(!(concurso[i][j].getNombre().equals(nombre))&&(j < cantColumnas)){
                 if((concurso[i][j].getNombre().equals(nombre)))
                    concurso[i][j].setPuntaje(puntaje);
                 j++;
               
            }
            
            i++;
        }
    }
            
    
    private void setCantColumnas(int N){
        cantColumnas = N;
    }
}
