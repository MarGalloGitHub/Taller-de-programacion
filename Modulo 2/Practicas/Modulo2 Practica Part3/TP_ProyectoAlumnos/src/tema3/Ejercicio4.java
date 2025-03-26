/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class Ejercicio4 {
    public static void main(String [] args){
        
        System.out.println("Escriba cuantas habitaciones tendra el hotel:  ");
        int n= Lector.leerInt();
        Hotel HO = new Hotel(n);
                                                // esto tendria que estar en while o for
        Habitacion HA = new Habitacion();
   
        String nombre = Lector.leerString();
        int DNI = Lector.leerInt();             //armo cliente
        int edad = Lector.leerInt();
        
        Cliente cLI = new Cliente(nombre , DNI , edad);
        
        HA.setAlguien(cLI);                     //armo habitacion
        HA.setOcupada(true);
        
        System.out.println("en que habitacion? ");  //agrego al hotel
        int pos = Lector.leerInt();
        HO.setHabitacion(pos, HA);
        
        for (int i= 0 ; i < n ; i++)                        //mostrar hotel
            System.out.println(HO.toString(i));
        
        
        double x = Lector.leerDouble();
        
        HO.subirPRECIOS(x);              // aumentar precios en cantidad x
        
         for (int i= 0 ; i < n ; i++)                        //mostrar hotel
            System.out.println(HO.toString(i));
        
    }
    
    
}
