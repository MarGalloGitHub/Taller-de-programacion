/*
Una escuela de música arma coros para participar de ciertos eventos. Los coros poseen 
un nombre y están formados por un director y una serie de coristas. Del director se 
conoce el nombre, DNI, edad y la antigüedad (un número entero). De los coristas se conoce 
el nombre, DNI, edad y el tono fundamental (un número entero). Asimismo, hay dos tipos 
de coros: coro semicircular en el que los coristas se colocan en el escenario uno al lado 
del otro y coro por hileras donde los coristas se organizan en filas de igual dimensión.

a. Implemente las clases necesarias teniendo en cuenta que los coros deberían crearse 
con un director y sin ningún corista, pero sí sabiendo las dimensiones del coro.

b. Implemente métodos (en las clases donde corresponda) que permitan:
 agregar un corista al coro. 

o En el coro semicircular los coristas se deben ir agregando de izquierda 
a derecha

o En el coro por hileras los coristas se deben ir agregando de izquierda a 
derecha, completando la hilera antes de pasar a la siguiente.

 determinar si un coro está lleno o no. Devuelve true si el coro tiene a todos sus 
coristas asignados o false en caso contrario.

 determinar si un coro (se supone que está lleno) está bien formado. Un coro 
está bien formado si:

o En el caso del coro semicircular, de izquierda a derecha los coristas 
están ordenados de mayor a menor en cuanto a tono fundamental.

o En el caso del coro por hileras, todos los miembros de una misma hilera 
tienen el mismo tono fundamental y además todos los primeros
miembros de cada hilera están ordenados de mayor a menor en cuanto 
a tono fundamental.

 devolver la representación de un coro formada por el nombre del coro, todos 
los datos del director y todos los datos de todos los coristas.

c. Escriba un programa que instancie un coro de cada tipo. Lea o bien la cantidad de 
coristas (en el caso del coro semicircular) o la cantidad de hileras e integrantes por 
hilera (en el caso del coro por hileras). Luego cree la cantidad de coristas necesarios,
leyendo sus datos, y almacenándolos en el coro. Finalmente imprima toda la 
información de los coros indicando si están bien formados o no
 */
package RepasoEjercicio4;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class Ejercicio4 {
    public static void main(String[] args){
        GeneradorAleatorio.iniciar();
        /*System.out.println("Cargar informacion del primer director: NOMBRE, DNI, EDAD Y ANTIGUEDAD ");
        Director director1 = new Director(Lector.leerString(),Lector.leerInt(),Lector.leerInt(),Lector.leerInt());
        System.out.println("Cargar informacion del segundo director: NOMBRE, DNI, EDAD Y ANTIGUEDAD ");
        Director director2 = new Director(Lector.leerString(),Lector.leerInt(),Lector.leerInt(),Lector.leerInt());
        */
        
        Director director1 = new Director(GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarInt(8),GeneradorAleatorio.generarInt(7),GeneradorAleatorio.generarInt(7));
        Director director2 = new Director(GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarInt(5),GeneradorAleatorio.generarInt(7),GeneradorAleatorio.generarInt(7));
        
        System.out.println("Cargar informacion del coroCircular: NUMERO DE  ASIENTOS Y NOMBRE DEL CORO ");
        // int numAsientos = Lector.leerInt();
        
        int numAsientos = GeneradorAleatorio.generarInt(9);
        
        // CoroCircular coroC = new CoroCircular(numAsientos,Lector.leerString(),director1);
        
        CoroCircular coroC = new CoroCircular(numAsientos,GeneradorAleatorio.generarString(5),director1);
        
        System.out.println("Cargar informacion del coroHILERAS: NUMERO DE FILAS, NUMERO DE ASIENTOS Y NOMBRE DEL CORO ");
        /*int numFilas = Lector.leerInt();
        int numAsientos2 = Lector.leerInt();
        CoroHileras coroH = new CoroHileras(numFilas,numAsientos2,Lector.leerString(),director2);
        */
        
        int numFilas = GeneradorAleatorio.generarInt(3);
        int numAsientos2 = GeneradorAleatorio.generarInt(3);
        CoroHileras coroH = new CoroHileras(numFilas,numAsientos2,GeneradorAleatorio.generarString(5),director2);
        
        int i;
        int j;
        
        /*
        for(i=0; i<= (numAsientos - 1); i++){
            System.out.println("Cargar informacion de un corista: NOMBRE, DNI, EDAD Y NUMERO DE TONO FUNDAMENTAL ");
            Corista coris1 = new Corista(Lector.leerString(),Lector.leerString(),Lector.leerInt(),Lector.leerInt());
            coroC.agregarCorista(coris1);
        }
        */
        
        for(i=0; i<= (numAsientos - 1); i++){
            System.out.println("Cargar informacion de un corista: NOMBRE, DNI, EDAD Y NUMERO DE TONO FUNDAMENTAL ");
            Corista coris1 = new Corista(GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarInt(5),GeneradorAleatorio.generarInt(5));
            coroC.agregarCorista(coris1);
        }
        
        /*
        for(i=0; i<= (numFilas - 1); i++){
            for(j=0 ; j<= (numAsientos2 - 1); j++){
                System.out.println("Cargar informacion de un corista: NOMBRE, DNI, EDAD Y NUMERO DE TONO FUNDAMENTAL ");
                Corista coris2 = new Corista(Lector.leerString(),Lector.leerString(),Lector.leerInt(),Lector.leerInt());
                coroH.agregarCorista(coris2);
            }
        }
        */
        for(i=0; i<= (numFilas - 1); i++){
            for(j=0 ; j<= (numAsientos2 - 1); j++){
                System.out.println("Cargar informacion de un corista: NOMBRE, DNI, EDAD Y NUMERO DE TONO FUNDAMENTAL ");
                Corista coris2 = new Corista(GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarInt(5),GeneradorAleatorio.generarInt(5));
                coroH.agregarCorista(coris2);
            }
        System.out.println(coroC.toString());
        if(coroC.estaLlenoMaybe()){
            if(coroC.bienOrganizado()){
                System.out.println("El coro circular esta bien ordenado");
            }
            else
                System.out.println("El coro circular no esta bien ordenado");
        }
        else
            System.out.println("El coro circular no esta lleno");
        
        System.out.println(coroH.toString());
        if(coroH.estaLlenoMaybe()){
            if(coroH.bienOrganizado()){
                System.out.println("El coro con Hileras esta bien ordenado");
                
            }
            else
               System.out.println("El coro con Hileras no esta bien ordenado"); 
        }
        else
           System.out.println("El coro con Hileras no esta lleno"); 
    }
}
}