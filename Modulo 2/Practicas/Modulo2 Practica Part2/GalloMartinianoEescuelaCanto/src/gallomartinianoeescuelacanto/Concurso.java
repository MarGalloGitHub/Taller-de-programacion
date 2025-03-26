/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gallomartinianoeescuelacanto;

/**
 *
 * @author Usuario
 */
public class Concurso {
    private Cancion [][] sistema;
    private int cantCategorias;
    private int cantCancionesXcategoria;
    private int [] cantXcategoria;
    
    public Concurso(int X , int Y){
        this.sistema = new Cancion[X][Y];
        this.cantCancionesXcategoria = Y;
        this.cantCategorias = X;
        this.cantXcategoria = new int[X];
        int i;
        for(i= 0 ; i < X ; i++)
            cantXcategoria[i] = 0;
    }
    
    public void agregarCancion(Cancion unaCancion , int categoria){
        if(unaCancion != null){
            if(sistema[categoria][cantXcategoria[categoria]] == null){
                sistema[categoria][cantXcategoria[categoria]] = unaCancion;
            }
            if(cantXcategoria[categoria] < cantCancionesXcategoria){
                cantXcategoria[categoria]++;
            }
        }
            
    }
    
    public void interpretarCancion( int identi , Estudiante E , double puntaje){
        int i= 0;
        int j = 0;
        while((sistema[i][j].getNumeroIdentificador() != identi) && (i < cantCategorias)){
            while ((sistema[i][j].getNumeroIdentificador() != identi) && (j < cantXcategoria[i])){
                j++;
            }
        if((sistema[i][j].getNumeroIdentificador() == identi)){
            if(identi > sistema[i][j].getNumeroIdentificador()){
                sistema[i][j].setNumeroIdentificador(identi);
                sistema[i][j].setMejorInterpretacion(E);
            }
        }
        else
            i++;
        }
        if((sistema[i][j].getNumeroIdentificador() == identi)){
            if(identi > sistema[i][j].getNumeroIdentificador()){
                sistema[i][j].setNumeroIdentificador(identi);
                sistema[i][j].setMejorInterpretacion(E);
            }
        }
   }
    
    public Estudiante conocerGanador( int identi){
        Estudiante aux = null;
        int i= 0;
        int j = 0;
        while((sistema[i][j].getNumeroIdentificador() != identi) && (i < cantCategorias)){
            while ((sistema[i][j].getNumeroIdentificador() != identi) && (j < cantXcategoria[i])){
                j++;
            }
        if((sistema[i][j].getNumeroIdentificador() == identi)){
            if(sistema[i][j].getMejorInterpretacion() != null){
               aux = sistema[i][j].getMejorInterpretacion();
            }
        }
        else
            i++;
        }
        if((sistema[i][j].getNumeroIdentificador() == identi)){
            if(sistema[i][j].getMejorInterpretacion() != null){
               aux = sistema[i][j].getMejorInterpretacion();
            }
        }
        return aux;
   }
    
    public Cancion conocerCancionPuntajeMax(int categoriaC){
        Cancion aux = null;
        int i;
        double maxP = -1;
        for(i = 0 ; i < cantXcategoria[categoriaC] ; i++){
            if((sistema[categoriaC][i] != null) &&(sistema[categoriaC][i].getPuntajeDado() > maxP)){
                maxP = sistema[categoriaC][i].getPuntajeDado();
                aux = sistema[categoriaC][i];
            }
                
        }
        return aux;
    }
    
}
