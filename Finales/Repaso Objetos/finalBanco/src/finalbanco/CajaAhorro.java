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
public class CajaAhorro extends Cuenta{
    private boolean tieneTarjeta;

    public CajaAhorro(boolean tieneTarjeta, int numeroCuenta, int dniCliente) {
        super(numeroCuenta, dniCliente);
        this.tieneTarjeta = tieneTarjeta;
    }
    
    @Override
    public boolean esPosibleExtraer(double monto){
        boolean puede = false;
        if(this.getSaldo() > monto){
            puede = true;
        }
        
        return puede;
    }
    
    @Override
    protected void cobrarMantenimiento(){
        int base = 1000;
        if(this.tieneTarjeta){
            base = 2000;
        }
       double valor = base + (1/(this.getSaldo() + 1));
       if(this.esPosibleExtraer(valor)){
           this.Extraer(valor);
       }
    }
    
    @Override
    public String toString(){
        String valor = super.toString();
        if(this.tieneTarjeta){
            valor+= "Tiene tarjeta asociada";
        }
        else{
            valor+="No tiene tarjeta asociada";
        }
        valor+="\n";
        return valor;
    }
}
