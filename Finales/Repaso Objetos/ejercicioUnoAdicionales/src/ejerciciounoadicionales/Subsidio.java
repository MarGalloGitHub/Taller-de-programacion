/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejerciciounoadicionales;

/**
 *
 * @author Usuario
 */
public class Subsidio {
    private double monto;
    private String motivo;
    private boolean otorgado;

    public Subsidio(double monto, String motivo) {
        this.monto = monto;
        this.motivo = motivo;
        this.otorgado = false;
    }

    public double getMonto() {
        return monto;
    }
    
    public void activarSubsidio(){
        this.otorgado = true;
    }
}
