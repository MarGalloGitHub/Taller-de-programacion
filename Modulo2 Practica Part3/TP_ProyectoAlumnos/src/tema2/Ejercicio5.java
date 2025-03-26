/*
 * Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en 
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con 
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:
- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }                 preguntar
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local
 */
package tema2;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class Ejercicio5 {
    public static void main(String [] args){
        
        Partido [] vectorPARTIDOS;
        vectorPARTIDOS = new Partido[20];
        
        int cant = 0;
        
        Partido auxPARTIDO = new Partido();
        System.out.println("escriba quien es local");
        auxPARTIDO.setLocal(Lector.leerString());
        System.out.println("escriba quien es visitante");
        auxPARTIDO.setVisitante(Lector.leerString());
        
        if (!(auxPARTIDO.getVisitante().equals ("ZZZ"))){
            System.out.println("escriba los goles del local");
            auxPARTIDO.setGolesLocal(Lector.leerInt());
            System.out.println("escriba los goles del visitante");
            auxPARTIDO.setGolesVisitante(Lector.leerInt());
            
           
        }
      
        while(!(auxPARTIDO.getVisitante().equals ("ZZZ")) && (cant < 20)){
            
            vectorPARTIDOS[cant] = auxPARTIDO;
          
            System.out.println("escriba quien es local");
            auxPARTIDO.setLocal(Lector.leerString());
            System.out.println("escriba quien es visitante");
            auxPARTIDO.setVisitante(Lector.leerString());
        
            if (!(auxPARTIDO.getVisitante().equals ("ZZZ"))){
                System.out.println("escriba los goles del local");
                auxPARTIDO.setGolesLocal(Lector.leerInt());
                System.out.println("escriba los goles del visitante");
                auxPARTIDO.setGolesVisitante(Lector.leerInt());
      
                cant ++ ;
            }
            
        }
        
        int i;
        int cantRIVER = 0;
        int cantGolesBoca = 0;
        
        String partido;
        
        for(i=0 ; i < cant ; i++){
            String a = vectorPARTIDOS[i].getLocal() + vectorPARTIDOS[i].getGolesLocal()+ " VS " + vectorPARTIDOS[i].getVisitante() + vectorPARTIDOS[i].getGolesVisitante();
            System.out.println(a);
            
            if(vectorPARTIDOS[i].getGanador().equals("River"))
                cantRIVER ++;
            if(vectorPARTIDOS[i].getLocal().equals("Boca"))
                cantGolesBoca += vectorPARTIDOS[i].getGolesLocal();
            
        }
    
        System.out.println("cantidad de partidos que gano river, ponele lol :  "+ cantRIVER);
        System.out.println("Cantidad de goles que hizo boca de local:  "+ cantGolesBoca);
    }
    
}
