/*
 * 1- La UNLP desea administrar sus proyectos, investigadores y subsidios. Un proyecto 
tiene: nombre, código, nombre completo del director y los investigadores que participan 
en el proyecto (50 como máximo). De cada investigador se tiene: nombre completo, 
categoría (1 a 5) y especialidad. Además, cualquier investigador puede pedir hasta un 
máximo de 5 subsidios. De cada subsidio se conoce: el monto pedido, el motivo y si fue
otorgado o no.
i) Implemente el modelo de clases teniendo en cuenta:
a. Un proyecto sólo debería poder construirse con el nombre, código, nombre del 
director.
b. Un investigador sólo debería poder construirse con nombre, categoría y 
especialidad.
c. Un subsidio sólo debería poder construirse con el monto pedido y el motivo. 
Un subsidio siempre se crea en estado no-otorgado.
ii) Implemente los métodos necesarios (en las clases donde corresponda) que permitan:
a. void agregarInvestigador(Investigador unInvestigador); 
// agregar un investigador al proyecto.
b. void agregarSubsidio(Subsidio unSubsidio);
// agregar un subsidio al investigador.
c. double dineroTotalOtorgado();
//devolver el monto total otorgado en subsidios del proyecto (tener en cuenta 
todos los subsidios otorgados de todos los investigadores)
d. void otorgarTodos(String nombre_completo);
//otorgar todos los subsidios no-otorgados del investigador llamado 
nombre_completo
e. String toString();
// devolver un string con: nombre del proyecto, código, nombre del director, el 
total de dinero otorgado del proyecto y la siguiente información de cada 
investigador: nombre, categoría, especialidad, y el total de dinero de sus 
subsidios otorgados.
iii) Escriba un programa que instancie un proyecto con tres investigadores. Agregue dos 
subsidios a cada investigador y otorgue los subsidios de uno de ellos. Luego imprima 
todos los datos del proyecto en pantalla.

 */
package gallomartiniano;

/**
 *
 * 
 */
import PaqueteLectura.Lector;
public class GalloMartiniano {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        System.out.println("Escriba un nombre del proyecto");
        String nombreP = Lector.leerString();
        System.out.println("Escriba un codigo del proyecto");
        int codigoP= Lector.leerInt();
        System.out.println("Escriba un nombre del director del proyecto");
        String nombreDP = Lector.leerString();
       
        Proyecto proyect = new Proyecto(nombreP,codigoP,nombreDP);
        
        int i;
        for (i=0 ; i < 3 ; i++){
            double monto1 = Lector.leerDouble();           // armo subsidios
            String motivo1 = Lector.leerString();
            
            Subsidio subsi = new Subsidio(monto1,motivo1);
            
            double monto2 = Lector.leerDouble();
            String motivo2 = Lector.leerString();
            
            Subsidio subs2 = new Subsidio(monto2,motivo2);
            
            
            String nombre = Lector.leerString();
            int numero = Lector.leerInt();
            String especialidad = Lector.leerString();
                
            Investigador invest = new Investigador (nombre,numero,especialidad); 
            invest.agregarSubsidio(subsi); 
            invest.agregarSubsidio(subs2);    // armo investigador
                
            proyect.agregarInvestigador(invest);  //agrego investigador al proyecto
                
            }
           
        System.out.println(proyect.toString());
            
        }
        
    }
