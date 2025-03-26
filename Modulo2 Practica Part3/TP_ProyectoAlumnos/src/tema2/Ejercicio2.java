/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
public class Ejercicio2 {
    
    public static void main(String [] args){
     GeneradorAleatorio.iniciar();
     
     
    
     Persona [] vectorPERSONAS;
     vectorPERSONAS = new Persona[15];
     
    
     int cant = 0;
     int min= -1;
     int pos = 0;
    
        for (int i = 0; i < 14 ; i++){
            vectorPERSONAS[i] = new Persona();
            vectorPERSONAS[i].setNombre(GeneradorAleatorio.generarString(6));
            vectorPERSONAS[i].setDNI(GeneradorAleatorio.generarInt(23));
            int dniMIN = vectorPERSONAS[i].getDNI();
            if(dniMIN < min){
                min = dniMIN;
                pos = i;
            }
            vectorPERSONAS[i].setEdad(GeneradorAleatorio.generarInt(80));
            int edadTEMP = vectorPERSONAS[i].getEdad();
            if(edadTEMP > 65)
                cant += 1;
        }
        
        System.out.println("la cantidad de mayores a 65 es:     "+ cant);
        
        System.out.print("la represion de la persona con el menor dni fue      "+ vectorPERSONAS[pos].toString());
    }      
}