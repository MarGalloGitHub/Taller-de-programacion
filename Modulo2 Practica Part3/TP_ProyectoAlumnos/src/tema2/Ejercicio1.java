/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.Lector;
public class Ejercicio1 {
    public static void main(String[]args){
        
        Persona persona1= new Persona();
        System.out.print("escriba un nombre     ");
        persona1.setNombre(Lector.leerString());
        System.out.print("escriba un dni    ");
        persona1.setDNI(Lector.leerInt());
        System.out.print("escriba un edad  ");
        persona1.setEdad(Lector.leerInt());
        
        System.out.println(persona1.toString());
        
    }
}
