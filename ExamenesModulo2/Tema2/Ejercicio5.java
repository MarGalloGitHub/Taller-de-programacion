/*
Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un 
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin 
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el 
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto 
partido sabe responder a los siguientes mensajes:

getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X) modifica el nombre del equipo local al “String” X
setVisitante(X) modifica el nombre del equipo visitante al “String” X
setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna 
un String vacío). 
hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate


Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en 
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con 
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:

- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local.
 */
package Tema2;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class Ejercicio5 {
    public static void main(String[] args){
       int i;
       Partido[] partidos = new Partido[20];              //preguntar bien cuando iniciar vector en null
       
       for(i=0; i<=19; i++){
           partidos[i]= null;
       }
       
       System.out.println("llene la planilla con datos: equipo Local, equipo Visitante, goles Locales y goles Visitantes");
       Partido partido1 = new Partido(Lector.leerString(),Lector.leerString(),Lector.leerInt(),Lector.leerInt());
       
       int cantidad = 0;
       i = 0;
       while((!(partido1.getLocal().equals("ZZZ"))) && (!(partido1.getVisitante().equals("ZZZ"))) && (i<=19)){
          partidos[i] = partido1;
          i++;
          cantidad++;
          System.out.println("llene la planilla con datos: equipo Local, equipo Visitante, goles Locales y goles Visitantes");
          partido1 = new Partido(Lector.leerString(),Lector.leerString(),Lector.leerInt(),Lector.leerInt());
        
        }
       // int j = (cantidad - 1);   // se puede hacer?? a menos que me de 0
       int j= i;
       System.out.println("el valor de j es: "+ j);
       int ganoRiver = 0;
       int golesDeBoca = 0;
       if(j != 0){
       for(i=0 ; i <= j - 1; i++){
           System.out.println("el equipo local de esta fecha fue:   " + partidos[i].getLocal() + "     que realizo  " + partidos[i].getGolesLocal() + "   goles, mientras que el equipo visitante fue   "+ partidos[i].getVisitante()+ "   que metio  " + partidos[i].getGolesVisitante()+"    goles");
           if(partidos[i].getGanador().equals("River")){
               ganoRiver++;
           }
           if(partidos[i].getLocal().equals("Boca")){
               golesDeBoca += golesDeBoca + partidos[i].getGolesLocal();
           }   
           
       }
        
       System.out.println("River gano:    "+ ganoRiver + "   partidos");
       System.out.println("Como local Boca hizo:    "+  golesDeBoca+ "   goles");
    }
    }
}
