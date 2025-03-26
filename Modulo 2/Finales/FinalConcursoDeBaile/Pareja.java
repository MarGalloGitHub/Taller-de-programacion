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
public class Pareja {
    private String estiloDeBaile;
    private Participante participante1;
    private Participante participante2;

    public Pareja(String estiloDeBaile, Participante participante1, Participante participante2) {
        this.estiloDeBaile = estiloDeBaile;
        this.participante1 = participante1;
        this.participante2 = participante2;
    }
    
    public int obtenerDiferenciaDeEdad(){
        int edadP1 = this.participante1.getEdad();
        int edadP2 = this.participante2.getEdad() ;
        
        int aux = edadP1 - edadP2;
        if(aux < 0){
            aux = (aux * (-1));
        }
        return aux;
    }

    public Participante getParticipante1() {
        return participante1;
    }

    public Participante getParticipante2() {
        return participante2;
    }
    
    
}
