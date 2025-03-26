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
public class VisorFiguras {
  private int guardadas;
  private int capacidadMax = 5;
  private Figura [] vector;
  private int dimL = 0;
  
  public VisorFiguras(){
      this.guardadas = 0;
      int i;
      vector = new Figura[5];
      for(i=0; i<=4; i++){
          vector[i] = null;
      }
  }
    public void guardar(Figura f){
        if(dimL <= 4){
            vector[dimL] = f;   //preguntar
            dimL++;
            guardadas++;
        }
    }
    
    public boolean quedaEspacio(){
        boolean aux = false;
        if(dimL <= 4){
            aux = true;
        }
        return aux;
    }
    public void mostrar(){
       int j;
       for(j=0;j<=(dimL - 1);j++){
           System.out.println(vector[j].toString());
       }     
    }

    public int getGuardadas() {
        return guardadas;
    }
    
}
