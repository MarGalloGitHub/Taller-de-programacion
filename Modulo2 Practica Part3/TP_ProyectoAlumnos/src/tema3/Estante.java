/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Usuario
 */
public class Estante {
    private Libro [] estante;
    private int dLog;
    
    
    public Estante( ){                  // preguntar
        this.dLog = 0;
        estante = new Libro [20];
        
        
    }
    
    public int getCantLibros(){     // i)
        return dLog;
    }
    
    public boolean estaLLeno(){    //ii)
        return (dLog == 20);
    }
    
    public void agregarLibro(Libro unLibro){  //iii)
        estante[dLog] = unLibro;
        this.dLog ++;
    }
    
    public Libro devolverLibro(String unTitulo){    //iv)
        Libro aux = null;   // preguntar
        int i = 0;
        while ((i < 19) &&(!(estante[i].getTitulo()).equals(unTitulo)))
            i++;
        if(estante[i].getTitulo().equals(unTitulo))
            aux = estante[i];
   
        return aux;
    }
    
    
}
