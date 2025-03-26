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
import PaqueteLectura.Lector;
public abstract class Servicio {
    private Estacion estacion;
    private int añosCalcular;
    private double[][] temperaturas;

    public Servicio(Estacion estacion, int añosCalcular) {
        this.estacion = estacion;
        this.añosCalcular = añosCalcular;
        temperaturas = new double[añosCalcular][12]; 
        int i;
        int j;
        for(i=0 ; i<= (añosCalcular - 1); i++){
            for(j=0 ; j<= 11 ; j++){
                temperaturas[i][j] = 0;
            }
        }
    }

    public int getAñosCalcular() {
        return añosCalcular;
    }

    public double[][] getTemperaturas() {
        return temperaturas;
    }
    
    
    
    public void registrarTemperatura(int mes, int año){
         double temperatura = Lector.leerDouble();
         temperaturas[año][mes] = temperatura;
        
    }
    
    public double devolverTemperatura(int mes, int año){
        double aux = 0;
        if((año >= 2024 - (añosCalcular - 1) ) && (mes <= 11)){
            aux = temperaturas[2024 - año - 1][mes - 1];
        }
        return aux;
    }
    
    @Override
    public String toString(){
        String aux= this.estacion.getNombre() + "  (" + this.estacion.getCoordenadaLatitud() + "  S - " + this.estacion.getCoordenadaLongitud() + "  O) : ";
        return aux;
    }
    
    public String devolverFechaMayorTemp(){
        int añoMax = 0;
        int mesMax = 0;
        double TemperaturaMax = -1;
        int i;
        int j;
        for(i=0 ; i<= (this.añosCalcular - 1) ; i++){
            for(j=0 ; j<= 11 ; j++){
                if(temperaturas[i][j] > TemperaturaMax){
                    añoMax = i;
                    mesMax = j;
                    TemperaturaMax = temperaturas[i][j];
                }
            }
        }
        String aux = "La temperatura mas alta fue:  " + TemperaturaMax + ", en la siguiente fecha:  Mes  " + (mesMax + 1) + "  del año  " + (añoMax + 1);
        return aux;
    }
}
