/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialconcursos;

/**
 *
 * @author Usuario
 */
public class ParcialConcursos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Concurso concur = new Concurso(20);
        
        Alumno alu1 = new Alumno("pepito",12,"arpa");
        int anoto1 = 2;
        Alumno alu2 = new Alumno("rodolfo",15,"guitarra");
        Alumno alu3 = new Alumno("guido",16,"trompeta");
        int anoto3 = 4;
        Alumno alu4 = new Alumno("miriam",17,"teclado");
        int anoto4 = 5;
        Alumno alu5 = new Alumno("victor",18,"tuba");
        int anoto5 = 1;
        
       concur.inscribirAlumno(alu1, anoto1);
       double nota1 = 2;
       concur.asignarPuntaje(nota1, "pepito");
       concur.inscribirAlumno(alu2, anoto1);
       double nota2 = 4;
       concur.asignarPuntaje(nota2, "rodolfo");
       concur.inscribirAlumno(alu3, anoto3);
       double nota3 = 6;
       concur.asignarPuntaje(nota3, "guido");
       concur.inscribirAlumno(alu4, anoto4);
       double nota4 = 8;
       concur.asignarPuntaje(nota4, "miiriam");
       concur.inscribirAlumno(alu5, anoto5);
       double nota5 = 9;
       concur.asignarPuntaje(nota5, "victor");
       
       System.out.println(concur.devolverGenero());
        
    }
    
}
