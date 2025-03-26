/*
Un proyecto 
tiene: nombre, código, nombre completo del director y los investigadores que participan 
en el proyecto (50 como máximo).

a. Un proyecto sólo debería poder construirse con el nombre, código, nombre del 
director.

a. void agregarInvestigador(Investigador unInvestigador); 
// agregar un investigador al proyecto.

 */
package RepasoEjercicio1;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private Investigador[] investigadores;
    private int dimL;

    public Proyecto(String nombre, int codigo, String nombreDirector) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        investigadores = new Investigador[50];
        
        for(int i= 0;i<=49;i++){                            //preguntar por inicializacion
            investigadores[i] = null;
        }
        dimL = 0;
    }
    
    public void agregarInvestigador(Investigador unInves){
        if(dimL <= 49){
            investigadores[dimL] = unInves;
            dimL++;
        }
    }
    
    /*
    c. double dineroTotalOtorgado();
    //devolver el monto total otorgado en subsidios del proyecto (tener en cuenta 
    todos los subsidios otorgados de todos los investigadores)
    */
    
    public double dineroTotalOtorgado(){
        double aux = 0;
        int i;
        for(i=0; i<= (dimL - 1); i++){
            aux += investigadores[i].dineroSubsidios();
        }
        return aux;
    }
    
    /*
    d. void otorgarTodos(String nombre_completo);
    //otorgar todos los subsidios no-otorgados del investigador llamado 
    nombre_completo
    */
    
    public void otorgarTodos(String nombreC){
        int i = 0;
        while((!(investigadores[i].getNombreCompleto().equals(nombreC))) && (i<= dimL)){
            i++;
         }
        if(((investigadores[i].getNombreCompleto().equals(nombreC))) && (i<= dimL)){
            for(int j= 0;j<= 4;j++){
                System.out.println("cargar datos del subsidio:  " + (j+1) + " que son el monto pedido y el motivo");
                Subsidio sub1 = new Subsidio(Lector.leerDouble(),Lector.leerString());
                investigadores[i].agregarSubsidio(sub1);
            }
        }
    }
    
    /*
    e. String toString();
    // devolver un string con: nombre del proyecto, código, nombre del director, el 
    total de dinero otorgado del proyecto y la siguiente información de cada 
    investigador: nombre, categoría, especialidad, y el total de dinero de sus 
    subsidios otorgados.
    */
    
    @Override
    public String toString(){
        String aux = "Nombre del proyecto:  " + this.nombre + "\n" + "Su codigo es:  " + this.codigo + "\n" + " El nombre del director es: " + this.nombreDirector + "\n" + "El dinero total otorgado en el proyecto es:  " + this.dineroTotalOtorgado() + "\n";
        for(int i= 0; i <= (dimL -1);i++){
            aux+= investigadores[i].toString() + "\n";
        }
        return aux;
    }
    
}

