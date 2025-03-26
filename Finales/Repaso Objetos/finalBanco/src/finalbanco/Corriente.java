/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalbanco;

/**
 *
 * @author Usuario
 */
public class Corriente extends Cuenta{
    private double acuerdo;

    public Corriente(double acuerdo, int numeroCuenta, int dniCliente) {
        super(numeroCuenta, dniCliente);
        this.acuerdo = acuerdo;
    }
    
    @Override
    public boolean esPosibleExtraer(double unMonto){
        boolean puede = false;
        if((this.getSaldo() + this.acuerdo ) > unMonto){
            puede = true;
        }
        return puede;
    }
    
    @Override
    protected void cobrarMantenimiento(){
        if(this.esPosibleExtraer(this.acuerdo * 50)){
            this.Extraer(this.acuerdo * 50);
        }
    }
    
    @Override
    public String toString(){
        String valor = super.toString();
        valor+= "Valor del acuerdo: " + this.acuerdo;
        return valor;
    }
}
