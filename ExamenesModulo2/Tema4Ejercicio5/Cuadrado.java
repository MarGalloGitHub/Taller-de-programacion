/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tema4Ejercicio5;

/**
 *
 * @author Usuario
 */
public class Cuadrado extends Figura {
    private int lados;

    public Cuadrado(int lados, String colorRelleno, String colorLinea) {
        super(colorRelleno, colorLinea);
        this.lados = lados;
    }
    
    @Override
    public String toString(){
        String aux = super.toString() + " y los lados miden " + this.lados;
        return aux;
    }
}
