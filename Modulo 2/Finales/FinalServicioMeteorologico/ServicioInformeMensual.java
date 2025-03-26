/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalServicioMeteorologico;

/**
 *
 * @author Usuario
 */
public class ServicioInformeMensual extends Servicio{

    public ServicioInformeMensual(Estacion estacion, int añosCalcular) {
        super(estacion, añosCalcular);
    }
    
    @Override
    public String toString(){
        String aux = super.toString();
        int i;
        int j;
        for(i=0 ; i<= 11 ; i++){
            aux+= "Para el mes: " + (i+1) + ":  ";
            double prom = 0;
            for(j=0 ; j<= (this.getAñosCalcular() - 1); j++){
                prom += this.getTemperaturas()[j][i] ;
            }
            if(prom != 0){
                prom = prom /this.getAñosCalcular();
            }
            aux+= prom;
        }
        return aux;
    }
}
