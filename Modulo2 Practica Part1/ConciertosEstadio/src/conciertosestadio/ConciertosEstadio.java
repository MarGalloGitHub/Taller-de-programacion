/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conciertosestadio;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class ConciertosEstadio {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        System.out.println("escriba un nombre del estadio");
        String nombre = Lector.leerString();   //estadio
        System.out.println("escriba una direc del estadio");
        String direc = Lector.leerString();
        System.out.println("escriba la capacidad del estadio");
        int capa = Lector.leerInt();
        
 
        Estadio est = new Estadio(nombre,direc,capa);
        
        int i ;
        
        Concierto C;
        
        for(i = 0 ; i < 3 ; i++){
           System.out.println("a que mes agendamos el concierto");
           int mes = Lector.leerInt(); // agregar a un mes
           
           est.registrarConcierto(mes);
        }
        System.out.println("de que mes obtenemos informacion");
        int mes = Lector.leerInt();
        
        System.out.println(est.devolverInfoMes(mes));
        System.out.println(est.calcularGanancias(mes));
        
        System.out.println(est.toString());
        
            
        
        
    }
    
    
    
}
