/*
 *Los jugadores son empleados que se caracterizan por el número de partidos jugados y 
el número de goles anotados.


 */
package Tema4.Ejercicio2;

/**
 *
 * @author Usuario
 */
public class Jugador extends Empleado {
    private int partidosJugados;
    private int numeroGoles;

    public Jugador(int partidosJugados, int numeroGoles, String nombre, double sueldoBasico, int antiguedad) {
        super(nombre, sueldoBasico, antiguedad);
        this.partidosJugados = partidosJugados;
        this.numeroGoles = numeroGoles;
    }

    public int getPartidosJugados() {
        return partidosJugados;
    }

    public int getNumeroGoles() {
        return numeroGoles;
    }

    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }

    public void setNumeroGoles(int numeroGoles) {
        this.numeroGoles = numeroGoles;
    }
    
    @Override
    public double calcularEfectividad(){
      double aux = (double)(numeroGoles/partidosJugados);
      return aux;
    }
    
    /* Cualquier empleado debe responder al mensaje calcularSueldoACobrar. El sueldo a 
cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad y además:

 Para los jugadores: si el promedio de goles por partido es superior a 0,5 se adiciona un 
plus de otro sueldo básico. 

*/
    @Override
    public double calcularSueldoACobrar(){
        double aux = super.calcularSueldoACobrar();
        if(this.calcularEfectividad() > 0.5){
            aux+= this.getSueldoBasico();
        }
        return aux;
    }
}
