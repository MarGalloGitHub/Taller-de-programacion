/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalConcursoDeBaile;

/**
 *
 * @author Usuario
 */
public class Concurso {
    private int cantidadMaximaParejas;
    private Pareja[] parejas;
    private int dimL;

    public Concurso(int cantidadMaximaParejas) {
        this.cantidadMaximaParejas = cantidadMaximaParejas;
        parejas = new Pareja[cantidadMaximaParejas];
        int i;
        dimL = 0;  // no inicializo vector de parejas porque lo hace java
    }
    
    public void agregarPareja(Pareja unaPareja){
        if(dimL <= (cantidadMaximaParejas - 1)){
            parejas[dimL] = unaPareja;
            dimL++;
        }
    }
    
    public Pareja obtenerParejaConMasDiferenciaEdad(){
        Pareja aux = null;
        int maxDiferencia = -1 ;
        int i;
        for(i=0 ; i<= (dimL) - 1; i++){
            if((parejas[i]).obtenerDiferenciaDeEdad() > maxDiferencia){
               maxDiferencia = parejas[i].obtenerDiferenciaDeEdad();
               aux = parejas[i];
            }
        }  
        return aux;
    }
}
