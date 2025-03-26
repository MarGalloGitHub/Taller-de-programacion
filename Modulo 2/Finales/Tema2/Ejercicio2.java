/*
 Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta 
obtener edad 0. Luego de almacenar la información:
 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI.
 */
package Tema2;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.GeneradorAleatorio;
public class Ejercicio2 {
    public static void main(String[] args){
      
        Persona[] vector = new Persona[15];
       
        Persona persona1 = new Persona(GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarInt(200),GeneradorAleatorio.generarInt(100));
        int i = 0;
        while((i <= 14) && (persona1.getEdad()!= 0)){
            vector[i] = persona1;
            persona1 = new Persona(GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarInt(200),GeneradorAleatorio.generarInt(100));
            i++;
        }
        int dimL = i ;
        int menorDNI = 999;
        int pos = 0;
        int cantidad = 0;
        int j;
        for(j=0; j < dimL; j++){                         // preguntar tema indices, si < o usar diml - 1
            if(vector[j].getEdad()>65){
                cantidad++;
            }
            if(vector[j].getDNI()< menorDNI){
                menorDNI = vector[j].getDNI();
                pos = j;
            }
        }
        System.out.println("La cantidad de peronas mayores a 65 años fueron de :     " + cantidad);
        System.out.println("el perfil de la persona con menor dni fue :  "  +  vector[pos].toString());
    }
}
