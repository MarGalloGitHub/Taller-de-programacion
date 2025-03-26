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
public class Encargado extends Personal {
    private int cantAcargo;

    public Encargado(int cantAcargo, String nombre, int dni, int anioEntrada, double sueldoBasico) {
        super(nombre, dni, anioEntrada, sueldoBasico);
        this.cantAcargo = cantAcargo;
    }
    
    @Override
    public double retornarSueldoAcobrar(){
        double aux = super.retornarSueldoAcobrar();
               aux += (1000 * cantAcargo);
        return aux;
    }
    
    @Override
    public String toString(){
        String aux =  super.toString();
               aux += this.retornarSueldoAcobrar() + cantAcargo ;
        
        return aux;
    }
}
