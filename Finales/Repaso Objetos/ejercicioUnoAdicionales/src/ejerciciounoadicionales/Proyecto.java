/*
 Un proyecto 
tiene: nombre, código, nombre completo del director y los investigadores que participan 
en el proyecto (50 como máximo). 
 */
package ejerciciounoadicionales;

/**
 *
 * @author Usuario
 */
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private Investigador[] investigadores;
    private int dimL;

    public Proyecto(String nombre, int codigo, String nombreDirector) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        this.investigadores = new Investigador[50];  //no lo inicializo porque lo hace java
        this.dimL = 0;
    }
    
    public void agregarInvestigador(Investigador inv){
        if(dimL < 49){
            this.investigadores[dimL] = inv;
            this.dimL++;
        }
        else{
            System.out.println("Cupo de investigadores lleno");
        }
    }
    public double dineroTotalOtorgado(){
        double valor = 0;
        for(int i = 0 ; i < this.dimL ; i++){
            valor+=this.investigadores[i].calcularValorSubsidios();
        }
        return valor;
    }
    
    public void otorgarTodos(String nombre){
        int i = 0;
        boolean encontre = false;
        while((i < this.dimL) && (encontre = false)){
            if(this.investigadores[i].getNombreCompleto().equals(nombre)){
                encontre = true;
            }
        }
        if(encontre = true){
            this.investigadores[i].activarSubsidios();
        }
    }
    
    @Override
    public String toString(){
        String valor = "Nombre del proyecto: " + this.nombre + "\n" + "Codigo del proyecto: " + this.codigo + "\n";
        valor+= "Valor total de dinero otorgado al proyecto" + this.dineroTotalOtorgado();
        valor+= "Informacion de los investigadores que formaron parte del proyecto: " + "\n";
        for(int i = 0 ; i < this.dimL ; i++){
            valor+=this.investigadores[i].toString();
        }
        return valor;
    }
}
