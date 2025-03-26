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
public class VisorFiguras {
    private int mostradas;

    public VisorFiguras() {
        mostradas = 0;
    }
    public void mostrar(Figura F){
        System.out.println(F.toString());
        mostradas++;
    }

    public int getMostradas() {
        return mostradas;
    }
    
    
}
