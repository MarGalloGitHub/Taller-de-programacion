/*
 Un evento ocasional es un recital que además tiene el motivo (a beneficio, show de TV 
o show privado), el nombre del contratante del recital y el día del evento.

 El constructor de eventos ocasionales además 
recibe el motivo, el nombre del contratante y día del evento.
 */
package RepasoEjercicio3;

/**
 *
 * @author Usuario
 */
public class EventoOcasional extends Recital{
    private String motivo;
    private String nombreContratante;
    private int diaEvento;

    public EventoOcasional(String motivo, String nombreContratante, int diaEvento, String nombreBanda, int cantidadPosibleTemas) {
        super(nombreBanda, cantidadPosibleTemas);
        this.motivo = motivo;
        this.nombreContratante = nombreContratante;
        this.diaEvento = diaEvento;
    }

    

/* iii. El evento ocasional debe saber responder al mensaje actuar de manera distinta:

 Si es un show de beneficencia se imprime la leyenda “Recuerden colaborar con…“ 
seguido del nombre del contratante. 

 Si es un show de TV se imprime “Saludos amigos televidentes” 

 Si es un show privado se imprime “Un feliz cumpleaños para…” seguido del 
nombre del contratante. 
    
Independientemente del motivo del evento, luego se imprime el listado de temas como 
lo hace cualquier recital.    
*/    
    
 @Override   
 public String actuar(){
    String aux = "Para este evento" + "\n";
    if(motivo.equals("beneficio")){
        aux+= "Recuerden colaborar con: " + this.nombreContratante + "\n";
    }
    else 
        if(motivo.equals("show de TV")){
            aux+= "Saludos amigos televidentes" + "\n";
        }
        else
            if(motivo.equals("privado")){
                aux+= "Un feliz cunpleaños para  " + this.nombreContratante + "\n";
            }
    aux+= super.actuar();
    return aux;
 }   
 
 /*
 Si es un evento ocasional devuelve 0 si es a beneficio, 50000 si es un show de TV 
    y 150000 si es privado.
 */
 
 @Override
 public  double calcularCosto(){
     double aux = 0;
     if(this.motivo.equals("beneficio")){
         aux = 0;
     }
     else
         if(this.motivo.equals("show de TV")){
             aux += 50000;
         }
         else
             if(this.motivo.equals("privado")){
                 aux+= 150000;
             }
     return aux;
 }
    
}
