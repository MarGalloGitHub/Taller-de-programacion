/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalfabricaautomotriz;

import java.util.logging.Logger;

/**
 *
 * @author Usuario
 */
public class Producto {
    private int codigo;
    private double costoTotal;
    private int etapa;

    public Producto(int codigo) {
        this.codigo = codigo;
        this.costoTotal = 0;
        this.etapa = 1;
    }

    public int getEtapa() {
        return etapa;
    }
    
    public double getCostoTotal(){
        return this.costoTotal;
    }

    public int getCodigo() {
        return this.codigo;
    }
    
    public void actualizar(double costo){
        this.costoTotal+= costo;
        this.etapa++;
    }
    
    
    
    
}
