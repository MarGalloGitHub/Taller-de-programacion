/*
 5-A- Modifique la clase VisorFiguras: ahora debe permitir guardar las figuras a mostrar (a 
lo sumo 5) y también mostrar todas las figuras guardadas. Use la siguiente estructura

B- Realice un programa que instancie el visor, guarde dos cuadrados y un rectángulo en el 
visor y por último haga que el visor muestre sus figuras almacenadas


Mirar tp para ver comandos y codigo a usar

 */
package Tema4Ejercicio5;

/**
 *
 * @author Usuario
 */
public class Ejercicio5 {
    public static void main(String[] args){
        VisorFiguras visor1 = new VisorFiguras();
        
        Cuadrado cuadrado1 = new Cuadrado(10,"violeta","rosa");
        Rectangulo rectangulo1 = new Rectangulo(20,10,"azul","celeste");
        Cuadrado cuadrado2 = new Cuadrado(30,"rojo","naranja");
        
        visor1.guardar(cuadrado1);
        visor1.guardar(rectangulo1);
        visor1.guardar(cuadrado2);
        
        System.out.println("la cantidad de figuras guardas es de :  " + visor1.getGuardadas());
        if(visor1.quedaEspacio()){
            System.out.println("queda espacio");
        }
        else
            System.out.println("no queda espacio");
       
        visor1.mostrar();
    }
}
