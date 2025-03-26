/*
 Una gira es un recital que además tiene un nombre y las “fechas” donde se repetirá la 
actuación. De cada “fecha” se conoce la ciudad y el día. Además la gira guarda el 
número de la fecha en la que se tocará próximamente (actual).

El constructor de giras 
además recibe el nombre de la gira y la cantidad de fechas que tendrá.


 */
package RepasoEjercicio3;

/**
 *
 * @author Usuario
 */
public class Gira extends Recital{
    private String nombreGira;
    private Fecha[] fechas;
    private int FechaActual;   // indice del vector o algo asi
    private int cantidadFechas;
    private int dimFechas;

    public Gira(String nombreGira, int cantidadFechas, String nombreBanda, int cantidadPosibleTemas) {
        super(nombreBanda, cantidadPosibleTemas);
        this.nombreGira = nombreGira;
        this.cantidadFechas = cantidadFechas;
        fechas = new Fecha[cantidadFechas];
        dimFechas = 0;
    }

    
    /*
    ii. La gira debe saber responder a los mensajes:
 agregarFecha que recibe una “fecha” y la agrega adecuadamente.

 La gira debe responder al mensaje actuar de manera distinta. Imprime la leyenda 
“Buenas noches …” seguido del nombre de la ciudad de la fecha “actual”. Luego 
debe imprimir el listado de temas como lo hace cualquier recital. Además debe 
establecer la siguiente fecha de la gira como la nueva “actual”.
    */
   
    public void agregarFecha (Fecha fecha){
        if(dimFechas <= (cantidadFechas - 1)){
            fechas[dimFechas] = fecha;
            dimFechas++;
        }
    }
    
    @Override
    public String actuar(){
        String aux = "Buenas noches" + this.fechas[dimFechas - 1].getCiudad() + "\n";
        aux += super.actuar();
        return aux;
    }
    
    /*
    Todo recital debe saber responder al mensaje calcularCosto
    Las giras deben devolver 30000 por cada fecha de la misma.
    */
    
    @Override
    public double calcularCosto(){
      int i;
      double aux = 0;
      for(i=0; i<= (dimFechas - 1); i++){
          aux+= 30000;
      }
      return aux;
    }
}
