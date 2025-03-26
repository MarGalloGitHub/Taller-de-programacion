/*
4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está 
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).
(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.
(ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre, 
DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/ 
2000 y 8000.
(iii) Implemente en las clases que corresponda todos los métodos necesarios para:
- Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está 
en el rango 1..N) y que la habitación está libre. 
- Aumentar el precio de todas las habitaciones en un monto recibido.
- Obtener la representación String del hotel, siguiendo el formato: 
{Habitación 1: costo, libre u ocupada, información del cliente si está ocupada} 
…
{Habitación N: costo, libre u ocupada, información del cliente si está ocupada}
B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones, 
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
NOTAS: Reúse la clase Persona. Para cada método solicitado piense a qué clase debe 
delegar la responsabilidad de la operación.
 */
package Tema3;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class ejercicio4 {
    public static void main(String[] args){
        System.out.println("ingrese la cantidad de habitaciones del hotel");
        Hotel edificio = new Hotel(Lector.leerInt());  // armado del hotel
        
        
        for(int j= 0; j<=1 ; j++){
            System.out.println("ingresar datos del cliente, nombre, dni y edad");  // ingreso 3 clientes
            Cliente cliente1 = new Cliente(Lector.leerString(),Lector.leerInt(),Lector.leerInt());
        
            System.out.println("¿En que habitacion desea hospedarse?");
            int e = Lector.leerInt();
        
            edificio.ingresarCliente(cliente1, e);  //agrego cliente al hotel
        
        }
        
        System.out.println(edificio.toString()); // mostrar edificio antes del ajuste
        
        
        System.out.println("cuanto aumenta el hotel por inflacion?");  // aumentar precio habitaciones
        double p = Lector.leerDouble();
        edificio.aumentarPrecio(p);
        
        
        System.out.println(edificio.toString()); // mostrar edificio despues del ajuste
    }
}
 // orgulloso papaaaaa