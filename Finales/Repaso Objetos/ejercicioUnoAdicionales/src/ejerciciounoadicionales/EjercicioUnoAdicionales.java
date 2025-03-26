/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejerciciounoadicionales;

import PaqueteLectura.Lector;
public class EjercicioUnoAdicionales {

    public static void main(String[] args) {
        Proyecto proyec = new Proyecto("Estudios medicinales Inc",23,"Pepe Suarez");
        Investigador inves1 = new Investigador("Mar",1,"Espalda");
        Subsidio sub1;
        Subsidio sub2;
        sub1 = new Subsidio(23,"Pos Nomas");
        sub2 = new Subsidio(27,"Por las dudas");
        inves1.agregarSubsidio(sub1);
        inves1.agregarSubsidio(sub2);
        Investigador inves2 = new Investigador("Tere",2,"Patas");
        sub1 = new Subsidio(23,"Pos Nomas");
        sub2 = new Subsidio(27,"Por las dudas");
        inves2.agregarSubsidio(sub1);
        inves2.agregarSubsidio(sub2);
        Investigador inves3 = new Investigador("Max",3,"Brazos");
        sub1 = new Subsidio(23,"Pos Nomas");
        sub2 = new Subsidio(27,"Por las dudas");
        inves3.agregarSubsidio(sub1);
        inves3.agregarSubsidio(sub2);
        
        proyec.agregarInvestigador(inves1);
        proyec.agregarInvestigador(inves2);
        proyec.agregarInvestigador(inves3);
        
        proyec.otorgarTodos("Mar");
        System.out.println(proyec.toString());
        
        
    }
    
}
