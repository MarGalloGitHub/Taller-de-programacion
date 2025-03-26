/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03MatricesEjercicioHecho {

    public static void main(String[] args) {
	    //Paso 2. iniciar el generador aleatorio   
            
            GeneradorAleatorio.iniciar();
	 
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        
        int [][] matriz;
        matriz = new int[5][5];
        int i , j;
        
        for (i= 0 ; i< 5 ; i++)
            for (j=0; i <5; j++)
                matriz[i][j]= GeneradorAleatorio.generarInt(8);
        
        //Paso 4. mostrar el contenido de la matriz en consola
        
        for (i= 0 ; i<5 ; i++)
            for(j=0 ; j <5 ; j++)
                System.out.print(matriz[i][j]);
    
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        
        int suma;
        suma = 0;
        i = 1;
          for(j=0 ; j <5 ; j++)
             suma += matriz[i][j];
    
        System.out.println("la suma de los elementos de la fila 1 es:    "+ suma );  
          
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
            
        int [] vector;
        vector = new int[5];
        
        for(j= 0; j<5; j++)
            for(i = 0; i< 5; i++)
                vector[j]+= matriz[i][j];
        
        for(i= 0; i<5 ; i++)
            System.out.print(matriz[i]);
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        
        System.out.println("escriba un valor entero");
        int valor= Lector.leerInt();
        
        boolean ok = false;
        
        int compara ;
        
        for (i= 0 ; i<5 ; i++)
            for(j=0 ; j<5 ; j++) {
                compara = matriz[i][j];
                if(valor == compara) {
                      ok = true;
                      System.out.println("la posicion del valor ingresado en la lista es en la fila:  "+ i +"  y en la columna:  "+ j);
                }
            }
        if(ok = false)
            System.out.println("no se encontro el elemento");
    }
}
