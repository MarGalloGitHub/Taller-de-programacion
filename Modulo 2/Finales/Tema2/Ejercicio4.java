/*
 - Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:

a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el 
siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación. 
La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos 
de casting.
Una vez finalizada la inscripción:

b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la 
persona a entrevistar en cada turno asignado.
 */
package Tema2;

import PaqueteLectura.Lector;

/**
 *
 * @author Usuario
 */
public class Ejercicio4 {
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
        System.out.println("que dia podes venir?");
        int dia = Lector.leerInt() - 1;  //preguntar
        int cupos = 0;
        while(!(entrevistado.getNombre().equals("ZZZ")) && (cupos <= 40)){   //preguntar si esta bien el !
            j = 0;
            while((turnos[dia][j] != null) && (j<=7)){
                j++;
            }
            if((turnos[dia][j] == null) && (j<=7)){
                turnos[dia][j] = entrevistado;
                cupos++;
            }
            else{
                System.out.println("no hay turno para vos");
            }               
            System.out.println("datos del entrevistado: nombre, dni y por ultimo edad");
            entrevistado = new Persona(Lector.leerString(),Lector.leerInt(),Lector.leerInt());
            System.out.println("que dia podes venir?");
            dia = Lector.leerInt();
           }
        for(i=0; i <= 4; i++){
            for(j=0; j<= 7; j++){
                if(turnos[i][j] != null){
                    System.out.println("para el dia :  "+ (i+1)+ "   y turno:  "+ (j+1)+ "está:  "+ turnos[i][j].getNombre());
                }
                else
                    System.out.println(" para el dia :  "+ (i+1)+ "   y turno:  "+ (j+1)+ "no hay nadie citado para este horario ");
            }
        }
    }
}
