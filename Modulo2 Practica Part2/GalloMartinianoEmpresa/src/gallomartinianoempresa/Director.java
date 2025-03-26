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
import PaqueteLectura.Lector;
public class Director extends Personal {
    private double montoViaticos;

    public Director(double montoViaticos, String nombre, int dni, int anioEntrada, double sueldoBasico) {
        super(nombre, dni, anioEntrada, sueldoBasico);
        this.montoViaticos = montoViaticos;
    }
   
    @Override
    public double retornarSueldoAcobrar(){
        double aux = super.retornarSueldoAcobrar();
               System.out.println("Escriba monto a viaticos para el director");
               aux += Lector.leerDouble();          //monto a viaticos
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = super.toString();
               aux += this.retornarSueldoAcobrar() + montoViaticos ;
        
        return aux;
    }
}
