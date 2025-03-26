/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gallomartinianogoleadores;

/**
 *
 * @author Usuario
 */
public class Torneo {
    private String nombre;
    private Fecha [] fechas;
    private int [] goleadoresRegistrados;
    private int cantXfecha;

    public Torneo(String nombre, int N , int M) {
        this.nombre = nombre;
        this.fechas = new Fecha[N];
        this.goleadoresRegistrados = new int [N];
        this.cantXfecha = M ;
        int i;
        for (i=0 ; i < N ; i++)
            goleadoresRegistrados[i] = 0;
    }

    public int getCantXfecha() {
        return cantXfecha;
    }
    
    
    
}
