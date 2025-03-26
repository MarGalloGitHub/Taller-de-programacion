/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialGoleadores;

/**
 *
 * @author Usuario
 */
public class EjercicioGoleadores {
    public static void main(String[] args){
        Torneo torneo1 = new Torneo("Torneo de prueba",3,3);
        
        Goleador goleador1 = new Goleador("Roberto","Robertonis",4);
        Goleador goleador2 = new Goleador("Pedro","LosPeters",6);
        Goleador goleador3 = new Goleador("Marto","Martyres",9);
        
        torneo1.agregarGoleador(1, goleador1);
        torneo1.agregarGoleador(2, goleador2);
        torneo1.agregarGoleador(3, goleador3);
        
        System.out.println("El goleador con menos goles de la fecha 1 fue: " + torneo1.obtenerGoleadorMenosGolesXfecha(1).toString());
        System.out.println("La cantidad de goleadores registrados en el torneo fue: " + torneo1.obtenerCantidadGoleadores());
        System.out.println(torneo1.toString());
        
    }
}
