/*
 * Un proyecto 
    tiene: nombre, código, nombre completo del director y los investigadores que participan 
    en el proyecto (50 como máximo).

    a. Un proyecto sólo debería poder construirse con el nombre, código, nombre del 
    director.

    a. void agregarInvestigador(Investigador unInvestigador); 
     agregar un investigador al proyecto.
     
     c. double dineroTotalOtorgado();
        devolver el monto total otorgado en subsidios del proyecto (tener en cuenta 
        todos los subsidios otorgados de todos los investigadores)

        d. void otorgarTodos(String nombre_completo);
        otorgar todos los subsidios no-otorgados del investigador llamado 
        nombre_completo

        e. String toString();
         devolver un string con: nombre del proyecto, código, nombre del director, el 
        total de dinero otorgado del proyecto y la siguiente información de cada 
        investigador: nombre, categoría, especialidad, y el total de dinero de sus 
        subsidios otorgados.

 */
package gallomartiniano;

/**
 *
 * @author Usuario
 */
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private Investigador [] investigadores;

    public Proyecto(String nombre, int codigo, String nombreDirector) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        this.investigadores = new Investigador[50];  // no lo inicializo en null porque lo hace java
    }
    
    int dimL = 0;
   
    public void agregarInvestigador(Investigador unInvestigador){
        int i= 0;
        while((investigadores[i] != null)&&(i < 50))
            i++;
        if(i <50){
            investigadores[i] = unInvestigador;
            dimL ++;
        }
    }
    
    public double dineroTotalOtorgado(){
        double aux = 0;
        int i;
        for(i= 0; i <= dimL ; i++)
            aux += investigadores[i].montoPorSubsidio();
        return aux;
    }
    
    @Override
    public String toString(){
        
        String aux2 = "La informacion de los investigadores es:    ";
        int i;
        for(i = 0 ; i < dimL ; i++)
            
            aux2 += investigadores[i].toString();
        
        String aux = nombre + codigo + nombreDirector + this.dineroTotalOtorgado() + aux2;
        
      
       return aux;
    }
    
}
