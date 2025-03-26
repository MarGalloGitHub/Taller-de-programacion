/*
 coro semicircular en el que los coristas se colocan en el escenario uno al lado 
del otro
 */
package RepasoEjercicio4;

/**
 *
 * @author Usuario
 */
public class CoroCircular extends Coro{
    private Corista[] escenario;
    private int asientos;
    private int dimL;

    public CoroCircular(int asientos, String nombre, Director director) {
        super(nombre, director);
        this.asientos = asientos;
        escenario = new Corista[asientos];
        dimL = 0;
        
    }
    
    /*
    b. Implemente métodos (en las clases donde corresponda) que permitan:
     agregar un corista al coro. 

    o En el coro semicircular los coristas se deben ir agregando de izquierda 
    a derecha
    */
    
    @Override
    public void agregarCorista(Corista unCorista){
       if(dimL <= (asientos - 1)){
           escenario[dimL] = unCorista;
           dimL++;
       }
    }
    
    @Override
    public boolean estaLlenoMaybe(){
      boolean aux = true;
      int i = 0;
      while((i<= (asientos - 1)) && (escenario[i] != null)){
          i++;
      }
      if((i<= (asientos - 1)) && (escenario[i] == null)){
          aux = false;
      }
      return aux;
    }
    
    /*
    En el caso del coro semicircular, de izquierda a derecha los coristas 
    están ordenados de mayor a menor en cuanto a tono fundamental.
    */
    
    // @Override
    public boolean bienOrganizado(){
        boolean aux = true;
        int i = 0;
        int max = escenario[i].getTonoFundamental();   //compara con el primero que se supone es el mayor
        for(i=0 ;i <= (asientos - 1);i++){
            if(escenario[i].getTonoFundamental() > max){
                aux = false;
            }
        }
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = super.toString();
        int i;
        for(i=0 ; i<= (asientos - 1) ; i++){
           aux += "\n" + "La informacion de este corista es la siguiente:  " + escenario[i].toString();
        }
        return aux;
    }
}
