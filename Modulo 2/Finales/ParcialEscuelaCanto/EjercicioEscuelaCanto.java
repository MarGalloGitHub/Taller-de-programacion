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
import PaqueteLectura.Lector;
public class EjercicioEscuelaCanto {
    public static void main(String[] args){
        Concurso concurso1 = new Concurso(3,5);
        
        int i;
        for(i=0 ; i <= 4; i++){
            System.out.println("cargue los datos para una cancion: NOMBRE, COMPOSITOR E IDENTIFICADOR UNICO" + "\n");
            Cancion cancion1 = new Cancion(Lector.leerString(),Lector.leerString(),Lector.leerInt());
            System.out.println("A cual de las 3 categorias deberia agregar esta cancion? ");
            concurso1.agregarCancion(cancion1, Lector.leerInt());
        }
        
        System.out.println("cargue los datos para un estudiante: NOMBRE, APELLIDO, DNI + UN IDENTIFICADOR DE CANCION Y PUNTAJE OBTENIDO" + "\n");
        Estudiante estudiante1 = new Estudiante(Lector.leerString(),Lector.leerString(),Lector.leerInt());
        int identificador1 = Lector.leerInt();
        double puntajeObtenido = Lector.leerDouble();
        while(identificador1 != 0){
            concurso1.interpretarCancion(identificador1, estudiante1, puntajeObtenido);
            System.out.println("cargue los datos para un estudiante: NOMBRE, APELLIDO, DNI + UN IDENTIFICADOR DE CANCION Y PUNTAJE OBTENIDO" + "\n");
            estudiante1 = new Estudiante(Lector.leerString(),Lector.leerString(),Lector.leerInt());
            identificador1 = Lector.leerInt();
            puntajeObtenido = Lector.leerDouble();
            
        }
        
        System.out.println("cargue un identificador de cancion ");
        int identi5 = Lector.leerInt();
        Estudiante estudi1 = concurso1.conocerEstudianteGanador(identi5);
        if(estudi1 == null){
            System.out.println("nadie mi rey " + "\n");
        }
        else
            System.out.println(estudi1.toString() + "\n");
        
        int j;
        
        for(j= 0 ; j<= 2 ; j++){
            System.out.println("El nombre de la cancion mejor interpretada en la categoria: " + (j+1) + "  es:  " + concurso1.conocerCancionMaxPuntajeCategoria(j).getNombre() +"\n");
            System.out.println("Y su compositor es: " + concurso1.conocerCancionMaxPuntajeCategoria(j).getCompositor() +"\n");
        }
    
    }
    
}
