/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gallomartinianoempresa;

/**
 *
 * @author Usuario
 */
public abstract class Personal {
    private String nombre;
    private int dni;
    private int anioEntrada;
    private double sueldoBasico;

    public Personal(String nombre, int dni, int anioEntrada, double sueldoBasico) {
        this.nombre = nombre;
        this.dni = dni;
        this.anioEntrada = anioEntrada;
        this.sueldoBasico = sueldoBasico;
    }

    public String getNombre() {
        return nombre;
    }

    public int getDni() {
        return dni;
    }

    public int getAnioEntrada() {
        return anioEntrada;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }
    
    public double retornarSueldoAcobrar(){
        double aux = this.getSueldoBasico();
        if ((this.getAnioEntrada() - 2000) > 0 )
            aux += (this.getSueldoBasico() * 0.10);
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = "La informacion es : " +nombre + dni + anioEntrada;
        
        
        return aux;
    }
    
}
