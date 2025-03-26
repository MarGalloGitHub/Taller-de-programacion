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
public abstract class Figura { //abstract significa que no se pueden instanciar este tipo de clases
    private String colorRelleno;
    private String colorLinea;

    public Figura(String colorRelleno, String colorLinea) {  //constructor de la superclase
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
    
    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public void despintar(){
       this.setColorLinea("negro");
       this.setColorRelleno("blanco");
    }
    
    public abstract double calcularArea();   // que sean abstractos  significa que cada clase lo hace de una manera distinta
    
    public abstract double calcularPerimetro();

    @Override
    public String toString() {
        String aux = "Esta figura tiene como color de relleno :   " + colorRelleno + "y un color de linea:  " + colorLinea;
        return aux;
    }
    
    
}
