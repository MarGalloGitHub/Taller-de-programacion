/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gallomartinianoeescuelacanto;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class GalloMartinianoEescuelaCanto {

    
    public static void main(String[] args) {
        Concurso concurso = new Concurso(3,5);
        
        Cancion cancion1 = new Cancion("una","unaA",2);
        Cancion cancion2 = new Cancion("dos","unaB",3);
        Cancion cancion3 = new Cancion("tres","unaC",1);
        Cancion cancion4 = new Cancion("cuatro","unaD",6);
        Cancion cancion5 = new Cancion("cinco","unaE",7);
        
        concurso.agregarCancion(cancion1, 2);
        concurso.agregarCancion(cancion2, 1);
        concurso.agregarCancion(cancion3, 0);
        concurso.agregarCancion(cancion4, 2);
        concurso.agregarCancion(cancion5, 1);
        
        String nombre = Lector.leerString();
        String apellido = Lector.leerString();
        int dni= Lector.leerInt();
        int identificador = Lector.leerInt();
        double puntaje = Lector.leerDouble();
        Estudiante e = new Estudiante(nombre,apellido,dni);
        
        while(identificador != 0){
            
            concurso.interpretarCancion(identificador, e, puntaje);
            
            nombre = Lector.leerString();
            apellido = Lector.leerString();
            dni= Lector.leerInt();
            identificador = Lector.leerInt();
            puntaje = Lector.leerDouble();
            e = new Estudiante(nombre,apellido,dni);
        }
        
        int IdentificadorB = Lector.leerInt();
        Estudiante aux = concurso.conocerGanador(IdentificadorB);
        if(aux == null)
            System.out.println("Nadie");
        else
            System.out.println(aux.toString());
        
        
    }
    
}
