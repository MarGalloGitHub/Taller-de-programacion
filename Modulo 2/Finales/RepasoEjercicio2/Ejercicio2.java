/*
 Queremos un sistema para gestionar estacionamientos. Un estacionamiento conoce su 
nombre, dirección, hora de apertura, hora de cierre, y almacena para cada número de piso 
(1..N) y número de plaza (1..M), el auto que ocupa dicho lugar. De los autos se conoce 
nombre del dueño y patente.

Realice un programa que instancie un estacionamiento con 3 pisos y 3 plazas por piso. 
Registre 6 autos en el estacionamiento en distintos lugares. 
Muestre la representación String del estacionamiento en consola.
Muestre la cantidad de autos ubicados en la plaza 1.
Lea una patente por teclado e informe si dicho auto se encuentra en el 
estacionamiento o no. En caso de encontrarse, la información a imprimir es el piso y 
plaza que ocupa.

 */
package RepasoEjercicio2;

import PaqueteLectura.Lector;

/**
 * PREGUNTAR POR EL USO DE DISNTINTOS METODOS DEPENDIENDO DEL CASO
 */
public class Ejercicio2 {
    public static void main(String[] args){
        Estacionamiento estacionamiento1 = new Estacionamiento("ColoEstacionamiento",22,9,21,3,3);
        
        int i;
        for(i=0;i<=5;i++){
            System.out.println(" escriba el nombre del dueño del auto y numero de patente");
            Auto auto1 = new Auto(Lector.leerString(),Lector.leerInt());
            System.out.println(" escriba el numero de piso y numero de plaza");
            estacionamiento1.registrarAuto(auto1, Lector.leerInt(), Lector.leerInt());
        }
        System.out.println(estacionamiento1.toStringCaso2());
        System.out.println(estacionamiento1.obtenerAutosPlaza2(1));
        
        System.out.println("cargue un numero de patente");
        int patente = Lector.leerInt();
        System.out.println(estacionamiento1.encontrarAuto2(patente));
    }
    
}
