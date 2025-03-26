/*
 - Implemente las clases para el siguiente problema. Una garita de seguridad quiere 
identificar los distintos tipos de personas que entran a un barrio cerrado. Al barrio pueden 
entrar: personas, que se caracterizan por nombre, DNI y edad; y trabajadores, estos son 
personas que se caracterizan además por la tarea realizada en el predio. 
Implemente constructores, getters y setters para las clases. Además tanto las personas 
como los trabajadores deben responder al mensaje toString siguiendo el formato:

 Personas “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años”

 Trabajadores “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años. Soy jardinero.”

B- Realice un programa que instancie una persona y un trabajador y muestre la 
representación de cada uno en consola
 */
package Tema4Ejercicio3;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class Ejercicio3 {
    public static void main(String[] args){
        
        System.out.println("ingrese los datos de una persona, nombre, dni y edad");
        Persona persona1 = new Persona(Lector.leerString(),Lector.leerInt(),Lector.leerInt());
                System.out.println("ingrese los datos de un trabajador, ocupacion, nombre, dni y edad");
        Trabajador trabajador1 = new Trabajador(Lector.leerString(),Lector.leerString(),Lector.leerInt(),Lector.leerInt());
        
        System.out.println(persona1.toString());
        System.out.println(trabajador1.toString());
        
    }
}
