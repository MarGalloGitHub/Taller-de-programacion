/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialSurtidores;

/**
 *
 * @author Usuario
 */
public class EjercicioSurtidores {
    public static void main(String[] args){
        Estacion estacion1 = new Estacion("Uriburu 102 mi casa");
        
        
        Surtidor surtidor1 = new Surtidor("Super",35.15,5);
        Surtidor surtidor2 = new Surtidor("Infinia",65.19,4);
        Surtidor surtidor3 = new Surtidor("Alinol",25.23,6);
        
        estacion1.agregarSurtidor(surtidor1);
        estacion1.agregarSurtidor(surtidor2);
        estacion1.agregarSurtidor(surtidor3);
        
        estacion1.agregarVenta(1, 35, 4, "efectivo ", 50);
        estacion1.agregarVenta(2, 53, 2, "tarjeta ", 25);
        estacion1.agregarVenta(2, 83, 7, "efectivo ", 45);
        estacion1.agregarVenta(3, 17, 1, "favor", 18);
        
        System.out.println("El surtidor que hizo una mayor recaudacion fue:  " + estacion1.numeroDeSurtidorMayorRecaudacion());
        System.out.println(estacion1.toString());
        
    }
}
