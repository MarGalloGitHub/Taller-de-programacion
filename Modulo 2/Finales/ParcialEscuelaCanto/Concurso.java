/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialEscuelaCanto;

/**
 *
 * @author Usuario
 */
public class Concurso {
    private int cantidadCategorias;
    private int cantidadMaximaPorCategorias;
    private Cancion[][] disposicion;
    private int[] dimensiones;

    public Concurso(int cantidadCategorias, int cantidadMaximaCategorias) {
        this.cantidadCategorias = cantidadCategorias;
        this.cantidadMaximaPorCategorias = cantidadMaximaCategorias;
        dimensiones = new int[cantidadCategorias];
        for(int i=0 ; i <= (cantidadCategorias - 1) ; i++){
            dimensiones[i] = 0;
        }
        disposicion = new Cancion[cantidadCategorias][cantidadMaximaCategorias]; // no inicializo en null porque lo hace java
    }
    
    public void agregarCancion(Cancion cancion1, int categ){
        int i = 0;
       if(categ <= (cantidadCategorias - 1)){
            if(dimensiones[categ - 1] <= (cantidadMaximaPorCategorias - 1)){
                disposicion[categ - 1][dimensiones[categ - 1]] = cancion1;
                dimensiones[categ - 1]++;
            }
       }
    }
     public void interpretarCancion(int identificador1, Estudiante estudiante1, double puntajeOtorgado){
         int i = 0;
         int j = 0;
         boolean encontre = false;
         while((encontre == false) && (i<= cantidadCategorias - 1 )){
             j = 0;
             while((encontre == false) && (j<= ((dimensiones[i] - 1)) )){
                 if(disposicion[i][j] != null){
                     if(disposicion[i][j].getIdentificador() == identificador1){
                         encontre = true;
                     }
                 }
                 j++;
             }
             i++;
         }
         if(encontre == true){
             if(disposicion[i-1][j-1].getPuntaje() < puntajeOtorgado){
                 disposicion[i-1][j-1].setPuntaje(puntajeOtorgado);
                 disposicion[i-1][j-1].setEstudianteGanador(estudiante1);
             }
         }
         
     }
     // PREGUNTAR COMO APLICA EL SEGURO EXISTE O NO EXISTE
     
     public Estudiante conocerEstudianteGanador(int identi1){
         Estudiante aux = null;
         int i = 0;
         int j = 0;
         boolean encontre = false;
         while((encontre == false) && (i<= cantidadCategorias - 1 )){
             j = 0;
             while((encontre == false) && (j<= ((dimensiones[i] - 1)) )){
                 if(disposicion[i][j] != null){
                     if(disposicion[i][j].getIdentificador() == identi1){
                         encontre = true;
                     }
                 }
                 j++;
             }
             i++;
         }
         if(encontre == true){
             aux = disposicion[i - 1][j - 1].getEstudianteGanador() ;
         }
         return aux;
      }
     
     
     public Cancion conocerCancionMaxPuntajeCategoria(int categoria){
         Cancion aux = null;
         if(categoria <= (cantidadCategorias) - 1){
             int i;
             double maxPuntaje = 0;
             for(i=0 ; i<= (dimensiones[categoria]); i++){
                 if(disposicion[categoria][i].getPuntaje() > maxPuntaje){
                     maxPuntaje = disposicion[categoria][i].getPuntaje();
                     aux = disposicion[categoria][i];
                 }
             }
         }
         return aux;
     }
     
}
