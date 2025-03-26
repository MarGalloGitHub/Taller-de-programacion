/*
coro por hileras donde los coristas se organizan en filas de igual dimensión.
 */
package RepasoEjercicio4;

/**
 *
 * @author Usuario
 */
public class CoroHileras extends Coro{
   private Corista[][] escenario;
   private int filas;
   private int asientos;
   private int[]dimensiones;

    public CoroHileras(int filas, int asientos, String nombre, Director director) {
        super(nombre, director);
        this.filas = filas;
        this.asientos = asientos;
        escenario = new Corista[filas][asientos];
        dimensiones = new int[filas];
        for(int i=0; i<=(filas-1);i++){
            dimensiones[i] = 0;
        }
    }
   
   /*
    b. Implemente métodos (en las clases donde corresponda) que permitan:
     agregar un corista al coro. 

    o En el coro por hileras los coristas se deben ir agregando de izquierda a 
    derecha, completando la hilera antes de pasar a la siguiente.
    */
    
    @Override
    public void agregarCorista(Corista unCorista){
        int i=0;
        int j=0;
        while((i<=(filas - 1)) && (escenario[i][j]) != null){
            while((j<= dimensiones[i])&& (escenario[i][j]) != null){
                j++;
            }
         i++;
        }
        if((i<=(filas - 1)) && ((j<= dimensiones[i])) && ((escenario[i][j]) == null)){
            escenario[i][dimensiones[i]] = unCorista;
            dimensiones[i]++;
        }
    }
    
    @Override
    public boolean estaLlenoMaybe(){
       boolean aux = true;
       int i=0;
       int j=0;
       while((i<=(filas - 1)) && (escenario[i][j] != null)){
           while((j<=(asientos - 1)) && (escenario[i][j] != null)){
               j++;
           }
           i++;
        }
       if((i<=(filas - 1)) &&(j<=(asientos - 1)) &&(escenario[i][j] == null)){
           aux = false;
       }
       return aux;
    }
    
    /*
    En el caso del coro por hileras, todos los miembros de una misma hilera 
    tienen el mismo tono fundamental y además todos los primeros
    miembros de cada hilera están ordenados de mayor a menor en cuanto 
    a tono fundamental.
    */
    
    // @Override
    public boolean bienOrganizado(){
        boolean aux = true;
        int i;
        int j;
        int maxFilas = escenario[0][0].getTonoFundamental();
        int maxAsientos;
        for(i=0 ; i <= (filas - 1 ); i++){
            maxAsientos = escenario[i][0].getTonoFundamental();
            for(j=0 ; j <= (asientos - 1) ; j++){
                if(escenario[i][j].getTonoFundamental() > maxAsientos){
                    aux = false;
                }
            }
        if(escenario[i][0].getTonoFundamental() > maxFilas){
            aux = false;
            }
        } 
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = super.toString();
        int i;
        int j;
        for(i=0 ; i<= (filas - 1) ; i++){
            for(j=0 ; j <= (dimensiones[i] - 1) ; j++){
                aux += "\n" + "La informacion de este corista es la siguiente:  " + escenario[i][j].toString();
            }
        }
        return aux;
    }
    
}
