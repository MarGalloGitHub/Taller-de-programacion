/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gallomartinianogoleadoressecond;

/**
 *
 * @author Usuario
 */
public class Torneo {
    private String nombre;
    private Goleador [][] tabla;
    private int [] cantGoleadoresXfecha;
    private int cantFechas;
    private int cantXfecha;

    public Torneo(String nombre , int N , int M) {
        this.nombre = nombre;
        this.tabla = new Goleador[N][M];
        this.cantGoleadoresXfecha = new int[N];
        int i;
        for(i = 0 ; i < N ; i++)
            cantGoleadoresXfecha[i] = 0;
        this.cantFechas = N;
        this.cantXfecha = M;
        
    }
    
    public void agregarGoleador(int X , Goleador unGoleador){
        if(unGoleador != null){
            tabla[X][cantGoleadoresXfecha[X]] = unGoleador;
            if(cantGoleadoresXfecha[X] < cantXfecha){
                cantGoleadoresXfecha[X]++;
            }
        }
    }
    
    public Goleador menosGolesHizo(int X){
      Goleador aux = null;
      int minGoles = 99;
      int i;
      for(i = 0 ; i < cantGoleadoresXfecha[X] ; i++)
          if(tabla[X][i].getCantGoles() < minGoles){
              minGoles = tabla[X][i].getCantGoles();
              aux = tabla[X][i];
          }
      return aux;
    }
    
    public int obtenerCantidadGoeladoresTorneo(){
        int aux = 0; 
        int i;
        for(i= 0 ; i < cantFechas ; i++)
            aux+= cantGoleadoresXfecha[i];
        return aux;
    }
    
    @Override
    public String toString(){
       String aux = "Torneo 2023" + nombre + "\n";
       int i;
       int j;
       for(i= 0 ; i < cantFechas ; i++){
           aux+= "Fecha # " + (i+1);
           aux+= "Cantidad de goleadores en esta fecha:    " + cantGoleadoresXfecha[i] + "   |    ";
           aux+= "Goleadores de la fecha:  ";
           for(j = 0 ; j < cantGoleadoresXfecha[i]; j++){
               aux+= tabla[i][j].toString();
                       }
           aux+= "\n";
       }
       return  aux;
    }
}
