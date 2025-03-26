/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalUnlpSubsidios;

/**
 *
 * @author Usuario
 */
public class SubsidioEstadia extends Subsidio{
    private String lugarDestino;
    private double costoPasajes;
    private int cantidadDiasEstadia;
    private double montoHotelXdia;

    public SubsidioEstadia(String lugarDestino, double costoPasajes, int cantidadDiasEstadia, double montoHotelXdia, String nombreInvestigador, String nombrePlanTrabajo, int fechaSolicitud) {
        super(nombreInvestigador, nombrePlanTrabajo, fechaSolicitud);
        this.lugarDestino = lugarDestino;
        this.costoPasajes = costoPasajes;
        this.cantidadDiasEstadia = cantidadDiasEstadia;
        this.montoHotelXdia = montoHotelXdia;
    }
    
    @Override
    public double devolverMontoTotal(){
        double aux = this.costoPasajes + (this.cantidadDiasEstadia * this.montoHotelXdia);   
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = super.toString() + "- Lugar de destino:  " + this.lugarDestino + "- Dias de estadia:  " + this.cantidadDiasEstadia + "\n";
        return aux;
    }
    
}
