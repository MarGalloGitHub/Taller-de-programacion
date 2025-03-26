/*
 De cada investigador se tiene: nombre completo, 
categoría (1 a 5) y especialidad. Además, cualquier investigador puede pedir hasta un 
máximo de 5 subsidios.

b. Un investigador sólo debería poder construirse con nombre, categoría y 
especialidad.

void agregarSubsidio(Subsidio unSubsidio);
// agregar un subsidio al investigador.

 */
package RepasoEjercicio1;

/**
 *
 * @author Usuario
 */
public class Investigador {
    private String nombreCompleto;
    private int categoria;
    private String especialidad;
    private Subsidio[] subsidios;
    private int dimL;

    public Investigador(String nombreCompleto, int categoria, String especialidad) {
        this.nombreCompleto = nombreCompleto;
        this.categoria = categoria;
        this.especialidad = especialidad;
        
        subsidios = new Subsidio[5];
        for(int i=0;i<=4;i++){
            subsidios[i] = null;
        }
        dimL = 0;
    }
    
    /*
    void agregarSubsidio(Subsidio unSubsidio);
// agregar un subsidio al investigador.
    
    */
    
    public void agregarSubsidio(Subsidio unSub){
        if(dimL <= 4){
            subsidios[dimL] = unSub;
            subsidios[dimL].setOtorgado(true);
            dimL++;
        }
    }
    
    public double dineroSubsidios(){
        double aux = 0;
        int i;
        for(i=0; i<= (dimL - 1); i++){
            aux += subsidios[i].getMontoPedido();
        }
        return aux;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }
    /*
    investigador: nombre, categoría, especialidad, y el total de dinero de sus 
    subsidios otorgados
    */
    
    @Override
    public String toString(){
        String aux = "El nombre del investigador es:  " + this.nombreCompleto + ", su categoria es: " + this.categoria + ", su especialidad es: " + this.especialidad + ", y el dinero total otorgado a sus subsidios es: " + this.dineroSubsidios();
        return aux;
    }
}
