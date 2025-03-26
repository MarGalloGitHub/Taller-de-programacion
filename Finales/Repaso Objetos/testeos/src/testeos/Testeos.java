/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testeos;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class Testeos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Edificio edi = new Edificio(10);
        System.out.println("Edificio vacio");
        System.out.println(edi.mostrarEdificio());
        Persona per;
        System.out.println("Ingrese su nombre y luego su dni");
        per = new Persona(Lector.leerString(),Lector.leerInt());
        System.out.println("Ingrese un piso - valores del 1 al 10");
        int piso = Lector.leerInt();
        System.out.println("Ingrese una oficina - valores del 1 al 10");
        int oficina = Lector.leerInt();
        edi.agregarPersona(per, piso, oficina);
        System.out.println("Edificio actualizado");
        System.out.println(edi.mostrarEdificio());
    }
    
}
