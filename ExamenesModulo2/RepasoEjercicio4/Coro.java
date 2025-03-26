/*
 Los coros poseen 
un nombre y están formados por un director y una serie de coristas.

a. Implemente las clases necesarias teniendo en cuenta que los coros deberían crearse 
con un director y sin ningún corista, pero sí sabiendo las dimensiones del coro.


 */
package RepasoEjercicio4;

/**
 *
 * @author Usuario
 */
public abstract class Coro {
    private String nombre;
    private Director director;

    public Coro(String nombre, Director director) {
        this.nombre = nombre;
        this.director = director;
    }
    
    /*
    b. Implemente métodos (en las clases donde corresponda) que permitan:
     agregar un corista al coro. 
    */
    
    public abstract void agregarCorista(Corista unCorista);
    
    /*
     determinar si un coro está lleno o no. Devuelve true si el coro tiene a todos sus 
    coristas asignados o false en caso contrario.
    */
    
    public abstract boolean estaLlenoMaybe();
    
    public abstract boolean bienOrganizado();
    
    @Override
    public String toString(){
        String aux = "Informacion del coro:   " + "\n" + "Nombre del coro: " + this.nombre + "\n" + "El nombre del director es: " + this.director.toString();
        return aux;
    }
}
