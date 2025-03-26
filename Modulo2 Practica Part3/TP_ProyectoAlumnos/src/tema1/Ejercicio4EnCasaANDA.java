
package tema1;

import PaqueteLectura.Lector;

public class Ejercicio4EnCasaANDA{
    
    
    
    public static void main(String[]args){
    
        /* - Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
        (1..4). Realice un programa que permita informar la cantidad de personas que 
        concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al 
        edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de 
        oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro. 
        de piso 9. Al finalizar la llegada de personas, informe lo pedido
        */
        
        int [][] EDIFICIO;
        EDIFICIO = new int[8][4];
   
        int nroPISO, nroOFICINA;
        
        
        System.out.print("escriba el numero de piso  ");
        nroPISO = Lector.leerInt();
        System.out.print("escriba el numero de oficina  ");
        nroOFICINA = Lector.leerInt();
        while(nroPISO != 9){                          //cargar EDIFICIO
            EDIFICIO[nroPISO - 1][nroOFICINA - 1] += 1;
            System.out.print("escriba el numero de piso  ");
            nroPISO = Lector.leerInt();
            if(nroPISO != 9){
                System.out.print("escriba el numero de oficina  ");
                nroOFICINA = Lector.leerInt();
            }
        }
            
        //informar cuantas hay para cada uno
    
        int i,j;
        
        for (i= 0 ; i<8 ; i++)
            for(j=0 ; j<4 ; j++)
                System.out.println("en la oficina:  "+ (j+1)  + "     del piso:   "+ (i+1) + "   habia   "+ EDIFICIO[i][j]+ "   personas");
        
     }

}