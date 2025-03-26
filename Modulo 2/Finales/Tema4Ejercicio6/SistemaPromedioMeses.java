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
public class SistemaPromedioMeses extends SistemaPrincipal{

    public SistemaPromedioMeses(int N, int A, Estacion E) {
        super(N, A, E);
    }

    public double calcularPromedio(int M){
       double aux = 0;
       int i;
       double promedio=0;
       for(i=0;i<=(this.getCantAños()-1);i++){
           promedio += this.fechaTemperatura(i, M);
       }
       aux = (promedio / this.getCantAños());
       return aux;
        
    }   
    
    @Override
    public String informacion(){
        String aux = super.informacion() ;
        int i;
        for(i=0; i<= 11; i++){
            aux+= "Para el mes : " + (i+1) + "  la temperatura promedio fue de" + this.calcularPromedio(i) + "  C° "+ " \n" ;
        }
        return aux;
    }
}
