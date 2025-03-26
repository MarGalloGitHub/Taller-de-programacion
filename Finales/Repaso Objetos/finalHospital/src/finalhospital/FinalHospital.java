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
public class FinalHospital {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Hospital hospital = new Hospital("Hospital 502" , "Calle 44 y 12");
        hospital.mostrarCamas();
        Paciente paciente = new Paciente(43969405,"Martiniano","Casa");
        for(int i=1 ; i<=20 ; i++){
            hospital.ingresarPaciente(paciente, 1, i);
        }
        hospital.incrementarDiasCamas();
        System.out.println("Pisos llenos: " + hospital.devolverPisosLlenos());
        hospital.darDeAltaPaciente(43969405);
    }
    
}
