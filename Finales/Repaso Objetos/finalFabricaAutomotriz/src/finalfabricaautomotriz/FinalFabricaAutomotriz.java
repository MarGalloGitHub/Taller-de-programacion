/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalfabricaautomotriz;

/**
 *
 * @author Usuario
 */
public class FinalFabricaAutomotriz {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Sector sec = new Sector("Sector 1" , 2);
        
        Empleado jefe = new Empleado("Martiniano","Gallo",11);
        sec.agregarEmpleado(jefe, true);
        Empleado persona;
        persona = new Empleado("Pepe","Sanchez",8);
        sec.agregarEmpleado(persona, false);
        persona = new Empleado("Robert","Roberto",15);
        sec.agregarEmpleado(persona, false);
        persona = new Empleado("Robertiño","Roberto",13);
        sec.agregarEmpleado(persona, false);
        
        Producto prod;
        prod = new Producto(1);
        sec.agregarProducto(prod);
        prod = new Producto(2);
        sec.agregarProducto(prod);
        
        for(int i= 0; i<4;i++){
            sec.cambiarEtapa(2, 3);
        }
        System.out.println(sec.toString());
    }
    
}
