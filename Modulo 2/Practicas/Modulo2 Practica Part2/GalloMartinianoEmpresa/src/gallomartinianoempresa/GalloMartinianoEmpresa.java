/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gallomartinianoempresa;

/**
 *
 * @author Usuario
 */
public class GalloMartinianoEmpresa {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
         
        Director direc = new Director(83,"carlos" , 4356 , 2022 , 345);
        
        Empresa empre = new Empresa ("PeposInc" ,"Larrea345", direc , 4);
        
        int i;
        for(i = 0 ; i < 3 ; i++)
            empre.asignarEncargado(i);
        
        System.out.print(empre.toString());
        
        
    }
}
