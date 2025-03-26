/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalConcursoDeBaile;

/**
 *
 * @author Usuario
 */
public class EjercicioFinal {
    public static void main(String[] args){
        
        Concurso concurso1 = new Concurso(5);
        
        Participante participante1 = new Participante(43,"Julian",15);
        Participante participante2 = new Participante(16,"Pedro",73);
        Pareja pareja1 = new Pareja("Zamba",participante1,participante2);
        
        
        Participante participante3 = new Participante(48,"Jaime",16);
        Participante participante4 = new Participante(65,"Jaimito",8);
        Pareja pareja2 = new Pareja("Bachata",participante3,participante4);
        
        concurso1.agregarPareja(pareja1);
        concurso1.agregarPareja(pareja2);
        
        Pareja parejaGanadora = concurso1.obtenerParejaConMasDiferenciaEdad();
        System.out.println("Los nombres de la pareja con mas diferencia de edad son: " + "\n"  + "En caso del primer participante:  " + parejaGanadora.getParticipante1().getNombre() + "  y el nombre del otro particpante es:  " + parejaGanadora.getParticipante2().getNombre());

    }
}
