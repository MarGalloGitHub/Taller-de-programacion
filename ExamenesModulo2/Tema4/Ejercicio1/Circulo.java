/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tema4.Ejercicio1;

/**
 *
 * @author Usuario
 */
public class Circulo extends Figura {  // esto quiere decir que hereda cosas de figura
    private double radio;

    public Circulo(double radio, String colorRelleno, String colorLinea) {
        super(colorRelleno, colorLinea);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    
    
    @Override
    public double calcularArea(){
       double aux = Math.PI *(radio *radio);
       return aux;
    }
    
    @Override
    public double calcularPerimetro(){
        double aux = 2 * radio * Math.PI;
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = super.toString() + "   ademas por ser un circulo sabemos que su radio es de :   " + radio ;
        aux += " ademas como sabemos que el perimetro de un circulo se calcula de manera particular, tenemos que el perimetro de esta figura es de:  " + this.calcularPerimetro()  ;
        return aux ;
    }
}
