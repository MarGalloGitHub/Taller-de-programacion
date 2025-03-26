/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalfabricaautomotriz;

/**
 *
 * @author Usuario
 */
public class Sector {
    private String nombre;
    private Empleado jefe;
    private Empleado[] empleados;
    private int dimLEmple;
    private Producto[] productos;
    private int dFProd;
    private int dimLProd;

    public Sector(String nombre , int cantProductos) {
        this.nombre = nombre;
        this.productos = new Producto[cantProductos];
        this.empleados = new Empleado[50];
        this.dimLEmple = 0;
        this.dFProd = cantProductos;
        this.dimLProd =0;
    }
    
    
    public void agregarEmpleado(Empleado emple, boolean esJefe){
        if(esJefe == true){
            this.jefe = emple;
        }
        else{
            this.empleados[this.dimLEmple] = emple;
            this.dimLEmple++;
        }
    }
    
    public void agregarProducto(Producto prod){
        if(this.dimLProd < this.dFProd){
            this.productos[this.dimLProd] = prod;
            this.dimLProd++;
        }
        else{
            System.out.println("Cantidad de productos limite, no se pudo agregar");
        }
    }
    
    public double costoTotal(int unaEtapa){
        double valor = 0;
        for(int i=0 ; i<this.dimLProd ; i++){
            if(this.productos[i].getEtapa()== unaEtapa){
                valor+= this.productos[i].getCostoTotal();
            }
        }
        return valor;
    }
    public void cambiarEtapa(int unCodProducto , double unCosto){
        int i=0;
        boolean encontre = false;
        while((i < this.dimLProd) && (encontre == false)){
            if(this.productos[i].getCodigo() == unCodProducto){
                encontre = true;
            }
            i++;
        }
        if(encontre == true){
            this.productos[i-1].actualizar(unCosto);
        }
    }
    
    private double sacarCostoProductos(){
        double valor = 0;
        for(int i=0 ; i< this.dimLProd;i++){
            if(this.productos[i].getEtapa() == 5){
                valor+= this.productos[i].getCostoTotal();
            }
        }
        return valor;
    }
    
    @Override
    public String toString(){
        String valor ="Nombre del sector: " + this.nombre + "\n";
        valor+="Datos del jefe: "+ this.jefe.toString() + "\n";
        valor+="Cantidad de productos con los que se trabaja: " + this.productos.length + "\n";
        valor+= "Costo de productos en etapa 5:" + this.sacarCostoProductos() + "\n";
        valor+="Empleados" + "\n";
        for(int i=0 ; i<this.dimLEmple ;i++){
            if(this.empleados[i].getAntiguedad() > 10){
                valor+= this.empleados[i].toString() + "\n";
            }
        }
        return valor;
    }
}
