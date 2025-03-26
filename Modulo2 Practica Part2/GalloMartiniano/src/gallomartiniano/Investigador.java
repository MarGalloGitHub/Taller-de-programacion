/*
 * De cada investigador se tiene: nombre completo, 
    categoría (1 a 5) y especialidad. Además, cualquier investigador puede pedir hasta un 
    máximo de 5 subsidios.

    b. Un investigador sólo debería poder construirse con nombre, categoría y 
    especialidad.

    b. void agregarSubsidio(Subsidio unSubsidio);
     agregar un subsidio al investigador.
 */
package gallomartiniano;

/**
 *
 * @author Usuario
 */
public class Investigador {
    private String nombreCompleto;
    private int [] categoria;
    private String especialidad;
    private Subsidio [] subsidios;

    public Investigador(String nombreCompleto, int numeroCategoria, String especialidad) {
        this.nombreCompleto = nombreCompleto;
        this.categoria = new int [5];
        for (int i= 0; i < 5 ; i++)   // inicializo para poder marcar la categoria
            categoria[i] = 0;
        if(numeroCategoria <= 5){                    // si la categoria ingresada es correcta entonces marco cual es
            this.marcarCategoria(numeroCategoria);
        }
        
        this.especialidad = especialidad;
        this.subsidios = new Subsidio[5];  // java lo inicializa en null por lo que no lo hago
    }
    
    private void marcarCategoria(int numeroCategoria){
        int i;
        for(i = 0 ; i < (numeroCategoria - 1)  ; i++)
            i++;
        categoria[i] = 1;
    }
    
    int dimL = 0;
    public void agregarSubsidio(Subsidio unSubsidio){
        int i= 0;
        while((subsidios[i] != null)&&(i <5))
            i++;
        if((subsidios[i] ==  null) &&(i<5)){
            subsidios[i] = unSubsidio;
            subsidios[i].acomodoarSubsidio();
            dimL++;
        }
    }
    
    public double montoPorSubsidio(){
        int aux= 0;
        int i;
        for(i = 0 ; i < dimL ; i++)
            aux += subsidios[i].moneySubsidio();
        return aux;
    }
    
    public int devolverCategoria(){
        int aux = 0;
        int i = 0;
        while((categoria[i] == 0) && (i<5))
            i++;
        if(i<5)
            aux = i;
        
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = nombreCompleto + this.devolverCategoria() + especialidad + this.montoPorSubsidio();
        return aux;
    }
            
    
}
