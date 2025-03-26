/*
 -A- Incluya la clase Triángulo a la jerarquía de figuras vista (carpeta tema4). Triángulo 
debe heredar de Figura todo lo que es común y definir su constructor y sus atributos y 
métodos propios. Además debe redefinir el método toString.

B- De igual manera, incluya la clase Círculo a la jerarquía de figuras.

C- Añada a la representación String el valor del perímetro. Piense ¿qué método toString
debe modificar: el de cada subclase o el de Figura?

D- Añada el método despintar que establece los colores de la figura a línea “negra” y 
relleno “blanco”. Piense ¿dónde debe definir el método: en cada subclase o en Figura?

E- Realizar un programa que instancie un triángulo y un círculo. Muestre en consola la
representación String de cada uno. Pruebe el funcionamiento del método despintar
 */
package Tema4.Ejercicio1;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class Ejercicio1 {
    public static void main(String[] args) {  //orden del constructor
        System.out.println("cargue los datos del triangulo en este orden :  lado 1, lado 2, lado 3, color de relleno y por ultimo color de linea");
        Triangulo triangulo1 = new Triangulo(Lector.leerDouble(),Lector.leerDouble(),Lector.leerDouble(),Lector.leerString(),Lector.leerString());
        
        System.out.println("cargue los datos del circulo en este orden :  radio, color de relleno y por ultimo color de linea");
        Circulo circulo1 = new Circulo(Lector.leerDouble(),Lector.leerString(),Lector.leerString());
        
        System.out.println("la informacion del triangulo es la siguiente :   \n" + triangulo1.toString());
        System.out.println("la informacion del circulo es la siguiente :   \n" + circulo1.toString());
        
        triangulo1.despintar();
        circulo1.despintar();
        System.out.println("la informacion del triangulo es la siguiente :   \n" + triangulo1.toString());
        System.out.println("la informacion del circulo es la siguiente :   \n" + circulo1.toString());
    }
}
