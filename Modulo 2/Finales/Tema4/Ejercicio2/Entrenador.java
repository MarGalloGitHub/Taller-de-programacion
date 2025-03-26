/*
 * Los entrenadores son empleados que se caracterizan por la cantidad de campeonatos 
ganados.
 */
package Tema4.Ejercicio2;

/**
 *
 * @author Usuario
 */
public class Entrenador extends Empleado {
    private int campeonatosGanados;

    public Entrenador(int campeonatosGanados, String nombre, double sueldoBasico, int antiguedad) {
        super(nombre, sueldoBasico, antiguedad);
        this.campeonatosGanados = campeonatosGanados;
    }

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    @Override
    public double calcularEfectividad(){
       double aux = (double) campeonatosGanados / this.getAntiguedad(); // preguntrar si la diferencia entre super y this
       return aux;
    }
    
    /* 
    Cualquier empleado debe responder al mensaje calcularSueldoACobrar. El sueldo a 
    cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad y además:
    Para los entrenadores: se adiciona un plus por campeonatos ganados (5000$ si ha 
    ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos;
    */
    
    @Override
    public double calcularSueldoACobrar(){
        double aux = super.calcularSueldoACobrar();
        if((campeonatosGanados >= 1) && (campeonatosGanados <=4)){
            aux+= 5000;
            }
        if((campeonatosGanados >= 5) && (campeonatosGanados <= 10)){
            aux+= 30000;
            }
        return aux;
    }
}
