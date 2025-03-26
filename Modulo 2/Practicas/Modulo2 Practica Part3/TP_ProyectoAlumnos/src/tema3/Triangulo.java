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

/**
 *
 * @author Usuario
 */
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String color;
    private String colorLinea;
    
    public Triangulo (double unLado1, double unLado2, double unLado3, String unColor, String unColorLinea){
        lado1 = unLado1;
        lado2 = unLado2;
        lado3 = unLado3;
        color = unColor;
        colorLinea = unColorLinea;
    }
    
    public double getLado1(){
        return lado1;
    }
    public void setLado1(double unLado1){
        lado1 = unLado1;
    }
    public double getLado2(){
        return lado2;
    }
    public void setLado2(double unLado2){
        lado2 = unLado2;
    }
    public double getLado3(){
        return lado3;
    }
    public void setLado3(double unLado3){
        lado3 = unLado3;
    }
    public String getColor(){
        return color;
    }
    public void setColor(String unColor){
        color = unColor;
    }
    public String getColorLinea(){
        return colorLinea;
    }
    public void setColorLinea(String unColorLinea){
        colorLinea = unColorLinea;
    }
    public double calcularArea(){
        double S = (lado1 +lado2+lado3)/2;
        double A = Math.sqrt(S*(S-lado1)*(S-lado2)*(S-lado3));
        return A;
    }
    
    public double calcularPerimetro(){
        double P = lado1 + lado2 +lado3;
        return P;
    }
    
}
