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
public class Edificio {
    private int numero;
    private Oficina[][] oficinas;

    public Edificio(int numero) {
        this.numero = numero;
        this.oficinas = new Oficina[10][10];
        for(int i=0 ; i<=9 ; i++){
            for(int j=0 ; j<=9;j++){
                this.oficinas[i][j] = new Oficina();
            }
        }
    }
    
    public String mostrarEdificio(){
     String dato = "";
     for(int i=0 ; i<=9;i++){
         dato+= "\n" + "Piso: " + (i + 1);
         for(int j=0 ; j<=9;j++){
             dato+= "\n" + "Oficina" + (j + 1) + ":" + "" + this.oficinas[i][j].mostrarOfi();
         }
     }
     return dato;
    }
    
    public void agregarPersona(Persona per , int piso , int oficina ){
        this.oficinas[piso - 1][oficina - 1].agregarPersona(per);
    }
}
