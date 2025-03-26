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
public class Paciente {
    private int dni;
    private String nombre;
    private String obraSocial;

    public Paciente(int dni, String nombre, String obraSocial) {
        this.dni = dni;
        this.nombre = nombre;
        this.obraSocial = obraSocial;
    }

    public int getDni() {
        return dni;
    }
    
    
    
}
