/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tema4.Ejercicio1;

import Tema4.Ejercicio1.Figura;

/**
 *
 * @author Usuario
 */
public class Triangulo extends Figura { //hereda cosas de figura
    private double lado1;
    private double lado2;
    private double lado3;

    public Triangulo(double lado1, double lado2, double lado3, String colorRelleno, String colorLinea) {
        super(colorRelleno, colorLinea); //esta parte va compartida con otras clases, es lo que se hereda de figura
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        }
    
    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
 
      
    
@Override    
public double calcularPerimetro(){
    double aux = (lado1 + lado2 + lado3);
    return aux;
    }   
@Override
public double calcularArea(){
   double x =  (lado1 + lado2 + lado3) / 2 ;
   double aux =  Math.sqrt(x*(x-lado1)*(x-lado2)*(x-lado3));
   return aux;
    }

@Override
public String toString(){
    String aux = super.toString() + "  ademas sabemos cuanto miden sus lados siendo el primero de :      " + lado1 + ",  el segundo  " + lado2 + "   y el tercero  " + lado3 ;
    aux += " ademas como sabemos que el perimetro de un triangulo es la suma de usas lados, tenemos que el perimetro de esta figura es de:  " + this.calcularPerimetro()  ;
    return aux;
    }
}
