/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Usuario
 */
public class Hotel {
    private Habitacion [] arreglo;
    private int dF;

    public Hotel(int n) {
        this.dF = n;
        arreglo = new Habitacion[n];
        for (int i = 0 ; i<n ; i++)
            arreglo[i]= new Habitacion();
            
    }

    public int getdF() {
        return dF;
    }
    
    public Habitacion getHabitacion(int i){
        return arreglo[i];
    }
    
    public void setHabitacion(int pos , Habitacion unaHabi){
        arreglo[pos] = unaHabi;
    }

    public void setAgregarCliente(Cliente C , int X){            //preguntar iii A)
        arreglo[X].setAlguien(C);
    }
   
    public void subirPRECIOS(double unPrecio){
        for (int i =0 ; i< dF ; i++){
            arreglo[i].setCostoXnoche(unPrecio);  // preguntar iii B)
        }
    }
    
    
    public String toString(int i){
        String aux = "Habitacion:  "+ (i+1)+ arreglo[i].toString();
        return aux;
    } 
    
}
