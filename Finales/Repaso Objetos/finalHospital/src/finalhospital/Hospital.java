/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalhospital;

/**
 *
 * @author Usuario
 */
public class Hospital {
    private String nombre;
    private String direccion;
    private Cama[][] camas;

    public Hospital(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.camas = new Cama[10][20];
        Cama cama;
        int num = 1;
        for(int i=0 ; i<=9 ; i++){
            for(int j=0 ; j<=19 ; j++){
                this.camas[i][j] = new Cama(num,false);
                num++;
            }
        }
    }
    
    public void ingresarPaciente(Paciente paciente,int piso,int cama){
        System.out.println("Paciente ingresado en piso: " + piso + " | cama: " + cama);
        this.camas[piso - 1][cama - 1].agregarPaciente(paciente);
    }
    
    public void mostrarCamas(){
        for(int i=0 ; i<=9 ; i++){
            for(int j=0; j<=19;j++){
                System.out.println(this.camas[i][j].getId());
                if(this.camas[i][j].isOcupada()){
                    System.out.println("Cama ocupada");
                }
                else
                {
                    System.out.println("Cama vacia");
                }
            }
        }
    }
    
    public void darDeAltaPaciente(int dni){
        int i=0;
        int j=0;
        boolean encontre=false;
        while((i<=9) && (encontre == false)){
            j=0;
            while((j<=19) && (encontre == false)){
                if(this.camas[i][j].isOcupada() == true){
                    if(this.camas[i][j].getIdPaciente() == dni){
                        this.camas[i][j].darAlta();
                        encontre = true;
                        System.out.println("Paciente dado de alta con exito");
                    }
                }
            }
        }
    }
    
    public void incrementarDiasCamas(){
        for(int i=0 ; i<=9;i++){
            for(int j=0;j<=19;j++){
                if(this.camas[i][j].isOcupada()){
                    this.camas[i][j].incrementarDias();
                }
            }
        }
    }
    
    public int devolverPisosLlenos(){
        int valor = 0;
        int cant;
        for(int i=0 ; i<=9;i++){
            cant = 0;
            for(int j=0 ; j<=19;j++){
                if(this.camas[i][j].isOcupada()){
                    cant++;
                }
            }
            if(cant == 20){
                valor++;
            }
        }
        return valor;
    }
}
