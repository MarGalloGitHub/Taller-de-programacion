/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testeos;

/**
 *
 * @author Usuario
 */
public class Oficina {
    private boolean ocupada;
    private Persona per;

    public Oficina() {
        this.ocupada = false;
    }
    
    public String mostrarOfi(){
        String dato = "";
        if(this.ocupada == false){
            dato+= "Oficina libre";
        }
        else{
            dato+= "Oficina ocupada por:" + this.per.toString();
        }
        return dato;
    }
    
    public void agregarPersona(Persona per){
        this.ocupada = true;
        this.per = per;
    }
    
}
