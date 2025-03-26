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
public class Rectangulo extends Figura {
    private int ladosH;
    private int ladosV;

    public Rectangulo(int ladosH, int ladosV, String colorRelleno, String colorLinea) {
        super(colorRelleno, colorLinea);
        this.ladosH = ladosH;
        this.ladosV = ladosV;
    }
    
    @Override
    public String toString(){
        String aux = super.toString() + ", los lados horizontales miden " + this.ladosH + " y los verticales miden " + this.ladosV;
        return aux;
    }
}
