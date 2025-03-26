/*
 * Un estacionamiento conoce su 
    nombre, dirección, hora de apertura, hora de cierre, y almacena para cada número de piso 
    (1..N) y número de plaza (1..M), el auto que ocupa dicho lugar

    Implemente constructores. En particular, para el estacionamiento:
-   Un constructor debe recibir nombre y dirección, e iniciar el estacionamiento 
    con hora de apertura “8:00”, hora de cierre “21:00”, y para 5 pisos y 10 plazas 
    por piso. El estacionamiento inicialmente no tiene autos. 
-   Otro constructor debe recibir nombre, dirección, hora de apertura, hora de 
    cierre, el número de pisos (N) y el número de plazas por piso (M) e iniciar el 
    estacionamiento con los datos recibidos y sin autos. 
 */
package gallomartiniano2;

/**
 *
 * @author Usuario
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private int horaApertura;
    private int horaCierre;
    private Auto [][] lugares;

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = 8;
        this.horaCierre = 21;
        this.lugares = new Auto [5] [10];  // no lo inicilizo en null porque lo hace java y porque no tiene autos
    }

    public Estacionamiento(String nombre, String direccion, int horaApertura, int horaCierre , int N , int M) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.lugares = new Auto [N][M];
    }
    
    
    
}
