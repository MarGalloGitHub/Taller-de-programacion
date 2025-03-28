/*Se dispone de la clase Persona (en la carpeta tema2). Un objeto persona puede crearse 
sin valores iniciales o enviando en el mensaje de creación el nombre, DNI y edad (en ese 
orden). Un objeto persona responde a los siguientes mensajes: 

getNombre() retorna el nombre (String) de la persona
getDNI() retorna el dni (int) de la persona
getEdad() retorna la edad (int) de la persona
setNombre(X) modifica el nombre de la persona al “String” pasado por parámetro (X)
setDNI(X) modifica el DNI de la persona al “int” pasado por parámetro (X)
setEdad(X) modifica la edad de la persona al “int” pasado por parámetro (X)
toString() retorna un String que representa al objeto. 

Ej: “Mi nombre es Mauro, 
mi DNI es 11203737 y tengo 70 años” 

Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego 
muestre en consola la representación de ese objeto en formato String. */
package Tema2;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class Ejercicio1 {
    public static void main(String[] args){
      System.out.println("escriba el nombre de la persona");
      String nombre = Lector.leerString();
      System.out.println("escriba el dni de la persona");
      int dni = Lector.leerInt();
      System.out.println("escriba la edad de la persona");
      int edad = Lector.leerInt();
        
      Persona persona1 = new Persona(nombre,dni,edad);
       
      System.out.println(persona1.toString());
        
    }
}
