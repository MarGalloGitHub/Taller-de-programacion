/*
Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en 
cada día se entrevistarán a 8 personas en distinto turno.

a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así 
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 
40 cupos de casting.
Una vez finalizada la inscripción: 

b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar 
Strings use el método equals.

 */
package Tema2;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class Ejercicio3 {
    public static void main(String[] args){
        Persona[][] turnos = new Persona[5][8];
        
        int i;                                            //preguntar si esta bien iniciar en null
        int j;
        for(i=0 ; i<=4 ; i++){
            for(j=0; j<=7 ; j++){
                turnos[i][j] = null;
            }
        }
        
        System.out.println("datos del entrevistado: nombre, dni y por ultimo edad");
        Persona entrevistado = new Persona(Lector.leerString(),Lector.leerInt(),Lector.leerInt());
  
        i = 0;
        int cupos = 0;
        while(!(entrevistado.getNombre().equals("ZZZ")) && (cupos <= 40) && (i <= 4)){   //preguntar si esta bien el !
           j = 0;
           while((!(entrevistado.getNombre().equals("ZZZ"))) && (cupos <= 40) && (j <= 7)){
               turnos[i][j] = entrevistado;
               System.out.println("datos del entrevistado: nombre, dni y por ultimo edad");
               entrevistado = new Persona(Lector.leerString(),Lector.leerInt(),Lector.leerInt());
               j++;
               cupos++;
           }
           i++;
        }
        for(i=0; i <= 4; i++){
            for(j=0; j<= 7; j++){
                if(turnos[i][j] != null){
                    System.out.println("para el dia :  "+ (i+1)+ "   y turno:  "+ (j+1)+ "está:  "+ turnos[i][j].getNombre());
                }
                else
                    System.out.println(" para el dia :  "+ (i+1)+ "   y turno:  "+ (j+1)+ "no hay nadie citado para este ");
            }
        }
    }
}
