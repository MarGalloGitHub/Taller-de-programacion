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
public abstract class SistemaPrincipal {
    private double [][] registroTiempos;
    private int añoDado;
    private int cantAños;
    private Estacion estacion;

    public SistemaPrincipal(int N, int A, Estacion E) {
        this.añoDado = A;
        this.cantAños = N;
        registroTiempos = new double [N][12];
        for(int i=0; i<=(N - 1);i++){
            for(int j=0;j<=11;j++){
                registroTiempos[i][j] = 30.5;
            }
        }
        this.estacion = E; 
        
    }
    

    public int getAñoDado() {
        return añoDado;
    }

    public int getCantAños() {
        return cantAños;
    }
    
    public void registrarTemperatura(int M, int A, double temp){
        this.registroTiempos[A - this.añoDado][M-1] = temp;
    }
    
    public double obtenerTemperatura(int M, int A){
        double aux = this.registroTiempos[A-this.añoDado][M-1];
        return aux;
    }

    public String mesYañoTempMax(){
        int i;
        int j;
        double max = 0;
        int mesMax = 0;
        int añoMax = 0;
        for(i=0;i<=(this.cantAños-1);i++){
            for(j=0;j<=11;j++){
                if(registroTiempos[i][j] > max){
                    max = registroTiempos[i][j];
                    mesMax = j + 1;
                    añoMax = i + 1 + this.añoDado;
                }
            }
        }
        String aux = "La temperatura mas alta se encontro en el año:    " + añoMax + " en el mes :  " + mesMax ;
        return aux;
    }
    public double fechaTemperatura(int A, int M) {
        double aux = this.registroTiempos[A][M];
        return aux ;
    }
    
    public String informacion(){
        String aux = "Estacion " + this.estacion.toString();
        return aux;
    }
    
    
    
}
