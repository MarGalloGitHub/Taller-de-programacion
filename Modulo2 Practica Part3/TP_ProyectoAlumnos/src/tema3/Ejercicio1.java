/*
 * 1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el 
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
package tema3;

import PaqueteLectura.Lector;

public class Ejercicio1 {
    public static void main(String [] args){
        
        System.out.println("escriba el valor del lado 1  ");
        double lado1 = Lector.leerDouble();
        System.out.println("escriba el valor del lado 2  ");
        double lado2 = Lector.leerDouble();
        System.out.println("escriba el valor del lado 3  ");
        double lado3= Lector.leerDouble();
        System.out.println("escriba el color  ");
        String color = Lector.leerString();
        System.out.println("escriba el color de linea  ");
        String colorLinea = Lector.leerString();
        
        Triangulo triangulo1 = new Triangulo(lado1,lado2,lado3,color,colorLinea);
        
        System.out.println("el perimetro del triangulo es :"+ triangulo1.calcularPerimetro()+"  y su area es :  "+ triangulo1.calcularArea());
    }
    
}
