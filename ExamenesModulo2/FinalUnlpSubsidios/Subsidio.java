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
public abstract class Subsidio {
    private String nombreInvestigador;
    private String nombrePlanTrabajo;
    private int fechaSolicitud;

    public Subsidio(String nombreInvestigador, String nombrePlanTrabajo, int fechaSolicitud) {
        this.nombreInvestigador = nombreInvestigador;
        this.nombrePlanTrabajo = nombrePlanTrabajo;
        this.fechaSolicitud = fechaSolicitud;
    }
    
    public abstract double devolverMontoTotal();
    
    @Override
    public String toString(){
        String aux = "Nombre del investigador:  " + this.nombreInvestigador + "- Plan de trabajo:  " + this.nombrePlanTrabajo + "- Fecha de solicitud:  " + this.fechaSolicitud + "- Monto total:  " + this.devolverMontoTotal() + "\n";
        return aux;
    }
}
