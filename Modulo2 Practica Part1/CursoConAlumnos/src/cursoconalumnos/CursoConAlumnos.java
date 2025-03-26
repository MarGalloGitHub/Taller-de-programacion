/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cursoconalumnos;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class CursoConAlumnos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        System.out.print("escriba el link de la clase");
        String link = Lector.leerString();  //cursos
        System.out.print("escriba numero del aula");
        int numAula = Lector.leerInt();
        System.out.print("escriba año de cursada");
        int anioCursada = Lector.leerInt();
        System.out.print("escriba cantidad maxima de alumnos");
        int cantAlumnos = Lector.leerInt();
        
        CursoDistancia curso1 = new CursoDistancia(link,anioCursada,cantAlumnos);
        CursoPresencial curso22 = new CursoPresencial(numAula,anioCursada,cantAlumnos);
        
        
        int i;
        
        for (i = 0 ; i < 3 ; i ++){
            
            System.out.print("escriba dni del alumno");
            int dni = Lector.leerInt();
            System.out.print("escriba nombre del alumno");
            String nom = Lector.leerString();
        
            Alumno alu = new Alumno(dni,nom);
        
            curso1.agregarAlumno(alu);
            curso22.agregarAlumno(alu);
        
        }
        
        System.out.println("Cantidad de alumons a cursar de curso1 : " + curso1.cantidadDeAlumnosQuePuedeRendir() + "   lo mismo del turno 2  " +   curso22.cantidadDeAlumnosQuePuedeRendir());
    }
    
}
