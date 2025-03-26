/*
 * 3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros. 
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para: 
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno 
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante, 
busque e informe el autor del libro “Mujercitas”.
C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que 
almacenen como máximo N libros? ¿Cómo instanciaría el estante?
 */
package tema3;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class Ejercicio3 {
    public static void main(String [] args){
        
        Estante esta = new Estante();          // preguntar
        
        int corte;
       
        System.out.println("escriba condicion de corte  ");
        corte = Lector.leerInt();
        
        while(corte != 0){
            System.out.println("escriba el nombre del autor  ");
            String nombre = Lector.leerString();
            System.out.println("escriba la biografia del autor  ");
            String biografia = Lector.leerString();
            System.out.println("escriba el origen del autor  ");
            String origen = Lector.leerString();
          
            Autor aut = new Autor(nombre,biografia,origen);    // armo autor
            
            System.out.println("escriba el titulo del libro  ");
            String titulo = Lector.leerString();
            System.out.println("escriba la editorial del libro  ");
            String editorial = Lector.leerString();
            System.out.println("escriba el año de edicion del libro  ");
            int añoEdicion = Lector.leerInt();
            System.out.println("escriba el ISBN del libro  ");
            String ISBN = Lector.leerString();
            System.out.println("escriba el Precio del libro  ");
            double precio = Lector.leerDouble();
            
            Libro lib = new Libro(titulo,editorial,añoEdicion,aut,ISBN,precio);    //armo libro
            
            esta.agregarLibro(lib);
            
            System.out.println("escriba condicion de corte  ");
            corte = Lector.leerInt();
            
        }
        
        System.out.println(esta.devolverLibro("mujercitas").getPrimerAutor());
        
        
    }                   // preguntar que puedo hacer
}
