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
public class ServicioInformeAnual extends Servicio{

    public ServicioInformeAnual(Estacion estacion, int añosCalcular) {
        super(estacion, añosCalcular);
    }
    
   @Override
    public String toString(){
        String aux = super.toString();
        int i;
        int j;
        for(i=0 ; i<= (this.getAñosCalcular() - 1) ; i++){
            aux+= "Para el año: " + (2024 - this.getAñosCalcular() + i) + ":  ";
            double prom = 0;
            for(j=0 ; j<= (11); j++){
                prom += super.getTemperaturas()[i][j] ;
            }
            if(prom != 0){
                prom = prom / 12;
            }
            aux+= prom + "--";
        }
        return aux;
    }
}
