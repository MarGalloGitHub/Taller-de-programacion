/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tema4Ejercicio6;

/**
 *
 * @author Usuario
 */
public class SistemaPromedioAños extends SistemaPrincipal{

    public SistemaPromedioAños(int N, int A, Estacion E) {
        super(N, A, E);
    }

    public double calcularPromedio(int j){
       double aux = 0;
       int i;
       double promedio=0;
       for(i=0;i<=11;i++){
           promedio += this.fechaTemperatura(j, i);
       }
       aux = promedio / 12;
       return aux;
        
    }   
    
    @Override
    public String informacion(){
        String aux = super.informacion() ;
        int i;
        for(i=0; i<= (this.getCantAños() - 1); i++){
            aux+= "Para el año : " + (this.getAñoDado() + i) + "la temperatura promedio fue de" + this.calcularPromedio(i) + "  C° "+ " \n" ;
        }
        return aux;
    }
}
