/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialGoleadores;

/**
 *
 * @author Usuario
 */
public class Torneo {
    private String nombre;
    private Goleador[][] tabla;
    private int [] cantidadGoleadores;  
    private int cantidadFechas;                             //preguntar si esta bien guardarlo en variables
    private int cantidadGoleadorXfecha;

    public Torneo(String nombre, int cantidadFechas, int cantidadGoleadorXfecha) {
        this.nombre = nombre;
        this.cantidadFechas = cantidadFechas;
        this.cantidadGoleadorXfecha = cantidadGoleadorXfecha;
        
        tabla = new Goleador[cantidadFechas][cantidadGoleadorXfecha]; // no null porque lo hace java
        
        cantidadGoleadores = new int[cantidadGoleadorXfecha];
        int i;
        for(i=0 ; i<= (cantidadGoleadorXfecha - 1); i++){
            cantidadGoleadores[i] = 0;
        }
    }
    
    public void agregarGoleador(int fecha, Goleador goleador1){
        if(cantidadGoleadores[fecha - 1] <= (cantidadGoleadorXfecha - 1)){
            tabla[fecha - 1][cantidadGoleadores[fecha - 1]] = goleador1;
            cantidadGoleadores[fecha - 1]++;
        }
    }
    
    public Goleador obtenerGoleadorMenosGolesXfecha(int fecha){
        Goleador aux = null;
        int i;
        int menosGoles = 999;
        for(i=0 ; i<= (cantidadGoleadores[fecha - 1] - 1 ); i++){
            if(tabla[fecha - 1][i].getCantidadGoles() < menosGoles){
                menosGoles = tabla[fecha - 1][i].getCantidadGoles();
                aux = tabla[fecha - 1][i];
            }
        }
        return aux;
    }
    public int obtenerCantidadGoleadores(){
        int aux = 0;
        int i;
        int j;
        for(i=0 ; i<= (cantidadFechas - 1); i++){
            for(j=0 ; j<= (cantidadGoleadores[i] - 1); j++){  
                if(tabla[i][j] != null){
                   aux+= 1; 
                }
            }
        }
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = "La informacion del torneo es la siguiente:  " + "\n";
        aux += "Torneo 2024:  " + this.nombre + "\n";
        int i;
        int j;
        for(i=0 ; i<= (cantidadFechas - 1); i++){
            aux += "Fecha : " + (i+1) + ", la cantidad de goleadores fue de: " + this.cantidadGoleadorXfecha + ", pero los registrados fueron: ";
            for(j=0; j<= (cantidadGoleadores[i] - 1); j++){
                aux+= tabla[i][j].toString();
            }
        }
        return aux;
    }
    
    /*
     EN CASO DE NO SABER SI TODAS LAS FECHAS VAN A TENER AL MENOS UNO, DEBERIA PREGUNTAR SI cantidadGoleadores[i] es distinto de 0, sino tira null
    */
}
