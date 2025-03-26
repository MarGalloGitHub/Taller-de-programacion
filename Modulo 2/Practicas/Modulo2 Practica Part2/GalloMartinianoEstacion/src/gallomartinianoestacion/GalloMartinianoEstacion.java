/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gallomartinianoestacion;

/**
 *
 * @author Usuario
 */
public class GalloMartinianoEstacion {

    
    public static void main(String[] args) {
        
     Estacion esta = new Estacion("Larrea");   // hago estacion
     
     Surtidor surti1 = new Surtidor("diesel", 40 , 4);  //hago surtidores 
     Surtidor surti2 = new Surtidor("alinol", 56 , 3);
     Surtidor surti3 = new Surtidor("nafta", 46 , 6);
     
     
     esta.agregarSurtidor(surti3);   //agrego surtidores
     esta.agregarSurtidor(surti2);
     esta.agregarSurtidor(surti1);
     
     esta.generarVentaYagregar(2, 439, 6, 23, "  credito  ");  //agrego ventas a surtidores 
     esta.generarVentaYagregar(3, 437, 5, 29, " debito ");
     esta.generarVentaYagregar(1, 442, 2, 35, " efectivo ");
     
    System.out.println("  el surtidor con mas recaudacion fue : " + esta.obtenerNumeroSurtidor());
     
    System.out.println(esta.toString());
     
     
    }
    
}
