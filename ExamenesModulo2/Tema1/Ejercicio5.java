/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tema1;

import PaqueteLectura.Lector;

/**
 *
 * @author Usuario
 */
public class Ejercicio5 {
    public static void main(String[] args){
        int[][] calificaciones = new int[5][4];
        
        int i,j;
        for(i=0;i<=4;i++){
            System.out.println("que opina de los aspectos del restaurante cliente:    "+ (i+1) );
            for(j=0;j<=3;j++){
                System.out.println("opinion del aspecto:   " + (j+1)  );
                calificaciones[i][j] = Lector.leerInt();
            }
        }
        
        double calificacionPromedio;
        int cantAspectos;   //preguntar si uso valor directo o creo variable
        int totalCalificaciones;
        for(j=0;j<=3;j++){
            calificacionPromedio = 0;
            totalCalificaciones = 0;
            cantAspectos = 0;
            for(i=0;i<=4;i++){
                totalCalificaciones += calificaciones[i][j];
                cantAspectos += 1;
            }
            calificacionPromedio+= (totalCalificaciones / cantAspectos);
            System.out.println("para el aspecto:   "+ (j+1)+ "su calificacion promedio fue de:   "+ calificacionPromedio);
        }
    }
}
