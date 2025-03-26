/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalhospital;

/**
 *
 * @author Usuario
 */
public class Cama {
    private int id;
    private boolean ocupada;
    private Paciente paciente;
    private int diasOcupada;

    public Cama(int id, boolean ocupada) {
        this.id = id;
        this.ocupada = ocupada;
        this.diasOcupada = 0;
    }
    
    public int getId(){
        return this.id;
    }

    public boolean isOcupada() {
        return ocupada;
    }
    
    public void darAlta(){
        this.diasOcupada = 0;
        this.paciente = null;
        this.ocupada = false;
    }
    
    public int getIdPaciente(){
        return this.paciente.getDni();
    }
    
    public void agregarPaciente(Paciente paciente){
        this.paciente = paciente;
        this.ocupada = true;
        this.diasOcupada = 1;
    }
    
    public void incrementarDias(){
        this.diasOcupada++;
    }
}
