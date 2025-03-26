
package tema1;

import PaqueteLectura.Lector;

public class Ejercicio5{
    
    public static void main(String []args){
   
     /*
         El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen 
        (con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad 
        de la comida (2) Precio (3) Ambiente.
        Escriba un programa que lea desde teclado las calificaciones de los cinco clientes 
        para cada uno de los aspectos y almacene la información en una estructura. Luego 
        imprima la calificación promedio obtenida por cada aspecto.
     */   
        
     int [][] reseñas;
     reseñas = new int[5][4];
     
     int aspectos;
     int cliente;
     
     int Atencion;
     int Calidad;
     int Precio;
     int Ambiente;
     
     for(cliente = 0; cliente < 5; cliente ++) {
         aspectos= 0;
         System.out.println("que valor del 1 al 10 le da a la atencion  ");
         Atencion = Lector.leerInt();
         reseñas[cliente][aspectos] = Atencion;
         aspectos ++;
         System.out.println("que valor del 1 al 10 le da al precio  ");
         Precio = Lector.leerInt();
         reseñas[cliente][aspectos] = Precio;
         aspectos ++;
         System.out.println("que valor del 1 al 10 le da a la calidad  ");
         Calidad = Lector.leerInt();
         reseñas[cliente][aspectos] = Calidad;
         aspectos ++;
         System.out.println("que valor del 1 al 10 le da al ambiente  ");
         Ambiente = Lector.leerInt();
         reseñas[cliente][aspectos] = Ambiente; 
     }   
     
     int suma;
     double calPROMEDIO;
     int cantidad = 5;
     
     int i,j;
     
     for(j=0 ; j<4; j++){
        suma = 0;
        for(i = 0; i<5 ; i++)
            suma += reseñas[i][j];
        calPROMEDIO= suma / cantidad;
        System.out.println("la calificacion promedio para el aspecto:   "+j+"  es de  "+calPROMEDIO);
     }    
     // preguntar implementeacion o carga de la matriz
    }
}