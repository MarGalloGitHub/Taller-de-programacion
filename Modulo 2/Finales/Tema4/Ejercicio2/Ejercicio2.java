/*
 Queremos representar a los empleados de un club: jugadores y entrenadores.

 Cualquier empleado se caracteriza por su nombre, sueldo básico y antigüedad. 

 Los jugadores son empleados que se caracterizan por el número de partidos jugados y 
el número de goles anotados.

 Los entrenadores son empleados que se caracterizan por la cantidad de campeonatos 
ganados.

A- Implemente la jerarquía de clases declarando atributos, métodos para 
obtener/modificar su valor y constructores que reciban los datos necesarios.

B- Cualquier empleado debe responder al mensaje calcularEfectividad. La efectividad 
del entrenador es el promedio de campeonatos ganados por año de antigüedad, mientras 
que la del jugador es el promedio de goles por partido.

C- Cualquier empleado debe responder al mensaje calcularSueldoACobrar. El sueldo a 
cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad y además:

 Para los jugadores: si el promedio de goles por partido es superior a 0,5 se adiciona un 
plus de otro sueldo básico. 

 Para los entrenadores: se adiciona un plus por campeonatos ganados (5000$ si ha 
ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos;

50.000$ si ha ganado más de 10 campeonatos). 

D- Cualquier empleado debe responder al mensaje toString, que devuelve un String que 
lo representa, compuesto por nombre, sueldo a cobrar y efectividad.

F- Realizar un programa que instancie un jugador y un entrenador. Informe la 
representación String de cada uno.

 */
package Tema4.Ejercicio2;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class Ejercicio2 {
    public static void main(String[] args) {
        System.out.println("ingrese la informacion del jugador en este orden:  \n" + "partidos jugados, numero de goles, nombre, sueldo basico y antiguedad");
        Jugador jugador1 = new Jugador(Lector.leerInt(),Lector.leerInt(),Lector.leerString(),Lector.leerDouble(),Lector.leerInt());
        System.out.println("ingrese la informacion del entrenador en este orden:  \n" + "cantidad de torneos ganados, nombre, sueldo basico y antiguedad");
        Entrenador entrenador1 = new Entrenador(Lector.leerInt(),Lector.leerString(),Lector.leerDouble(),Lector.leerInt());
        
        System.out.println("informacion del jugador :    \n" + jugador1.toString());
        System.out.println("informacion del entrenador :    \n" + entrenador1.toString());
    }
}
