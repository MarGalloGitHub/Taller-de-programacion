/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tema1;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class Ejercicio4 {
    public static void main(String[] args){
        int [][] matriz = new int[8][4];
        
        System.out.println("a que piso vas ?  ");
        int piso = Lector.leerInt();
        while(piso != 9){
            System.out.println(" y a que oficina vas ?  ");
            int oficina = Lector.leerInt();
            matriz[piso - 1][oficina - 1] += 1;
            System.out.println("a que piso vas ?  ");
            piso = Lector.leerInt();
        }
        System.out.println("la disposicion de oficinas del dia de hoy es la siguiente");
        
        int i;
        int j;
        
        for(i=0;i<=7;i++){                                       //presentacion en matriz
            System.out.println("........");
            for(j=0;j<=3;j++){  
                System.out.print(" | "+matriz[i][j]+" | ");
            }
        }
        
        for(i=0;i<=7;i++){
            System.out.println("en el piso : "+ (i+1)+ "      las oficinas tienen la siguiente distribucion");
            for(j=0;j<=3;j++){
                System.out.println("en la oficina :  "+ (j+1)+ "     hay   "+ matriz[i][j] + "   personas  ");
            }
            
        }
    }
}
