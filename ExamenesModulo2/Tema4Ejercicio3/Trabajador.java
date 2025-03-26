/*
trabajadores, estos son 
personas que se caracterizan además por la tarea realizada en el predio.
 */
package Tema4Ejercicio3;

/**
 *
 * @author Usuario
 */
public class Trabajador extends Persona{
    private String tarea;

    public Trabajador(String tarea, String nombre, int DNI, int edad) {
        super(nombre, DNI, edad);
        this.tarea = tarea;
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }
    
    @Override
    public String toString(){
        String aux = super.toString() + "  y soy  " + this.tarea;
        return aux;
    }
    
}
