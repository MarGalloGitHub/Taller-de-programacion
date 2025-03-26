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
public class SubsidioBienes extends Subsidio{
    private int cantidadBienes;
    private Bien[] bienesSolicitados;

    public SubsidioBienes(int cantidadBienes, String nombreInvestigador, String nombrePlanTrabajo, int fechaSolicitud) {
        super(nombreInvestigador, nombrePlanTrabajo, fechaSolicitud);
        this.cantidadBienes = cantidadBienes;
        bienesSolicitados = new Bien[cantidadBienes];
    }
    
    
    public void agregarBien(Bien bien1){
        int i = 0;
        while((i<= (cantidadBienes - 1)) && (bienesSolicitados[i] != null)){
            i++;
        }
        if((i <= (cantidadBienes - 1) && (bienesSolicitados[i] == null))){
            bienesSolicitados[i] = bien1;
        }
    }
    
    @Override
    public double devolverMontoTotal(){
        double aux = 0;
        int i;
        for(i=0 ; i<= (cantidadBienes - 1) ; i++){
           aux+=  bienesSolicitados[i].costoFinalBien();
        }
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = super.toString() + "- Descripcion de bienes solicitados:  " + "\n";
        int i;
        for(i=0 ; i<= (cantidadBienes - 1); i++){
            aux+= "Bien numero:  " + (i+1) + bienesSolicitados[i].toString() + "\n";
        }
        return aux;
    }
}
