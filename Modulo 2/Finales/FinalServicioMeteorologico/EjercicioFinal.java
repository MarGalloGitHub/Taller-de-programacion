/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalServicioMeteorologico;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class EjercicioFinal {
    public static void main(String[] args){
        
        System.out.println("cargue los datos de una estacion:  NOMBRE, LATITUD Y LONGITUD");
        Estacion estacion1 = new Estacion(Lector.leerString(),Lector.leerInt(),Lector.leerInt());
        
        ServicioInformeAnual servicioAnual = new ServicioInformeAnual(estacion1,3);
        int i;
        int j;
        double temp;
        for(i=0 ; i<= 2 ; i++){
            for(j=0; j <= 11 ; j++){
                System.out.println("cargue una temperatura para el mes: " + (j + 1) + ", del año:  " + (i + 1));
                servicioAnual.registrarTemperatura((j), (i));
            }
        }
        
        System.out.println(servicioAnual.toString() + "\n");
        System.out.println(servicioAnual.devolverFechaMayorTemp() + "\n");
        
        
        
        
        ServicioInformeMensual servicioMensual = new ServicioInformeMensual(estacion1,4);
        for(i=0 ; i<= 3 ; i++){
            for(j=0; j <= 11 ; j++){
                System.out.println("cargue una temperatura para el mes: " + (j + 1) + ", del año:  " + (i + 1));
                servicioMensual.registrarTemperatura((j), (i));
            }
        }
        
        System.out.println(servicioMensual.toString() + "\n");
        System.out.println(servicioMensual.devolverFechaMayorTemp() + "\n");
        
    }
}
