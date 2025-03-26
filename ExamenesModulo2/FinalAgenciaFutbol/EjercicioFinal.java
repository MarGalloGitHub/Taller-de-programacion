/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalAgenciaFutbol;

/**
 *
 * @author Usuario
 */
public class EjercicioFinal {
    public static void main(String[] args){
        Sistema sistema1 = new Sistema();
        
        sistema1.agregarPartido();
        sistema1.agregarPartido();
        sistema1.agregarPartido();
        
        sistema1.agregarApuesta();
        sistema1.agregarApuesta();
        
        sistema1.ingresarResultado(1);
        sistema1.ingresarResultado(2);
        sistema1.ingresarResultado(3);
        
        sistema1.cerrarApuestas();
        sistema1.limpiarSistema();
    }
}
