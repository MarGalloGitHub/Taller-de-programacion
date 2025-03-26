/*
 Definir una clase para representar triángulos. Un triángulo se caracteriza por el 
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String). 
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para: 
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área. 
NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son 
los lados y s =
𝐚+𝐛+𝐜
2
. La función raíz cuadrada es Math.sqrt(#)
 */
package Tema3;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class ejercicio1 {
    public static void main(String[] args){
        System.out.println("carge datos del triangulo en este orden:   largo lado1, largo lado 2, largo lado3, color de relleno y color de linea.");
        Triangulo triangulo1 = new Triangulo(Lector.leerDouble(),Lector.leerDouble(),Lector.leerDouble(),Lector.leerString(),Lector.leerString());
        
        System.out.println("el perimetro del triangulo es:    "+ triangulo1.calcularPerimetro()+"    y el area es:     "+ triangulo1.calcularArea());
    }
}
