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
public class Ejercicio2 {
  public static void main (String[] args) {
      
      double [] vector = new double[15];
      
      double altura;
      
      double alturaPromedio;
      
      double suma = 0;
      
      int cantidad = 0;
      
      int cantidad2 = 0;
      
      int i;
      
      for(i= 0 ; i <= 14 ; i++){
          altura = GeneradorAleatorio.generarDouble(7);
          vector[i]= altura;
          suma += altura;
          cantidad+= 1;
      }
      alturaPromedio = (suma / cantidad);
      System.out.println("la altura promedio es de: " + alturaPromedio);
      
      for (i = 0; i <= 14 ; i++){
          if(vector[i] > alturaPromedio){
              cantidad2+= 1;
          }
      }
      
      System.out.println("la cantidad de jugadores con altura mayor al promedio es de: " + cantidad2);
      
  }
}
