/*
 Un objeto visor de figuras se encarga de mostrar en consola cualquier figura que reciba 
y también mantiene cuántas figuras mostró. Analice y ejecute el siguiente programa y 
responda: ¿Qué imprime? ¿Por qué?

Mirar tp para comandos

Tuve que cambiar los toString para que devolviera algo concreto, de no usar los toString personalizados 
devolvia algo raro que tendria que preguntar

 */
package Tema4Ejercicio4;

/**
 *
 * @author Usuario
 */
public class Ejercicio4 {
    public static void main(String[] args){
        VisorFiguras visor = new VisorFiguras();
        
        Cuadrado cuadrado1 = new Cuadrado(10,"violeta","rosa");
        Rectangulo rectangulo1 = new Rectangulo(20,10,"azul","celeste");
        Cuadrado cuadrado2 = new Cuadrado(30,"rojo","naranja");
        
        visor.mostrar(cuadrado1);
        visor.mostrar(rectangulo1);
        visor.mostrar(cuadrado2);
        
        System.out.println(visor.getMostradas());
    }
}
