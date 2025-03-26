/*
 *3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en 
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
package tema2;

/**
 *                                                                       Preguntar
 * @author Usuario
 */
import PaqueteLectura.GeneradorAleatorio;
public class Ejercicio3 {
    public static void main(String [] args ){
        GeneradorAleatorio.iniciar();
        
        Persona [][] matrizHORARIOS;
        matrizHORARIOS = new Persona[5][8];
        
        
        
        Persona aux = new Persona(GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarInt(255),GeneradorAleatorio.generarInt(55));
        int dia = 0;
        int turno = 0;
        int contador = 0;
        
        while((contador != 40) && !(aux.getNombre().equals("ZZZ") )){
            if(turno < 8){
                matrizHORARIOS[dia][turno] = aux;
                contador++;
                turno++;
            }
            else {
                turno = 0;
                if(dia < 5)
                    dia ++;
            }
            aux = new Persona(GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarInt(255),GeneradorAleatorio.generarInt(55));    
            
            }
        int i;   
        int j;
        for (i= 0; i< 5 ; i++)
            for (j= 0 ; j < 8 ; j++){
                if(matrizHORARIOS[i][j] != null)
                    System.out.println("el nombre de la persona a entrevistar en el dia :   "+ (i+1)+ "   y en el turno   "+ (j+1)+"  es  "+ matrizHORARIOS[i][j].getNombre());
                else
                    System.out.println("en este horario no viene nadie");
            }  
        }  
}
