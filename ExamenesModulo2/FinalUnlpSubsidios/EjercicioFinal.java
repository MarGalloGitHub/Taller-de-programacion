/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalUnlpSubsidios;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class EjercicioFinal {
    public static void main(String[] args){
        
        System.out.println("Cargue los datos para un subsidio de estadia: LUGAR DE DESTINO, COSTO DE PASAJES, CANTIDAD DE DIAS DE ESTADIA, MONTO POR DIA, NOMBRE DEL INVESTIGADOR, NOMBRE DEL PLAN DE TRABAJO Y LA FECHA DE SOLICITUD(INT)");
        SubsidioEstadia subsidioE = new SubsidioEstadia(Lector.leerString(),Lector.leerDouble(),Lector.leerInt(),Lector.leerDouble(),Lector.leerString(),Lector.leerString(),Lector.leerInt());
        
        System.out.println("Cargue los datos para un subsidio de bienes: CANTIDAD DE BIENES, NOMBRE DEL INVESTIGADOR, NOMBRE DEL PLAN DE TRABAJO Y FECHA DE LA SOLICITUD");
        int cantidadBienes = Lector.leerInt();
        SubsidioBienes subsidioB = new SubsidioBienes(cantidadBienes,Lector.leerString(),Lector.leerString(),Lector.leerInt());
        
       int i;
       for(i=0 ; i<= (cantidadBienes -1) ; i++){
           System.out.println("Ingresar datos de un bien: DESCRPCION, CANTIDAD Y COSTO POR UNIDAD" );
           Bien bien1 = new Bien(Lector.leerString(),Lector.leerInt(),Lector.leerDouble());
           subsidioB.agregarBien(bien1);
       }
       
       System.out.println(subsidioE.toString() + "\n");
       System.out.println(subsidioB.toString());
    }
}
