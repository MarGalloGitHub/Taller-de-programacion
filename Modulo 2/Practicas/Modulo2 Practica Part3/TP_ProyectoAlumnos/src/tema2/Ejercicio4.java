/*
 * - Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el 
siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación. 
La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos 
de casting.
Una vez finalizada la inscripción:
b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la 
persona a entrevistar en cada turno asignado.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

/**
                                        Preguntar Si me falto algo
 * @author Usuario
 */
public class Ejercicio4 {
    public static void main(String [] args){

        GeneradorAleatorio.iniciar();
        
        Persona [][] matrizHORARIOS;
        matrizHORARIOS = new Persona[5][8];
        
        
        
        Persona aux = new Persona(GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarInt(255),GeneradorAleatorio.generarInt(55));
      
        int contador = 0;
        
        while((contador != 40) && !(aux.getNombre().equals("ZZZ") )){
            int turno = 0;
            contador ++;
            int dia = GeneradorAleatorio.generarInt(5);
            if(matrizHORARIOS[dia][turno]== null){
                matrizHORARIOS[dia][turno] = aux;
            }
            else {
                 while((matrizHORARIOS[dia][turno]!= null)&&(turno <7))
                     turno++;
                 matrizHORARIOS[dia][turno]= aux;
            }
                
            aux = new Persona(GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarInt(255),GeneradorAleatorio.generarInt(55));   
        }
        int i;   
        int j;
        for (i= 0; i< 5 ; i++){
            int cantidad = 0; 
            for (j= 0 ; j < 8 ; j++){
                if(matrizHORARIOS[i][j] != null){
                    System.out.println("el nombre de la persona a entrevistar en el dia :   "+ (i+1)+ "   y en el turno   "+ (j+1)+"  es  "+ matrizHORARIOS[i][j].getNombre());
                    cantidad ++;
                }  
                else
                    System.out.println("en este horario no viene nadie");
  
            }
            System.out.println("para el dia : "+ (i+1)+"   fueron entrevistadas "+ cantidad + "personas");
        }
    }
}
