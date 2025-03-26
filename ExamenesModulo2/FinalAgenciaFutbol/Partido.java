/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalAgenciaFutbol;

/**
 *
 * @author Usuario
 */
public class Partido {
    private String nombreLocal;
    private String nombreVisitante;
    private String resultado;
    private double factorVictoriaLocal;
    private double factorEmpate;
    private double factorVictoriaVisitante;

    public Partido(String nombreLocal, String nombreVisitante, double factorVictoriaLocal, double factorEmpate, double factorVictoriaVisitante) {
        this.nombreLocal = nombreLocal;
        this.nombreVisitante = nombreVisitante;
        this.resultado = "";
        this.factorVictoriaLocal = factorVictoriaLocal;
        this.factorEmpate = factorEmpate;
        this.factorVictoriaVisitante = factorVictoriaVisitante;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }

    public String getResultado() {
        return resultado;
    }

    public double getFactorVictoriaLocal() {
        return factorVictoriaLocal;
    }

    public double getFactorEmpate() {
        return factorEmpate;
    }

    public double getFactorVictoriaVisitante() {
        return factorVictoriaVisitante;
    }
    
    
    
}
