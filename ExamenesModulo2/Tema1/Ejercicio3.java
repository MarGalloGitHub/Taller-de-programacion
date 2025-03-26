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
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ejercicio3 {
    public static void main(String[] args){   
        GeneradorAleatorio.iniciar();       //Siempre iniciar Generador Aleatorio
        int [][] matriz = new int [5][5];
        
        int i, j;                            //como cargar una matriz
        for(i=0; i<= 4 ; i++){
            for(j=0; j <= 4; j++){
                matriz[i][j] = GeneradorAleatorio.generarInt(30);
            }
        }
        for(i=0;i<=4;i++){                             //mostrar matriz
            System.out.println("'''''''''''");
            for(j=0;j<=4;j++){
                System.out.print("|"+matriz[i][j]+"|");
            }
        }
        int suma = 0;                   //para moverse en una fila, dejar fija la fila y mover la columna
        for(i=0;i<=4;i++){
            suma += matriz[0][i];
        }
        System.out.println("la suma de valores de la primera fila es :" + suma);
        
        int [] vector = new int [5];              //cargar vector con valores de columnas o filas
        
        int valorColumna;
        for(i=0;i<=4;i++){
            valorColumna = 0;
            for(j=0;j<=4;j++){
                valorColumna += matriz[j][i];  //si j primera suma columnas, sino suma filas
            }
            vector[i] = valorColumna;
        }
        
        System.out.println("los valores del vector son :       ");
        for(i=0; i<=4;i++){
            System.out.print(" | "+vector[i]+" | ");
        }
        
        System.out.println("escriba un numero a buscar en la matriz");
        int num = Lector.leerInt();
        
        int X = 0;
        int Y = 0;
        boolean encontre = false;
        for(i=0;i<=4;i++){
            for(j=0;j<=4;j++){
                if(matriz[i][j] == num){
                    X = i;
                    Y = j;
                    encontre = true;
                }
            }
        }
        if(encontre == false)
            System.out.println("el valor no estaba en la matriz");
        else
            System.out.println("el valor estaba en la fila :   "+ X + " y la columna " + Y);
        
    }
}
