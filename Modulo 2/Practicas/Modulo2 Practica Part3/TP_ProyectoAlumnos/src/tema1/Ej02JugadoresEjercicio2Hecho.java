
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
  
import PaqueteLectura.Lector; 	
public class Ej02JugadoresEjercicio2Hecho {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        
        double [] vector;
        
        //Paso 3: Crear el vector para 15 double 
        
        vector= new double[15];
        
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        
        double altura;
        
        double suma = 0;
        
        double alturaPROMEDIO;
        
        int cantidad = 0;
        
        int cantidad2 = 0;
        
        int i;
                
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        
        for (i= 0; i <= 14 ; i++) {
            System.out.print("la altura del jugador :"+ i + "  es :");
            altura = Lector.leerDouble();
            vector[i] = altura;
            suma += altura;
            cantidad += 1;
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        
        alturaPROMEDIO = (suma / cantidad);
        System.out.println("la altura promedio es:" + alturaPROMEDIO);
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
     
        for(i= 0; i <= 14 ; i++) 
            if(vector[i] > alturaPROMEDIO)
                cantidad2 += 1;
                                        // preguntar por acotar doubles 
        
        //Paso 9: Informar la cantidad.
        
        System.out.println("la cantidad de jugadores con una altura mayor al promedio :"+ alturaPROMEDIO + "fue de "+ cantidad2);
    }
    
}
