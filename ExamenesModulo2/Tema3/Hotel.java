/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tema3;

/**
 *
 * @author Usuario
 */
public class Hotel {
    private Habitacion [] habitaciones;  // un arreglo de habitaciones
    private int cantidadHabitaciones;   // cuantas habitaciones tiene el hotel

    public Hotel(int cantidadHabitaciones) {
        this.cantidadHabitaciones = cantidadHabitaciones;  //cuantas habitaciones
        habitaciones = new Habitacion[cantidadHabitaciones];  // crear arreglo con cantidad de habitaciones
        for (int i= 0; i<= (cantidadHabitaciones - 1); i++){       //arreglo para crear habitaciones vacias
            habitaciones[i] = new Habitacion();           
        }
    }

    public int getCantidadHabitaciones() {
        return cantidadHabitaciones;
    }
    
    public void aumentarPrecio(double x){
        int i;
        for(i=0; i<= (cantidadHabitaciones - 1); i++){
            double aux = habitaciones[i].getCostoXnoche() + x;
            habitaciones[i].setCostoXnoche(aux);
        }
    }
    
    public void ingresarCliente(Cliente cliente1, int numHabitacion){
        habitaciones[numHabitacion - 1].setCliente(cliente1);
        habitaciones[numHabitacion - 1].setOcupada(true);  
    }
    
    @Override
    public String toString(){
        String aux = "Datos del hotel     \n";
        for (int i = 0; i<= (cantidadHabitaciones - 1); i++){
            if(habitaciones[i].isOcupada() == true){
                aux += "La habitacion:  " + (i + 1) + "    cuesta por noche:    " +  habitaciones[i].getCostoXnoche()+ "   ,  esta ocupada y los datos del cliente son:     " + "su nombre es : " +habitaciones[i].getCliente().getNombre() + " su dni es:  " +habitaciones[i].getCliente().getDni()+"   y su edad es:   " + habitaciones[i].getCliente().getEdad() + "\n";
                }
             else
                aux+= "La habitacion:   "+ (i+1) + "   cuesta por noche:    " +  habitaciones[i].getCostoXnoche()+ "    y esta desocupada  \n";
            }
            
       return aux;
    }
    
}
