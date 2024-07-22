/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conciertosestadio;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class Estadio {
    private String nombre;
    private String direccion;
    private int capacidad;
    private Concierto [][] agenda;
    private int [] dimLs;

    public Estadio(String nombre, String direccion,int capacidad) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.capacidad = capacidad;
        this.agenda = new Concierto[12][31]; // todo en null porque lo inicializa java en null (sin ningun concierto)
        this.dimLs = new int [12];
        int i;
        for (i = 0 ; i < 12; i++)
                dimLs[i]= 0;
    }

    public void registrarConcierto(int M){
        
     
       System.out.println("escriba un nombre del artista");
        String nombreA = Lector.leerString();
        System.out.println("escriba precio de la entrada");
        double precioE = Lector.leerDouble();
        System.out.println("escriba la cantidad de entradas vendidas");
        int cantEnVendi = Lector.leerInt();
        
        int j = 0;                                          //busco donde agendar
        while((agenda[M - 1][j] != null) && (j < 31))
            j++;
        if ((agenda[M -1][j] != null) && (j < 31)) {
            Concierto C = new Concierto(nombreA,precioE,cantEnVendi);
            agenda[M - 1][j] = C;
            dimLs[M - 1] += 1;
        }
    }
    
    public String devolverInfoMes (int M){
        String aux = "Conciertos de este mes : ";
        int i;
        for(i = 0; i < dimLs[M] ; i++)
            aux += agenda[M][i].toString(); 
        return aux;
    }
    
    public double calcularGanancias(int M){
        double aux = 0;
        int i;
        for (i= 0; i < dimLs[M]; i++)
            aux += agenda[M][i].calcularGananciaConcierto();
        return aux;
    }
    
    @Override
    public String toString(){
      String aux = "Estadio: " + nombre + direccion + capacidad + "\n";    
      int i;
      for (i = 0 ; i < 11 ; i ++){        
          aux += "Mes  " + (i+1) + "\n";
          int j;
          for (j = 0 ; j < dimLs[i]; j++)
              aux += "Dia  " + (j+1) + agenda[i][j].toString();  
         }
      return aux;
    }
}
