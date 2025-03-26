/*
Un estacionamiento conoce su 
nombre, dirección, hora de apertura, hora de cierre, y almacena para cada número de piso 
(1..N) y número de plaza (1..M), el auto que ocupa dicho lugar.

Un constructor debe recibir nombre y dirección, e iniciar el estacionamiento 
con hora de apertura “8:00”, hora de cierre “21:00”, y para 5 pisos y 10 plazas 
por piso. El estacionamiento inicialmente no tiene autos. 

- Otro constructor debe recibir nombre, dirección, hora de apertura, hora de 
cierre, el número de pisos (N) y el número de plazas por piso (M) e iniciar el 
estacionamiento con los datos recibidos y sin autos. 

Dado un auto A, un número de piso X y un número de plaza Y, registrar al auto 
en el estacionamiento en el lugar X,Y. Suponga que X, Y son válidos (es decir, 
están en rango 1..N y 1..M respectivamente) y que el lugar está desocupado.

- Dada una patente, obtener un String que contenga el número de piso y plaza 
donde está dicho auto en el estacionamiento. En caso de no encontrarse, 
retornar el mensaje “Auto Inexistente”.

- Obtener un String con la representación del estacionamiento. Ejemplo: “Piso 1 
Plaza 1: libre Piso 1 Plaza 2: representación del auto … 
 Piso 2 Plaza 1: libre … etc”

- Dado un número de plaza Y, obtener la cantidad de autos ubicados en dicha 
plaza (teniendo en cuenta todos los pisos).

 */
package RepasoEjercicio2;

/**
 *
 * @author Usuario
 */
public class Estacionamiento {
    private String nombre;
    private int direccion;
    private int horaApertura;
    private int horaCierre;
    private Auto[][] autosDisposicion;
    private int pisos;
    private int plazas;

    public Estacionamiento(String nombre, int direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = 8;
        this.horaCierre = 21;
        autosDisposicion = new Auto[5][10];   // no inicio en null porque lo hace java
        
    }

    public Estacionamiento(String nombre, int direccion, int horaApertura, int horaCierre, int Pisos, int plazas) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        autosDisposicion = new Auto[Pisos][plazas];
        this.pisos = Pisos;
        this.plazas = plazas;                                     // preguntar por esto
    }
    
    
    public void registrarAuto(Auto A, int X, int Y){
        if(autosDisposicion[X-1][Y-1] == null){
            autosDisposicion[X-1][Y-1] = A;
        }
    }

    /*
     Dada una patente, obtener un String que contenga el número de piso y plaza 
    donde está dicho auto en el estacionamiento. En caso de no encontrarse, 
    retornar el mensaje “Auto Inexistente”.
    */
    
    public String encontrarAuto1(int patente){
        String aux = "Auto Inexistente";
        int i = 0;
        int j = 0;
        while((i<=4) && (autosDisposicion[i][j].getPatente() != patente)){
            while((j<=9) && (autosDisposicion[i][j].getPatente() != patente)){
                j++;
            }
            i++;
        }
        if(autosDisposicion[i][j].getPatente() == patente){
            aux = "El piso es: " + (i + 1) + ", y esta en la plaza: " + (j+1);
        }
        return aux;
    }
    
    public String encontrarAuto2(int patente){
        String aux = "Auto Inexistente";
        int i = 0;
        int j = 0;
        while((i<=(this.getPisos() - 1)) && (autosDisposicion[i][j] != null)){
            j = 0;
            while((j<=(this.getPlazas()- 1)) && (autosDisposicion[i][j] != null)){
                if((autosDisposicion[i][j].getPatente() == patente)){
                    aux = "El piso es: " + (i + 1) + ", y esta en la plaza: " + (j+1);
                }
                j++;
            }
            i++;
        }
        return aux;
    }
    
    /*
    Obtener un String con la representación del estacionamiento. Ejemplo: “Piso 1 
    Plaza 1: libre Piso 1 Plaza 2: representación del auto … 
    Piso 2 Plaza 1: libre … etc
    */
    
    public String toStringCaso1(){
       String aux = "Dispocision del estacionamiento:  " + "\n";
       int i;
       int j;
       for(i=0;i<=4;i++){
           for(j=0;j<=9;j++){
               aux+= "En el piso: " + (i+1) + ", y en la plaza: " + (j+1) + " : ";
               if(autosDisposicion[i][j] != null){
                   aux+= "Esta el auto con esta descripcion: " + autosDisposicion[i][j].toString() + "\n";
               }
               else
                   aux+= "No hay ningun auto" + "\n";
           }
       }
       return aux;
    }
    
    public String toStringCaso2(){
       String aux = "Dispocision del estacionamiento:  " + "\n";
       int i;
       int j;
       for(i=0; i <=(pisos - 1);i++){
           for(j=0; j <= (plazas - 1);j++){
               aux+= "En el piso: " + (i+1) + ", y en la plaza: " + (j+1) + " : ";
               if(autosDisposicion[i][j] != null){
                   aux+= "Esta el auto con esta descripcion: " + autosDisposicion[i][j].toString() + "\n";
               }
               else
                   aux+= "No hay ningun auto" + "\n";
           }
       }
       return aux;
    }
    
    /*
    Dado un número de plaza Y, obtener la cantidad de autos ubicados en dicha 
    plaza (teniendo en cuenta todos los pisos)
    */
    
    public int obtenerAutosPlaza1(int Y){
        int aux = 0;
        int i;
        for(i=0;i<=4;i++){
            if(autosDisposicion[i][Y] != null){
                aux++;
            }
        }
        return aux;
    }
    
    public int obtenerAutosPlaza2(int Y){
        int aux = 0;
        int i;
        for(i=0;i<=(pisos - 1);i++){
            if(autosDisposicion[i][Y] != null){
                aux++;
            }
        }
        return aux;
    }

    public int getPisos() {
        return pisos;
    }

    public int getPlazas() {
        return plazas;
    }
    
}
