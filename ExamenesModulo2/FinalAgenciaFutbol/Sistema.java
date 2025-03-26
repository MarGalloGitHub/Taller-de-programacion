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
import PaqueteLectura.Lector;
public class Sistema {
    private Partido[] partidos;
    private int dimLpartidos;
    private Apuesta[] apuestas;
    private int dimLapuestas;

    public Sistema() {
        partidos = new Partido[20];  // preguntar cuando iniciar en null o no
        apuestas = new Apuesta[100];
        this.dimLpartidos = 0;
        this.dimLapuestas = 0;
    }
    
    public int agregarPartido(){
        int aux = 0;
        if(dimLpartidos <= 19){
            System.out.println("Cargue informacion de un partido: NOMBRE EQUIPO LOCAL, NOMBRE EQUIPO VISITANTE, VALOR POR SI GANA EL LOCAL, VALOR POR SI HAY EMPATE Y VALOR POR SI GANA EL VISITANTE");
            Partido partido1 = new Partido(Lector.leerString(),Lector.leerString(),Lector.leerDouble(),Lector.leerDouble(),Lector.leerDouble());
            partidos[dimLpartidos] = partido1;
            aux += dimLpartidos;
            dimLpartidos++;
        }
        return aux;
    }
    
    public void agregarApuesta(){
        if(dimLapuestas <= 99){
           System.out.println("Cargue informacion de una apuesta:  NOMBRE DEL CLIENTE, DNI DEL CLIENTE, ID UNICO DE PARTIDO, QUE APOSOTO (VICTORIA LOCAL, EMPATE O VICTORIA VISITANTE) Y CUANTO APOSTO" ); 
           Apuesta apuesta1 = new Apuesta(Lector.leerString(),Lector.leerInt(),Lector.leerInt(),Lector.leerString(),Lector.leerDouble());
           apuestas[dimLapuestas] = apuesta1;
           dimLapuestas++;
        }
    }
    
    public void ingresarResultado(int ID){
        if(partidos [ID - 1] != null){
            System.out.println(" ingresar alguna de las 3 opciones:  VICTORIA LOCAL, EMPATE O VICTORIA VISITANTE");
            partidos[ID - 1].setResultado(Lector.leerString());
        }
    }
    
    /* public void cerrarApuestas(){
        int i;
        for(i=0; i<= (dimLapuestas - 1) ; i++){
            if(apuestas[i].getQueAposto().equals(partidos[apuestas[i].getIdPartido()].getResultado())){
                String aux = "Ganadaor de la apuesta:  Nombre:  " + apuestas[i].getNombreCliente() + ",DNI:  " + apuestas[i].getDniCliente() + " y gano:  ";
                switch (apuestas[i].getQueAposto()) {
                    case "VICTORIA LOCAL":
                        aux+= apuestas[i].getMontoApostado() * partidos[apuestas[i].getIdPartido()].getFactorVictoriaLocal();
                        break;
                    case "VICTORIA VISITANTE":
                        aux+= apuestas[i].getMontoApostado() * partidos[apuestas[i].getIdPartido()].getFactorVictoriaVisitante();
                        break;
                    case "EMPATE":
                        aux+= apuestas[i].getMontoApostado() * partidos[apuestas[i].getIdPartido()].getFactorEmpate();
                        break;
                    default:
                        break;
                }
            }
        }
    }
    */
    
    public void cerrarApuestas(){  //preguntar
        int i;
        for(i=0; i<= (dimLapuestas - 1) ; i++){
            if(apuestas[i].getQueAposto().equals(partidos[apuestas[i].getIdPartido() - 1].getResultado())){
                String aux = "Ganadaor de la apuesta:  Nombre:  " + apuestas[i].getNombreCliente() + ",DNI:  " + apuestas[i].getDniCliente() + " y gano:  ";
                if(apuestas[i].getQueAposto().equals("VICTORIA LOCAL")){
                    aux+= apuestas[i].getMontoApostado() * partidos[apuestas[i].getIdPartido()].getFactorVictoriaLocal();
                }
                else
                    if(apuestas[i].getQueAposto().equals("VICTORIA VISITANTE")){
                         aux+= apuestas[i].getMontoApostado() * partidos[apuestas[i].getIdPartido()].getFactorVictoriaVisitante();
                    }
                    else
                        if(apuestas[i].getQueAposto().equals("EMPATE")){
                             aux+= apuestas[i].getMontoApostado() * partidos[apuestas[i].getIdPartido()].getFactorEmpate();
                        }
             System.out.println(aux);
            }
        }
    }
    
    public void limpiarSistema(){
        this.partidos = new Partido[20];
        this.apuestas = new Apuesta[100];
    }
}
