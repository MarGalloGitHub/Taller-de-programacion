/*
 
 */
package Tema3;

/**
A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio 
(double), el color de relleno (String) y el color de línea (String). 
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para: 
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e 
informe en consola el perímetro y el área. 
NOTA: la constante PI es Math.P
 */
import PaqueteLectura.Lector;
public class ejercicio5 {
    public static void main(String[] args){
        System.out.println("cargar datos del circulo en este orden: radio, color de relleno y por ultimo color de linea");
        Circulo circ1 = new Circulo(Lector.leerDouble(),Lector.leerString(),Lector.leerString());
        
        System.out.println("el perimetro del circulo es:    " + circ1.calcularPerimetro() + "   y su area es:   " + circ1.calcularArea());
    }
}
