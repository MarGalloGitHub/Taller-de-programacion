/*
 * Cualquier empleado se caracteriza por su nombre, sueldo básico y antigüedad. 

    Cualquier empleado debe responder al mensaje calcularSueldoACobrar. El sueldo a 
cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad y además:
 */
package Tema4.Ejercicio2;

/**
 *
 * @author Usuario
 */
public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;
    private int antiguedad;

    public Empleado(String nombre, double sueldoBasico, int antiguedad) {
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.antiguedad = antiguedad;
    }

    public String getNombre() {
        return nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public abstract double calcularEfectividad();  // se comparte para ambos pero cada uno lo hace distinto
    
    public double calcularSueldoACobrar(){
        double aux = sueldoBasico + ((sueldoBasico * 0.1) * antiguedad) ;
        return aux;
    }
    
    /*
    Cualquier empleado debe responder al mensaje toString, que devuelve un String que 
    lo representa, compuesto por nombre, sueldo a cobrar y efectividad.
    */
    
    @Override
    public String toString(){
        String aux = "nombre:  " + nombre + ", sueldo a cobrar:     " + this.calcularSueldoACobrar() + ", posee una efectivdad de:   " + this.calcularEfectividad();
        return aux;
    }
}
