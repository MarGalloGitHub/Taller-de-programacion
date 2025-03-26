/*
 De todo recital se conoce el nombre de la banda y la lista de temas que tocarán durante 
el recital.

El constructor de recitales recibe el nombre de la banda 
y la cantidad de temas que tendrá el recital.
 */
package RepasoEjercicio3;

/**
 *
 * @author Usuario
 */
public abstract class Recital {
    private String nombreBanda;
    private String [] temas;
    private int cantidadPosibleTemas;
    private int dimL;

    public Recital(String nombreBanda, int cantidadPosibleTemas) {
        this.nombreBanda = nombreBanda;
        this.cantidadPosibleTemas = cantidadPosibleTemas;
        temas = new String[cantidadPosibleTemas];
        dimL = 0;
    }

    public String[] getTemas() {
        return temas;
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public int getCantidadPosibleTemas() {
        return cantidadPosibleTemas;
    }

    public int getDimL() {
        return dimL;
    }


    
    /*
    Cualquier recital debe saber responder a los mensajes:

     agregarTema que recibe el nombre de un tema y lo agrega a la lista de temas. 

     actuar que imprime (por consola) para cada tema la leyenda “y ahora 
    tocaremos…” seguido por el nombre del tema.
    */
    
    public void agregarTema(String nombreTema){
        if(dimL <= (cantidadPosibleTemas - 1)){
            temas[dimL] = nombreTema;
            dimL++;
        }
    }
    
    public String actuar(){
        int i;
        String aux = " Comenzando";
        for(i=0 ; i<= (dimL - 1) ; i++){
            aux += "Y ahora tocaremos:   ";
            aux += temas[i] + "\n";
        }
        return aux;
    }
    
    /* 
    iv. Todo recital debe saber responder al mensaje calcularCosto teniendo en cuenta lo 
    siguiente. Si es un evento ocasional devuelve 0 si es a beneficio, 50000 si es un show de TV 
    y 150000 si es privado. Las giras deben devolver 30000 por cada fecha de la misma.
    */
    
    public abstract double calcularCosto();
    
}
