/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tema4Ejercicio4;

/**
 *
 * @author Usuario
 */
public abstract class Figura {
    private String colorRelleno;
    private String colorLinea;

    public Figura(String colorRelleno, String colorLinea) {
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
    
    @Override
    public String toString(){
      String aux = "El color de relleno es " + this.colorRelleno +" y el color de linea es "+ this.colorLinea;
      return aux;
    }
    
}
