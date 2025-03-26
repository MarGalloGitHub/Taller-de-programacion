/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gallomartinianogoleadoressecond;

/**
 *
 * @author Usuario
 */
public class GalloMartinianoGoleadoresSecond {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Torneo torneo = new Torneo("TallerTorneo" , 4 , 5);
        
        Goleador go1 = new Goleador("fede", "babasonicos",4);
        Goleador go2 = new Goleador("grego", "picusa",5);
        Goleador go3 = new Goleador("fede", "donSatur",8);
        Goleador go4 = new Goleador("colo", "maceta",2);
        
        torneo.agregarGoleador(3, go1);
        torneo.agregarGoleador(2, go2);
        torneo.agregarGoleador(2, go3);
        torneo.agregarGoleador(0, go4);
        
        System.out.println("El que menos goles hizo en esa fecha fue :  "+torneo.menosGolesHizo(2).toString());
        System.out.println("Representacion del torneo :  "+ torneo.toString());
    }
    
}
