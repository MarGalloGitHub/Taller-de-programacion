/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**                           preguntar
 *
 * @author Usuario
 */
public class Autor {
    private String nombre;
    private String biografia;
    private String origen;
    
    public Autor(String unNombre,String unaBiografia,String unOrigen){
        nombre = unNombre;
        biografia = unaBiografia;
        origen = unOrigen;
    }
    
    public void setNombre(String unNombre){
        nombre = unNombre;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public void setBiografia(String unaBiografia){
        biografia = unaBiografia;
    }
    
    public String getBiografia(){
        return biografia;
    }
    
    public void setOrigen(String unOrigen){
        origen = unOrigen;
    }
    public String getOrigen(){
        return origen;
    }
    
    @Override
    public String toString(){
        String aux = "el nombre del autor es:  " + nombre + ", su biografia dice: "+ biografia + " y por ultimo su origen: "+ origen;
        return aux;
    }
    
}
