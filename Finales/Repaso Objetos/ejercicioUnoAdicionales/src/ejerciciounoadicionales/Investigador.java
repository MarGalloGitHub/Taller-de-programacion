/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejerciciounoadicionales;

/**
 *
 * @author Usuario
 */
public class Investigador {
    private String nombreCompleto;
    private int categoria;
    private String especialidad;
    private Subsidio[]subsidios;
    private int dimL;

    public Investigador(String nombreCompleto, int categoria, String especialidad) {
        this.nombreCompleto = nombreCompleto;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.subsidios = new Subsidio[5];
        InicializarVector(this.subsidios);
        this.dimL =0;
    }
    
    private void InicializarVector(Subsidio[] subsidios){
        for (int i= 0 ; i<= 4 ; i++){
            subsidios[i] = null;
        }
    }
    
    public void agregarSubsidio(Subsidio sub){
        if(dimL < 4){
            this.subsidios[this.dimL] = sub;
            this.dimL++;
        }
        else{
            System.out.println("Cantidad limite de subsidios completa");
        }
    }
    
    public double calcularValorSubsidios(){
        double valor = 0;
        for(int i= 0 ; i < dimL;i++){
            valor+=this.subsidios[i].getMonto();
        }
        return valor;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }
    
    public void activarSubsidios(){
        for(int i=0;i<this.dimL;i++){
            this.subsidios[i].activarSubsidio();
        }
    }
    
    @Override
    public String toString(){
        String valor = "Nombre: " + this.nombreCompleto + "Categoria: " + this.categoria;
        valor+= "Especialidad " + this.especialidad + "Total de subsidios otorgados: " + this.calcularValorSubsidios();
        valor+="\n";
        return valor;
    }
}
