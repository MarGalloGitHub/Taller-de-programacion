/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalbanco;

/**
 *
 * @author Usuario
 */
public class FinalBanco {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        CajaAhorro ahorro = new CajaAhorro(true,1,43969405);
        Corriente cuentaC = new Corriente(1000,2,44989407);
        
        ahorro.depositar(1000);
        ahorro.Extraer(999);
        
        cuentaC.depositar(500);
        cuentaC.Extraer(600);
        
        System.out.println("Caja de ahorro: " + ahorro.toString());
        
        System.out.println("Cuenta corriente: " + cuentaC.toString());
    }
    
}
