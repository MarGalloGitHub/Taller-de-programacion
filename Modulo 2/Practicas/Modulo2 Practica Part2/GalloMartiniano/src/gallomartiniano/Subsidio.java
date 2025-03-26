/*
 * De cada subsidio se conoce: el monto pedido, el motivo y si fue
    otorgado o no.

    c. Un subsidio sólo debería poder construirse con el monto pedido y el motivo. 
    Un subsidio siempre se crea en estado no-otorgado.
 */
package gallomartiniano;

/**
 *
 * @author Usuario
 */
public class Subsidio {
    private double Monto;
    private String motivo;
    private boolean otorgado;

    public Subsidio(double Monto, String motivo) {
        this.Monto = Monto;
        this.motivo = motivo;
        this.otorgado = false;
    }
    
    public double moneySubsidio(){
        double aux = this.Monto;
        return aux;
    }
    
    public void acomodoarSubsidio(){
        this.otorgado = true;
    }
    
}
