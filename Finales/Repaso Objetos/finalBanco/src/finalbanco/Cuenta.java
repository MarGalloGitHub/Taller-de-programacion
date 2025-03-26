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
public abstract class Cuenta {
    private int numeroCuenta;
    private int dniCliente;
    private double saldo;
    private boolean activa;
    private double[] movimientos;
    private int dimL;

    public Cuenta(int numeroCuenta, int dniCliente) {
        this.numeroCuenta = numeroCuenta;
        this.dniCliente = dniCliente;
        this.saldo = 0;
        this.activa = true;
        this.dimL = 0;
        this.movimientos = new double[5];//no inicializo el vector porque lo hace java
    }
    
    public double getSaldo(){
        return this.saldo;
    }
    
    private void actualizarHistorial(double valor , boolean cual){
        if(cual == false){
           valor = valor * (-1);
        }
        if(this.dimL == 5){
            this.dimL = 0;
            this.movimientos[this.dimL] = valor;
            this.dimL++;
        }
        else
        {
            this.movimientos[this.dimL]=valor;
            this.dimL++;
        }
    }
    
    public void depositar(double monto){
        this.saldo+= monto;
        this.actualizarHistorial(monto, true);
    }
    
    public abstract boolean esPosibleExtraer(double monto);
  
    public boolean Extraer(double unMonto){
        boolean puede = false;
        if(this.esPosibleExtraer(unMonto)){
            this.saldo-=unMonto;
            this.actualizarHistorial(unMonto, false);
            puede = true;
        }
        return puede;
    }
    
    protected abstract void cobrarMantenimiento();
   
    private String mostrarMovimientos(){
        String valor = "";
        for(int i=0 ; i<this.dimL;i++){
            if(this.movimientos[i] <= (-1)){
                valor+= "Extraccion con valor igual a: " + this.movimientos[i];
            }
            else
            {
                valor+= "Deposito con valor igual a: " + this.movimientos[i];
            }
            valor+="\n";
        }
        return valor;
    }
    
    @Override
    public String toString(){
        String valor = "Numero de cuenta: " + this.numeroCuenta + "\n";
        valor+= "Dni del cliente: " + this.dniCliente + "\n";
        valor+= "Moviemientos" + "\n" + this.mostrarMovimientos();
        if(this.activa == true){
             valor+= "Estado: Activa" + "\n";
        }
        else
        {
            valor+= "Estado: Inactiva" + "\n";
        }
        valor+= "Saldo disponible: "+ this.saldo + "\n";
        return valor;
    }
}
