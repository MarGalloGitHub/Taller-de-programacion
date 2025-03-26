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
public class Empresa {
    private String nombre;
    private String direccion;
    private Director direc;
    private Encargado [] sucursales;
    private int cantSucursales;

    public Empresa(String nombre, String direccion, Director direc , int N) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.direc = direc;
        
        this.sucursales = new Encargado[N]; // no inicializo en null porque lo hace java
        this.cantSucursales = N;
    }
    
    public void asignarEncargado(int X){
        System.out.println("Escriba el nombre del encargado");
        String nombreE = Lector.leerString();   //armo encargado
        System.out.println("Escriba el dni del encargado");
        int dniE = Lector.leerInt();
        System.out.println("Escriba el año de entrada del encargado");
        int anioEntradaE = Lector.leerInt();
        System.out.println("Escriba el sueldo del encargado");
        double sueldoB = Lector.leerDouble();
        System.out.println("Escriba la cantidad de pibes a cargo del encargado");
        int cantCargo = Lector.leerInt();
        
        Encargado E = new Encargado(cantCargo,nombreE,dniE,anioEntradaE,sueldoB);
        
        if(sucursales[X] == null){
            sucursales[X] = E;
        }
    }
    
    public String retornarSueldoAcobrar(){
        String aux = "Los montos a cobrar por cada uno son:  ";
        return aux;
   }
    
    @Override 
    public String toString(){
        String aux = "Info de la empresa :  " +  "\n" + nombre + "\n" + direccion + "\n" + "El director de la empresa : " + "\n"+ direc.toString() + "\n" ;
        String aux2 = "Los encargados y sus sucursales : ";
        int i;
        for (i = 0 ; i < cantSucursales ; i++){
            if(sucursales[i] != null){
                aux2 += "Info encargado de sucursal : "+ (i+1) + sucursales[i].toString();
            }
            else
                aux2 += "La sucursal numero : " + (i+1) + "no tiene encargado";
        }
        return aux;
    }
    
}
